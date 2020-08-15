require_relative '../lib/concerns/findable'

class Artist
    extend Concerns::Findable
    attr_accessor :name, :song, :genre
  
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
  
    def self.create(artist)
      newArtist = Artist.new(artist)
      newArtist
    end
  
    def songs
      @songs
    end
  
    def add_song(song)
      if !@songs.include?(song)
        @songs << song
        song.artist = self unless song.artist
      end
    end
  
    def genres
      genres = Song.all.map {|song| song.genre}
      genres.uniq
    end
  
  
  end