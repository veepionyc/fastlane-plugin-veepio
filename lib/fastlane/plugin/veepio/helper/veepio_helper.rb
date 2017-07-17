module Fastlane
  module Helper
    class VeepioHelper
      # class methods that you define here become available in your action
      # as `Helper::VeepioHelper.your_method`
      #
      def self.show_message
        UI.message("Hello from the veepio plugin helper!")
      end
    end
  end
end
