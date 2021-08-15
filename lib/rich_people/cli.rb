module RichPeople
    class CLI
        def call
            puts "CLI Appl Started"
            puts "May I have your name please?"
            puts
            input = gets
            system("clear")
            greeting(input)
        end
        
        def greeting(input)
            puts "Hello, #{input.chomp.capitalize}! Would like to explore the top 100 rich people with us?"
            puts

            input = gets
            puts "For reeaaal?? （ｉДｉ）" if input.chomp == "No"
            puts "xxx" if input.chomp == "Yes"
        end

        def scrape_date
            RichPeople::Scraper.new.save_people
        end

        def list_people

        end
    end
end