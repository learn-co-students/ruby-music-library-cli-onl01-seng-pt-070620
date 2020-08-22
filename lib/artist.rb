class Artist

    attr_accessor :name, :songs

    @@all = []

    def initialize(name)
        @name = name
        @songs = []
        save
    end

    def self.all
        @@all
    end

    def save
        @@all << self
    end

    def self.destroy_all
        @@all.clear
    end

    def self.create(artist_name)
        artist = self.new(artist_name)
        artist.save
        artist
    end

    def add_song(song)
        song.artist = self unless song.artist
        songs << song unless songs.include?(song)
    end

    def genres
        songs.collect{|s| s.genre}.uniq
    end

end