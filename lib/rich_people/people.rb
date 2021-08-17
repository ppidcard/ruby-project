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

        def list_people_index(start)
            idx = start * 25
            People.all.select.with_index(1) do |e, i|
                puts "              #{i}.   #{e.name}" if i > idx && i < (idx + 25)
            end
        end

        def display_details(index)
            People.all.select.with_index(1) do |e, i|
                if i == index
                    puts"================================================================================================================================================================================"
                    puts"================================================================================================================================================================================"
                    puts "Name: #{e.name}"
                    puts"================================================================================================================================================================================"
                    puts "Net Worth: #{e.net_worth}"
                    puts"================================================================================================================================================================================"
                    puts "Descrption: #{e.description}"
                    puts"================================================================================================================================================================================"
                    puts"================================================================================================================================================================================"
                    puts "Enter y to know more about #{e.name.split(' ')[0]}, or x to return to the previous page."
                end
            end
        end
    end
end