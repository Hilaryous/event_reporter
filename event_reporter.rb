require 'csv'
Dir["./lib/*.rb"].each { |file| require "#{file}" }

CLI.run
