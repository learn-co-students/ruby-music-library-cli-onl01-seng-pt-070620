class Song

    attr_accessor :name, :artist, :genre

    @@all = []
    def initialize(name)
        @name = name
        @artist = artist
        @@all << self 
    end

    def self.all
        @@all
    end

    def self.destroy_all
        self.all.clear
    end

    def save
        self.class.all << self
    end

    def self.create
        song = Song.create
        Song.all.include?(song)
    end
    
end