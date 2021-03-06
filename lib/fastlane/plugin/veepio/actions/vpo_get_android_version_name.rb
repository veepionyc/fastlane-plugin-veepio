require "java-properties"

module Fastlane
  module Actions
    class VpoGetAndroidVersionNameAction < Action

      def self.versionName( _properties_path)
        properties = JavaProperties.load(_properties_path)
        versionName = properties[:versionName]
      end

      def self.run(params)
        _project_path = params[:project]
        _properties_path = "#{_project_path}/version.properties"
        UI.message("version name: #{versionName(_properties_path)}")
        versionName(_properties_path)
      end

      def self.description
        "get Android project version name in version.properties file for gradle project"
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :project,
                                       description: "path to project",
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
