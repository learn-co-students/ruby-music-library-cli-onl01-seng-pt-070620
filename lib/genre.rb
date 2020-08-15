require_relative '../lib/concerns/findable'

class Genre
    extend Concerns::Findable
    attr_accessor :name, :artist, :song
  
    @@all = []
  
    def initialize(name)
      @name = name
      @songs = []
      save
    end
  
    def save
      @@all << self
    end
  
    def self.all
      @@all
    end
  
    def self.destroy_all
      @@all = []
    end
  
    def self.create(genre)
      newGenre = Genre.new(genre)
      newGenre
    end
  
    def songs
      @songs
    end
  
    def add_song(song)
      if !@songs.include?(song)
        @songs << song
        song.genre = self unless song.genre
      end
    end
  
    def artists
      artists = Song.all.map {|song| song.artist}
      artists.uniq
    end
  
  
  end
  