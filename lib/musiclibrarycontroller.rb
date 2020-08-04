require 'pry'

class MusicLibraryController
  attr_accessor :path

  def initialize(path = './db/mp3s')
    @path = path
    music = MusicImporter.new(path)
    music.import
  end

  def call
    response = " "
    while response != "exit"
      puts 'Welcome to your music library!'
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts 'What would you like to do?'
      response = gets.chomp
      case response
      when 'list songs'
        list_songs
      when 'list artists'
        list_artists
      when 'list genres'
        list_genres
      when 'list artist'
        list_songs_by_artist
      when 'list genre'
        list_songs_by_genre
      when 'play song'
        play_song
      end


    end
  end

  def list_songs
    sorted = Song.all.sort_by { |song| song.name }
    sorted.each_with_index { |song, i| puts "#{i + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}" }
  end

  def play_song
    puts 'Which song number would you like to play?'

    tracknum = gets.to_i
    tracknum -= 1
    sortedSongs = Song.all.sort_by { |song| song.name }
    if tracknum.between?(1, sortedSongs.count)
      track = sortedSongs[tracknum]
      puts "Playing #{track.name} by #{track.artist.name}" if sortedSongs.include?(track)

    end

  end

  def list_artists
    sorted = Artist.all.sort_by { |artist| artist.name }
    sorted.each_with_index { |artist, i| puts "#{i + 1}. #{artist.name}" }
  end

  def list_genres
    sorted = Genre.all.sort_by { |genre| genre.name }
    sorted.each_with_index { |genre, i| puts "#{i + 1}. #{genre.name}" }
  end

  def list_songs_by_artist
    puts 'Please enter the name of an artist:'
    artistname = gets.chomp
    sorted = Song.all.sort_by { |song| song.name }.select { |song| song.artist.name == artistname }
    sorted.each_with_index { |song, i| puts "#{i + 1}. #{song.name} - #{song.genre.name}" }
  end

  def list_songs_by_genre
    puts 'Please enter the name of a genre:'
    genrename = gets.chomp
    sorted = Song.all.sort_by { |song| song.name }.select { |song| song.genre.name == genrename }
    sorted.each_with_index { |song, i| puts "#{i + 1}. #{song.artist.name} - #{song.name}" }
  end
end

