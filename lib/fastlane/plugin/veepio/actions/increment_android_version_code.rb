require "java-properties"

module Fastlane
  module Actions
    class IncrementAndroidVersionCodeAction < Action

      def self.versionName( _properties_path)
          properties = JavaProperties.load(_properties_path)
          versionName = properties[:versionName]
      end

      def self.versionCode( _properties_path)
        properties = JavaProperties.load(_properties_path)
        versionCode = properties[:versionCode]
      end

      def self.incrementVersionCode(_properties_path)
        properties = JavaProperties.load(_properties_path)
        versionCode = properties[:versionCode]
        versionCode = versionCode.to_i + 1
        properties[:versionCode] = "#{versionCode}"
        JavaProperties.write(properties, _properties_path)

      end


      def self.run(params)
        _project_path = params[:project]
        _properties_path = "#{_project_path}/version.properties"
        incrementVersionCode(_properties_path)
        UI.message("incremented version code:#{versionCode(_properties_path)}")
      end

      def self.description
        "increment Android project version code in version.properties file for gradle project"
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :project,
                                       description: "path to project",
                                       is_string: true),
          FastlaneCore::ConfigItem.new(key: :password,
                                       description: "maven password",
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
