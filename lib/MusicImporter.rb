require_relative "../config/environment.rb"
require 'pry'

class MusicImporter

  attr_accessor :path, :files

  def initialize(path = "./db/mp3s/")
    @path = path
  end

  def files
    @files = Dir.entries(@path).select { |name| name.include?(".mp3")}
  end

  def import
    self.files.each { |filename| Song.create_from_filename(filename)}
  end

end
