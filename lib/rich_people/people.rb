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

        def list_people_index
            People.all.select.with_index do |e, i|
                puts "#{i+1}. #{e.name}" if i<26
            end
        end
    end
end