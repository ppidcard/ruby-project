module RichPeople
    class People
        attr_accessor :name, :net_worth, :url, :description, :date_of_birth, :gender, :profession, :nationality, :new_key
        @@all = []

        def initialize
            @@all << self
        end

        def self.all
            @@all
        end

        def self.reset_all
            @@all.clear
        end

        def gender
            @gender
        end
        
        def gender=(value)
            @gender = value
        end
    end
end