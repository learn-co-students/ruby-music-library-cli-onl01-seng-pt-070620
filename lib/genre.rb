class Genre 
  attr_accessor :name
  attr_reader :songs
  
  extend Concerns::Findable
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def self.all
    @@all
  end
  
  def save
    self.class.all << self 
  end
  
  def self.destroy_all
    self.all.clear
  end
  
  def self.create(genre) 
    self.new(genre).tap {|new_genre| new_genre.save}
  end
  
  def artists
    self.songs.collect {|song| song.artist}.uniq
  end 
  
  
end