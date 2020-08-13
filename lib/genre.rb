class Genre
  
  extend Concerns::Findable
  
  attr_accessor :name
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def self.all
    @@all
  end
  
  def save
    @@all << self
  end
  
  def self.create(name)
    genre = self.new(name)
    genre.save
    genre
  end
  
  def self.destroy_all
    self.all.clear
  end
  
  def songs
    @songs
  end
  
  def artists
    artists = []
    songs.each do |song|
      artists << song.artist
    end
    artists.uniq
  end
  
end