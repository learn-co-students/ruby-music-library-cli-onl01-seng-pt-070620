require 'pry'

class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    @files = Dir.glob("#{@path}/*.mp3").collect { |song| song.gsub!("#{@path}/", "") }
  end

  def import
    files.each { |file| Song.create_from_filename(file) }
    #imports all files from library instantiating a new song object for each file
  end
end
