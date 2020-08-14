class Genre
extend Concerns::Findable
attr_accessor :name, :musiclibrarycontroller, :musicimporter
@@all=[]
  def initialize (name)
    @name=name
    @@all << self
    @songs = []
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
  def self.create(genre)
    new_genre = self.new(genre)
    new_genre.save
    new_genre
   end
   def songs
    @songs
   end
   def artists
    @new_array=[]
    @songs.each do |song|
      if @new_array.include? (song.artist)
        nil
      else
        @new_array << song.artist
      end
    end
    @new_array
   end
end