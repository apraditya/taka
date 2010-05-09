module Taka
  class Window
    class Console
      def log(*args)
        # p args.first.item(0)
        @log ||= []
        args.empty? ? @log : @log << args
      end

      alias_method :debug, :log
      alias_method :info,  :log
      alias_method :warn,  :log
      alias_method :error, :log
      
      def print
        log.each do |line|
          puts line.map { |arg| arg.to_s }.join(', ')
        end
      end
    end
  end
end