class Artist
    extend Concerns::Findable 
    @@all = []
    attr_accessor :name
    attr_reader :songs
    def initialize(name)
        @name= name 
        @songs = []
        save 
    end
    def add_song(song)
        #if song.artist == nil
        if song.artist != self || song.artist == nil  
            song.artist = self 
        end
        if !@songs.include?(song)
            @songs << song

        end 
        #artist.songs << song 
        #song.artist = self unless song.artist != nil
    end  
    # genres returns a collection of genres for all of the artist's songs (artist has many genres through songs) 
    # does not return duplicate genres if the artist has more than one song of a particular genre (artist has many genres through songs) 
    def genres 
        @songs.collect {|song| song.genre}.uniq 

    end 
    def save
        @@all << self  
    end 
    def self.all 
        @@all 
    end 
    def self.destroy_all 
        self.all.clear 
    end 
    def self.create(name)
        self.new(name)
        
    end 
end 