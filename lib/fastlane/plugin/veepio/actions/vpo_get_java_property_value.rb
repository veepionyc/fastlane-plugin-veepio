require "java-properties"

module Fastlane
  module Actions
    class VpoGetJavaPropertyValueAction < Action

      def self.run(params)
        _properties_path = params[:path]
        _key = params[:key]
        _properties = JavaProperties.load(_properties_path)
        _value = _properties[:"#{_key}"]
        UI.message("propertyKey:#{_key} value:#{_value}")

      end

      def self.description
        "read key val from java properties file"
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :path,
                                       description: "paths to property file",
                                       is_string: true),
          FastlaneCore::ConfigItem.new(key: :key,
                                       description: "property key",
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
