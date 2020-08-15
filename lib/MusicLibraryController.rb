require 'pry'


class MusicLibraryController

  extend Concerns::Findable

  def initialize(path = "./db/mp3s")
    new_importer_object = MusicImporter.new(path)
    new_importer_object.import
  end

  def call
    input = ""
    while input != "exit"
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      input = gets.strip

      case input
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
  
  def list_songs
    
    name = Song.all.sort {|a, b| a.name <=> b.name }
      name.each_with_index do |song, i|
        puts "#{i + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
        
    end
    
  end

  def list_artists
    
    name = Artist.all.sort {|a, b| a.name <=> b.name }
      name.each_with_index do |artist, i|
        puts "#{i + 1}. #{artist.name}"
        
    end
    
  end
  
  def list_genres
    
    name = Genre.all.sort {|a, b| a.name <=> b.name }
      name.each_with_index do |genre, i|
        puts "#{i + 1}. #{genre.name}"
        
    end
  end
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.chomp
    if artist = Artist.find_by_name(input) 
      songs_sorted = artist.songs.sort_by do |song|
        song.name
      end
      songs_sorted.each.with_index(1) do |song,i|
        puts "#{i}. #{song.name} - #{song.genre.name}"
      end
    end
  end
  
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.chomp
    if genre = Genre.find_by_name(input) 
      genres_sorted = genre.songs.sort_by do |song|
        song.name
      end
      genres_sorted.each.with_index do |song,i|
        puts "#{i + 1}. #{song.artist.name} - #{song.name}"
      end
    end
  end
  
  
    def play_song
      puts "Which song number would you like to play?"
      input = gets.to_i
      if (1..Song.all.length).include?(input)
      list_of_songs =  Song.all.sort{ |a, b| a.name <=> b.name}
      song = list_of_songs[input - 1]
      puts "Playing #{song.name} by #{song.artist.name}"
        
      end
    
    end
    
  
  
  
  
end
