require_relative "./song.rb"
require "pry"

class Genre < Song
  extend Concerns::Findable
  
  def artists 
    @artist_collection = []
    @songs.collect do |song|
      if @artist_collection.include?(song.artist)
        nil
      else
        @artist_collection << song.artist 
      end
    end
    @artist_collection
  end
  
end