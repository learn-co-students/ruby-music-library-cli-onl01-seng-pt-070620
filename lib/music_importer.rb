require 'pry'
class MusicImporter 
    attr_accessor :path
    def initialize(path)
        @path= path
        #binding.pry
    end 
    def files
        #binding.pry
        @files = Dir.entries(@path)
        @files.delete_if {|file| file == ".." || file == "."}
        # binding.pry
    
    end 
    #imports the files into the library by invoking Song.create_from_filename
    def import
        self.files.each {|file| Song.create_from_filename(file)} 
    end 
end