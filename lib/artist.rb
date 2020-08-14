require_relative "./song.rb"
require "pry"

class Artist < Song
  extend Concerns::Findable
 
  def add_song(song)
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
    @genre_collection = []
    @songs.collect do |song|
      if @genre_collection.include?(song.genre)
        nil
      else
        @genre_collection << song.genre 
      end
    end
    @genre_collection
  end
  
end