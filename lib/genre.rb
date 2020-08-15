require 'pry'

class Genre

  attr_accessor :name
  attr_reader :songs
  extend Memorable::ClassMethods
  # extend Findable::ClassMethods
  # include Paramable::InstanceMethods
  include Memorable::InstanceMethods

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
    @songs = []
  end

  def self.all
    @@all
  end

  def add_song(song)
    song.genre = self if song.genre == nil
    self.songs << song if self.songs.include?(song) == false
  end

  #def artists
  #  Artist.all.select do |artist|
  #    artist.genre == self
  #  end
  #end

  # def artists
  #   songs.map do |song|
  #     song.artist
  #   end
  # end

  def artists
    self.songs.collect{|song|song.artist}.uniq
  end

  def self.create(genre)
    genre = self.new(genre)
    genre.save
    genre
  end

end
