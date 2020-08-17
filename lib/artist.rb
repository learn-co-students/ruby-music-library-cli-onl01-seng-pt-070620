require_relative "../config/environment.rb"
require 'pry'

class Artist extend Concerns::Findable

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

  def self.destroy_all
    @@all = []
  end

  def save
    @@all << self
  end

  def self.create(name)
    artist = self.new(name)
    artist
    # a better way but will break other codes
    # new(name).tap{|a| a.save}
  end

  def add_song(song)
    if song.artist == nil
      song.artist = self
    end
    if @songs.include?(song) == false
      @songs << song
    end
    # a better way to do but will break other codes
    # song.artist = self unless song.artist == self
    # @songs << song unless @songs.include?(song)
  end

  def add_genre(genre)
    if !self.genres.include?(genre)
      self.genres << genre
    end
  end

  def genres
    Song.genres
    # a better way to do but will break other codes
    # self.songs.collect {|s| s.genre}.uniq
  end
end
