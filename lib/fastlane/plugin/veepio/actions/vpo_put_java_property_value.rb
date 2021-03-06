require "java-properties"

module Fastlane
  module Actions
    class VpoPutJavaPropertyValueAction < Action

      def self.run(params)
        UI.message("path:#{params[:path]} key:#{params[:key]} value:#{params[:value]}")
        _properties_path = params[:path]
        _key = params[:key]
        _value = params[:value]
        _properties = JavaProperties.load(_properties_path)
       _properties[:"#{_key}"] = _value
        JavaProperties.write(_properties, _properties_path)
        UI.message("success: write propertyKey:#{_key} value:#{_value}")
      end

      def self.description
        "write key val to java properties file"
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :path,
                                       description: "path to property file",
                                       is_string: true),
          FastlaneCore::ConfigItem.new(key: :key,
                                       description: "property key",
                                       is_string: true),
         FastlaneCore::ConfigItem.new(key: :value,
                                      description: "property value",
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
