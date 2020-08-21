class Song

    attr_accessor :name, :artist

    @@all = []

    def initialize(name, artist = "artist")
        @name = name
        @artist = artist
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

    def self.create
        self.new
        save
    end


end