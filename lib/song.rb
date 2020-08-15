require 'pry'

class Song
  attr_accessor :name
  attr_reader :artist, :genre
  extend Memorable::ClassMethods
  # extend Findable::ClassMethods
  # include Paramable::InstanceMethods
  include Memorable::InstanceMethods

  #@@songs = []
  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    #@@all << self
    self.artist = artist if artist
    self.genre = genre if genre
  end

  # def self.find_by_name(name)
  #   @@songs.detect{|a| a.name == name}
  # end

  def self.all
    @@all
  end

  def self.create(song)
    song = self.new(song)
    song.save
    song
  end

    def artist= (artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre= (genre)
    @genre = genre
    self.genre.add_song(self)
  end




  # def to_param
  #   name.downcase.gsub(' ', '-')
  # end
end
