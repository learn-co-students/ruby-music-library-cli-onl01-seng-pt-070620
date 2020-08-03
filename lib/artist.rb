require 'pry'

class Artist
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :genre
  @@all = []

  def initialize(name)
    @songs = []
    @name = name
  end

  def save
    self.class.all << self
  end

  def genres
    songs.collect { |song| song.genre }.uniq
  end

  def add_song(song)
    song.artist = self if song.artist == nil
    @songs << song unless @songs.include?(song)
  end

  def songs
    @songs
  end

  def self.create(name)
    new = Artist.new(name)
    new.save
    new
  end

  def self.all
    @@all
  end

  def self.destroy_all
    all.clear
  end
end