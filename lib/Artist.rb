require 'pry'
class Artist

    attr_accessor :name, :song, :new_artist

    @@all = []
    def initialize(name)
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

    def self.create(name)
        # binding pry
        name = Artist.new(name) 
        name.save
        name
    end

end