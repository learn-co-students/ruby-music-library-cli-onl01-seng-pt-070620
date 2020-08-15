require 'pry'
require_relative "../config/environment.rb"

class MusicImporter

    def initialize(path)
        @path = path
    end

    def path
        @path = "./spec/fixtures/mp3s"
    end

    def files
        Dir.chdir(@path) do |file| 
            file = Dir.glob("*.mp3")
        end
    end

    def import
        new_file = self.files
        self.files.each {|filename|Song.create_from_filename(filename)}
    end
end