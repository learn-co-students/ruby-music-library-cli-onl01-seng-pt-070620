class Artist
  attr_accessor :name
  attr_reader :songs
  extend Memorable::ClassMethods
  extend Concerns::Findable
  #include Paramable::InstanceMethods
  include Memorable::InstanceMethods

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  # def self.find_by_name(name)
  #   @@artists.detect{|a| a.name == name}
  # end

  def self.all
    @@all
  end

  def add_song(song)
    @songs << song
    song.artist = self
  end

  def add_songs(songs)
    songs.each { |song| add_song(song) }
  end

  def self.create(artist)
    artist = self.new(artist)
    artist.save
    artist
  end

  def add_song(song) #adding an artist to a song
    if song.artist == nil
      song.artist = self
    else
      nil
    end
    if @songs.include?(song)
      nil
    else
      @songs << song
    end
    song
  end

  def genres
    self.songs.map {|song|song.genre}.uniq
  end

  # def to_param
  #   name.downcase.gsub(' ', '-')
  # end
end
