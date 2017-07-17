require "java-properties"

module Fastlane
  module Actions
    class VpoSetAndroidVersionNameAction < Action

      def self.run(params)
        _project_path = params[:project]
        _properties_path = "#{_project_path}/version.properties"
        _properties = JavaProperties.load(_properties_path)
        _properties[:versionName] = "#{params[:versionName]}"
        JavaProperties.write(_properties, _properties_path)
        UI.message("set versionName: #{params[:versionName]}")
      end

      def self.description
        "set Android project version name in version.properties file for gradle project"
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :project,
                                       description: "path to project",
                                       is_string: true),
         FastlaneCore::ConfigItem.new(key: :versionName,
                                      description: "versionName",
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
