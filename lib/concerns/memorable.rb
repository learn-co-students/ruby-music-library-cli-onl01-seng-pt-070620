module Memorable

  module ClassMethods
    def destroy_all
      self.all.clear
    end



    def count
      self.all.count
    end

    def create(name)
      self.class.all << self
    end

  end #module ClassMethods

  module InstanceMethods
    def save
      self.class.all << self
    end


  end #module InstanceMethods



end
