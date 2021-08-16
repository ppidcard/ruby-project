module RichPeople
    class CLI
        def call
            system("clear")
            progress_bar(0.1)
            system("clear")
            puts "                                                     CLI App Started."
            greeting
        end
        
        def greeting
            progress_bar(0.02)
            system("clear")
            puts "May I have your name please?"
            puts
            input = gets
            puts
            puts "Hello, #{input.chomp.capitalize}! Would like to explore the top 100 rich people with us? (y/n)"
            puts
            input = gets
            puts
            initial_query(input)
        end

        def initial_query(input)
            if (input.chomp == "n")
                puts "For reeaaal?? （ｉДｉ）" 
                end_program
            elsif (input.chomp == "y")
                system("clear")
                puts "Please select the following option:"
                puts 
                puts "1. Check name lists"
                puts "2. Search"
                puts
                input = gets 
                list_people if (input.to_i == 1 || input == "1.")
            
            else puts "Please enter y or n."
                puts 
                input = gets
                 initial_query(input)
            end
            
        end

        def progress_bar(speed)
            progressbar = ProgressBar.create
            50.times { progressbar.increment;sleep speed }
        end

        def scrape_date
            RichPeople::Scraper.new.save_people
        end

        def list_people
            system("clear")
            RichPeople::Scraper.new.save_people
            puts
            system("clear")
            arr = []
            RichPeople::People.new.list_people_index(arr.length)
            puts
            puts "                                                            Next(enter n)"
            puts 
            input = gets
            if input == 'n'
            arr << input
            RichPeople::People.new.list_people_index(arr.length)
            else
                RichPeople::People.new.display_details(input.to_i) 
            end
        end

        def end_program
            puts "                                                            Destroyed..."
            progress_bar(0.03)
            exit
        end
    end
end