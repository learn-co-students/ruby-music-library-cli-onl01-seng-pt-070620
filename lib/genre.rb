class Genre
    extend Concerns::Findable
    @@all = []
    attr_accessor :name, :songs 
    def initialize(name)
        @name= name 
        @songs= []
    end 
    def artists 
        songs.collect {|song| song.artist}.uniq 
    end 
    def save
        self.class.all << self  
    end 
    def self.all 
        @@all 
    end 
    def self.destroy_all 
        self.all.clear 
    end 
    def self.create(name)
        self.new(name).tap {|genre| genre.save}
    end 
end 