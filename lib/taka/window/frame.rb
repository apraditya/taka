module Taka
  class Window
    class Frame < Window
      def contentWindow
        parent
      end
    end
  end
end