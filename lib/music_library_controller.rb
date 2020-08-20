class MusicLibraryController 
    def initialize(path= "./db/mp3s")
        mi = MusicImporter.new(path)
        mi.import
    end
    def call

    end 
end 