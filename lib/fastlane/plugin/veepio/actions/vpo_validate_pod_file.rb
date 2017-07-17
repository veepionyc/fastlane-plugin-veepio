require "fastlane"

module Fastlane
    module Actions
        module SharedValues
            VALIDATE_POD_FILE_CUSTOM_VALUE = :VALIDATE_POD_FILE_CUSTOM_VALUE
        end

        puts "module Fastlane"




        class ValidatePodFileAction < Action

            def self.validate
                result = true
                File.foreach( 'Podfile' ) do |line|
                    #binding.pry

                    if line =~ /^[^\#]+=>/
                        puts "invalidated"
                        puts line

                        result = false
                    end
                end

                if result == false
                    puts "pod file failed to validate"
                end
                result
            end

            def self.validate_new
                puts `pwd`
                puts "validating.."
                result = true

                result
            end




            def self.run(params)
            # fastlane will take care of reading in the parameter and fetching the environment variable:
            UI.message "Validating pod file "

            # sh "shellcommand ./path"

            # Actions.lane_context[SharedValues::VALIDATE_POD_FILE_CUSTOM_VALUE] = "my_val"
                if !validate
                    raise "this is an error"
               end
            end



            #####################################################
            # @!group Documentation
            #####################################################

            def self.description
            "Checks podfile for live links to developer frameworks"
            end

            def self.details
            # Optional:
            # this is your chance to provide a more detailed description of this action
            "Linking to live dev frameworks causes havoc with testing"
            end

            def self.available_options
            # Define all options your action supports.

            end

            def self.output
            # Define the shared values you are going to provide
            # Example
            [
            ['VALIDATE_POD_FILE_CUSTOM_VALUE', 'A description of what this value contains']
            ]
            end

            def self.return_value
            # If you method provides a return value, you can describe here what it does
            end

            def self.authors
            # So no one will ever forget your contribution to fastlane :) You are awesome btw!
            ["foundry.github.io"]
            end

            def self.is_supported?(platform)
            # you can do things like
            #
            #  true
            #
            #  platform == :ios
            #
            #  [:ios, :mac].include?(platform)
            #

            platform == :ios
            end
        end
    end
end
