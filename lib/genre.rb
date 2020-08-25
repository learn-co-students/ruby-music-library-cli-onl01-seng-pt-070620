require 'pry'

class Genre

    extend Concerns::Findable

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

    def self.create(genre_name)
        genre = self.new(genre_name)
        genre.save
        genre
    end

    def artists
        self.songs.collect{|song| song.artist}.uniq
    end

end