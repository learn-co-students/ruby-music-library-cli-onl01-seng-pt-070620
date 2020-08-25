require 'pry'

class Song

    attr_accessor :name, :artist, :genre

    @@all = []

    def initialize(name, artist = nil, genre = nil)
        @name = name
        self.artist = artist if artist
        self.genre = genre if genre
        save
    end

    def self.all
        @@all
    end

    def save
        @@all << self
    end

    def self.destroy_all
        @@all.clear
    end

    def self.create(song)
        Song.new(song)
    end

    def artist=(artist)
        @artist = artist
        artist.add_song(self)
    end

    def genre=(genre)
        @genre = genre
        if !(genre.songs.include?(self))
            genre.songs << self
        end
    end

    def self.find_by_name(song)
        all.find{|s| s.name == song}
    end

    def self.find_or_create_by_name(song)
        find_by_name(song) || create(song)
    end

    def self.new_from_filename(filename)
        info = filename.split(" - ")
        artist, name, genre = info[0], info[1], info[2].gsub(".mp3", "")
        genre = Genre.find_or_create_by_name(genre)
        artist = Artist.find_or_create_by_name(artist)
        self.new(name, artist, genre)
    end

    def self.create_from_filename(filename)
        new_from_filename(filename).tap{|song| song.save}
    end

end