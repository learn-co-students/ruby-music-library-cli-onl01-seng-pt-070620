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
    # a better way but will break other codes
    # new(name).tap{|a| a.save}
  end

  def add_artist(artist)
    if !self.artists.include?(artist)
      self.artists << artist
    end
  end

  def artists
      Song.artists
      # a better way to do but will break other codes
      # self.songs.collect {|s| s.save}.uniq
  end

end
