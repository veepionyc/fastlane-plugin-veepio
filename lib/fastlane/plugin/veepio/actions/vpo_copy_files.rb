require "java-properties"

module Fastlane
  module Actions
    class VpoCopyFilesAction < Action

      def self.run(params)
        _from = params[:from]
        _to = params[:to]
        _preserve = false
        _dereference_root = false
        _remove_destination = true
        FileUtils.copy_entry _from, _to, _preserve, _dereference_root, _remove_destination
        UI.message("copied: #{_from} to:  #{_to}")
      end

      def self.description
        "get Android project version code in version.properties file for gradle project"
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :from,
                                       description: "source file or directory",
                                       is_string: true),

         FastlaneCore::ConfigItem.new(key: :to,
                                      description: "destination file or directory",
                                      is_string: true)

        ]
      end

      def self.authors
        # So no one will ever forget your contribution to fastlane :) You are awesome btw!
        ["foundry"]
      end

      def self.is_supported?(platform)
        true
      end
    end
  end
end
