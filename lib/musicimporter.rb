require 'pry'
class MusicImporter 
  
  attr_reader :path
  
  def initialize(file_path)
    @path = file_path
  end
  
  def files
    files_array = (Dir.glob(File.join(@path, "*.mp3"))).collect{|path| File.basename(path)}
  end
  
 def import
    file_array = files
    file_array.each do |file|
       Song.create_from_filename(file)
     end
  end
  
end