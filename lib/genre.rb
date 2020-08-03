class Genre
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

  def songs
    @songs
  end

  def add_genre(song)
    song.genre = self if song.genre == nil
    @songs << song unless @songs.include?(song) # check for song instance already exisiting not genre instance because song instances can have same genre
  end

  def artists
    songs.collect { |song| song.artist }.uniq
  end

  def self.create(name)
    new = Genre.new(name)
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