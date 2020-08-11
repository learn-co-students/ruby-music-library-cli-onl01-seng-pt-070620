class MusicLibraryController
  attr_accessor :music_importer, :path
  def initialize(path = "./db/mp3s")
    @path = path
    @music_importer = MusicImporter.new(path).import
  end
  
  def call 
    input = ''
    
    while input != 'exit'
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
      when 'list songs'
        self.list_songs
      when 'list artists'
        self.list_artists
      when 'list genres'
        self.list_genres
      when 'list artist'
        self.list_songs_by_artist
      when 'list genre'
        self.list_songs_by_genre
      when 'play song'
        self.play_song
        self.list_songs
      else
        "Invalid Input"
      end
    end
  end
  
  #### LIST SONGS ####
  def list_songs
    @music_importer.sort! do |a, b| 
      a.split(" - ")[1] <=> b.split(" - ")[1]
    end
    
    @music_importer.collect! do |song|
      song_genre = song.split(" - ").last.split(".").first
      song.gsub(song.split(" - ")[2], song_genre)
    end
    
    @music_importer.each_with_index do |song, i| 
      puts "#{i + 1}. #{song}"
    end
    @music_importer.uniq
  end
  
  #### LIST ARTISTS ####
  def list_artists
    Artist.all.sort_by(&:name).each.with_index(1) do |art, idx|
      puts "#{idx}. #{art.name}"
    end
  end
  
  #### LIST GENRES ####
  def list_genres
    Genre.all.sort_by(&:name).each.with_index(1) do |gen, idx|
      puts "#{idx}. #{gen.name}"
    end
  end
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip
    # binding.pry
    if artist = Artist.find_by_name(input)
      artist.songs.sort_by(&:name).each.with_index(1) do |song, idx|
        puts "#{idx}. #{song.name} - #{song.genre.name}"
      end
    end
  end
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip
    
    if genre = Genre.find_by_name(input)
      genre.songs.sort_by(&:name).each.with_index(1) do |song, idx|
        puts "#{idx}. #{song.artist.name} - #{song.name}"
      end
    end
  end
  
  def play_song
    puts "Which song number would you like to play?"
    list_of_songs =  Song.all.sort{ |a, b| a.name <=> b.name }

    input = gets.strip.to_i
    if (1..Song.all.uniq.length).include?(input)
      # binding.pry
      song = list_of_songs[input+2]
      puts "Playing #{song.name} by #{song.artist.name}"
    end
  end
end