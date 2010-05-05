module Taka
  module EventTarget
    def addEventListener(type, listener, use_capture = false)
      listeners = self.listeners(type, use_capture)
      listeners << listener unless listeners.include?(listener)
    end

    def removeEventListener(type, listener, use_capture = false)
      listeners = self.listeners(type, use_capture)
      listeners.delete(listener)
    end

    def dispatchEvent(event)
      raise 'event can not be nil' if event.nil? # TODO what's a better exception?
      if event.type.nil? || event.type.to_s.empty?
        raise Taka::EventException.new(Taka::EventException::UNSPECIFIED_EVENT_TYPE_ERR)
      end
      
      event.target = self
      ancestors.reverse.dup.each { |ancestor| ancestor._dispatch(Event::CAPTURING_PHASE, event) }
      _dispatch(Event::AT_TARGET, event)
      # evaluate_js(self["on#{event.type}"]) if self["on#{event.type}"]
      ancestors.dup.each { |node| node._dispatch(Event::BUBBLING_PHASE, event) } if event.bubbles
      # execute_default_event_behaviour unless event.cancelled
      
      event.cancelled
    end

    protected

      def _dispatch(phase, event)
        return if event.propagation_stopped

        event.eventPhase = phase
        event.currentTarget = self

        listeners(event.type, event.eventPhase == Event::CAPTURING_PHASE).dup.each do |listener|
          event.stopPropagation unless listener.handleEvent(event)
          break if event.propagation_stopped
        end
      end

      def listeners(type, use_capture)
        phase = use_capture ? Event::CAPTURING_PHASE : Event::BUBBLING_PHASE
        @listeners ||= {}
        @listeners[type] ||= {}
        @listeners[type][phase] ||= []
      end
  end
end