class Song 
attr_accessor :name, :artist, :genre 

 @@all= []
 
  def initialize(name, artist = nil, genre = nil)
   @name= name 
    self.artist = artist if artist
    self.genre = genre if genre 
  end 
  
  def self.all
    @@all 
  end 
  
  def save 
    @@all << self 
  end 
  
  def self.destroy_all
    self.all.clear 
  end 

  def self.create(name)
    song = self.new(name)
    song.save
    song
  end 
  
  def artist=(artist)
    @artist= artist 
      artist.add_song(self)
  end 
  
  def genre=(genre)
    @genre=genre
     if !(genre.songs.include?(self))
      genre.songs << self
    end
  end 
  
  def self.find_by_name(name)
    self.all.detect {|song| song.name == name}
  end 
  
  def self.find_or_create_by_name(name)
   find_by_name(name) || create(name)
  end 
  
  def self.new_from_filename(file) 
      song_info = file.chomp(".mp3").split(" - ")
    song = Song.new(song_info[1])
    song.artist_name= song_info[0]
    song.genre_name= song_info[2]
    song
  end 
  
  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
    
  end
  
  def genre_name=(name)
    self.genre = Genre.find_or_create_by_name(name)
  end 
  
  def self.create_from_filename(name)
    file = Song.new_from_filename(name)
    file.save 
    
    
  end 
end 

