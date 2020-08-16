class MusicLibraryController
    attr_accessor :path

    def initialize(path = "./db/mp3s")
        @path = path
        MusicImporter.new(path).import
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
            input = gets.chomp

            case input
            when "list songs"
                self.list_songs
            when "list artists"
                self.list_artists
            when "list genres"
                self.list_genres
            when "list artist"
                self.list_songs_by_artist
            when "list genre"
                self.list_songs_by_genre
            when "play song"
                self.play_song
            else
                "Please input a valid request"
            end
        end
    end

    def list_songs
        Song.all.sort {|x,y| x.name <=> y.name}.each.with_index(1) do |song, index|
            puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
    end

    def list_artists
        artists = Artist.all.sort {|x,y| x.name <=> y.name}
        artists.each.with_index(1) do |artist, index|
            puts "#{index}. #{artist.name}"
        end
    end

    def list_genres
        genres = Genre.all.sort {|x,y| x.name <=> y.name}
        genres.each.with_index(1) do |genre, index|
            puts "#{index}. #{genre.name}"
        end
    end

    def list_songs_by_artist
        puts "Please enter the name of an artist:"
        input = gets.chomp
        if artist = Artist.find_by_name(input)
            artist.songs.sort { |a,b| a.name <=> b.name }.each.with_index(1) do |song, i|
                puts "#{i}. #{song.name} - #{song.genre.name}"
            end
        end
    end

    def list_songs_by_genre
        puts "Please enter the name of a genre:"
        input = gets.chomp
        if genre = Genre.find_by_name(input)
            genre.songs.sort { |a,b| a.name <=> b.name }.each.with_index(1) do |song, i|
                puts "#{i}. #{song.artist.name} - #{song.name}"
            end
        end
    end

    def play_song
        puts "Which song number would you like to play?"
        input = gets.chomp.to_i
        songs = Song.all
        if (1..songs.length).include?(input)
            song = Song.all.sort{ |a, b| a.name <=> b.name }[input - 1]
        end
        puts "Playing #{song.name} by #{song.artist.name}" if song
  end
end