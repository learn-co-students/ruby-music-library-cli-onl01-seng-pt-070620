class MusicLibraryController 
    def initialize(path= "./db/mp3s")
        mi = MusicImporter.new(path)
        mi.import
    end
    def call

        def list_songs 
            Song.all.sort {|a,b| a.name <=> b.name}.each_with_index do |s,i| 
                puts " #{i+1}. #{s.name} - #{s.artist} - #{s.genre}"
        end 
    end 
end 