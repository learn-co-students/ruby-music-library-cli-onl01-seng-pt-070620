class MusicImporter
  attr_accessor :path 
  
  def initialize(path)
    @path = path
  end 
  
  def files
    Dir.entries(path).select do |song|
      song if song.size > 2
      end
  end
  
  def import 
    self.files.each {|filename| Song.create_from_filename(filename)}
  end
  
end