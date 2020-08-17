require_relative "../config/environment.rb"
require 'pry'

class Genre extend Concerns::Findable

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
    genre = self.new(name)
    genre
  end

  def add_artist(artist)
    if !self.artists.include?(artist)
      self.artists << artist
    end
  end

  def artists
      Song.artists
  end

end
