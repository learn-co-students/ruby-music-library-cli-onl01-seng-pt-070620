require_relative "../config/environment.rb"
require 'pry'

class MusicLibraryController

  def initialize(path="./db/mp3s")
    mi = MusicImporter.new(path)
    mi.import
  end

  def call
    #puts ""
    puts "Welcome to your music library!"
    #puts "------------------------------"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    #puts "------------------------------"

    input = ''
    while input != "exit" do

      #puts ""
      puts "What would you like to do?"
      #puts "type 'help' for a list of commands"
      #puts ""

      input = gets.strip
      case input
      when "help"
        help
      when "list songs"
        list_songs
      when "list artists"
        list_artists
      when "list genres"
        list_genres
      when "list artist"
        list_songs_by_artist
      when "list genre"
        list_songs_by_genre
      when "play song"
        play_song
      end
    end
  end

  def help
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'song'."
    puts "To quit, type 'exit'."
  end

  def list
    Song.list.uniq.sort { |a, b| a.split(" - ")[1] <=> b.split(" - ")[1] }
  end

  def list_songs
    list.each_with_index do |song, index|
      index_plus = index + 1
      puts "#{index_plus}. #{song}"
    end
  end

  def list_artists
    list = Song.artists.sort { |a, b| a.name <=> b.name }
    list.each_with_index do |artist, index|
      index_plus = index + 1
      puts "#{index_plus}. #{artist.name}"
    end
  end

  def list_genres
    list = Song.genres.sort { |a, b| a.name <=> b.name}
    list.each_with_index do |genre, index|
      index_plus = index + 1
      puts "#{index_plus}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist = gets
    #puts "'#{artist}'"
    songs = list.select { |song| song.split(" - ")[0] == artist }
    songs.each_with_index do |song, index|
      index_plus = index + 1
      puts "#{index_plus}. #{song.split(" - ").drop(1).join (" - ")}"
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre = gets
    songs = list.select { |song| song.split(" - ")[2] == genre }
    songs.each_with_index do |song, index|
      index_plus = index + 1
      puts "#{index_plus}. #{song.split(" - ")[0..1].join(" - ")}"
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    number = gets
    if number.to_i > 0 && number.to_i < Song.list.uniq.length
      song = list[number.to_i - 1]
      song = song.split(" - ")
      puts "Playing #{song[1]} by #{song[0]}"
    end
  end

end
