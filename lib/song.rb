require 'pry'

class Song
    attr_accessor :name, :artist, :genre

    @@all = []

    def initialize(name, artist = nil, genre = nil)
        @name = name
        self.artist=(artist) if artist
        self.genre=(genre) if genre
        save
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

    def self.create(name)
        new_song = Song.new(name)
        new_song
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

    def self.find_by_name(name)
        @@all.find {|song| song.name == name}
    end

    def self.find_or_create_by_name(name)
        if self.find_by_name(name)
            self.find_by_name(name)
        else
            self.create(name)
        end
    end

    def self.new_from_filename(file)
        song_file = file.split(" - ")
        artist, name, genre = song_file[0], song_file[1], song_file[2].gsub( ".mp3" , "")
        genre = Genre.find_or_create_by_name(genre)
        artist = Artist.find_or_create_by_name(artist)
        self.new(name,artist,genre)
    end

    def self.create_from_filename(file)
        new_from_filename(file)
    end
end