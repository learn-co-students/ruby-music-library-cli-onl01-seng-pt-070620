class MusicImporter
  attr_accessor :path, :name, :song, :artist
  @@all = []
  
  def initialize(path)
    @path = path
    @@all << self
  end
  
  def import
    # binding.pry
    files.each {|filename| Song.create_from_filename(filename)}
  end
  
  def files 
    stored_files = []
    a_dir = Dir.open self.path
    a_dir.each do |file|
      if file.end_with?("mp3")
        stored_files << file
      end
    end
    stored_files
  end
  
  def self.all 
    @@all
  end
end