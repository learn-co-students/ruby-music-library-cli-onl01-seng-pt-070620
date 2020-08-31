class Genre
  attr_accessor :name 
 extend Concerns::Findable
 @@all =[]
  def initialize(name)
    @name=name
    @songs=[]
  
  end
    def self.create(name)
    genre = new(name)
    genre.save
    genre
  end
  def self.all
    @@all
  end
  def self.destroy_all
    @@all.clear
  end
  def save
    @@all << self
  end

  def songs 
    @songs
  end
  
 def add_song(song_name)
    if song_name.genre == nil
      song_name.genre = self
      @songs << song_name
    end
  end
  
  def artists
  @songs.collect{|song| song.artist}.uniq
  end
end 
