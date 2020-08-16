require 'pry'

class Song
  attr_accessor :name
  attr_reader :artist, :genre
  extend Memorable::ClassMethods
  extend Concerns::Findable
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

  def self.find_by_name(song_name)
    self.all.find {|song|song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    song = self.find_by_name(song_name)
    if song == nil
      self.create(song_name)
    else
      song
    end
  end

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

  def self.new_from_filename(filename)
    info = filename.split(" - ")
    artist, name, genre = info[0], info[1], info[2].gsub( ".mp3" , "")
    genre = Genre.find_or_create_by_name(genre)
    artist = Artist.find_or_create_by_name(artist)
    new(name,artist,genre)
  end

  def self.create_from_filename(filename)
    new_from_filename(filename).tap{ |s| s.save}
  end

  # def to_param
  #   name.downcase.gsub(' ', '-')
  # end
end
