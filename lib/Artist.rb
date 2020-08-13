class Artist

    attr_accessor :name, :songs

    @@all = []
    def initialize(name, songs)
        @name = name
        @@all << self
        @songs = []
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

end