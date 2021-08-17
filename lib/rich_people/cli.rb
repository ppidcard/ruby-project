module RichPeople
    class CLI
        ARR = []
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
                puts "1. List All People"
                puts "2. Search By Name"
                puts
                input = gets 
                list_or_search(input)
            elsif(input.chomp == 'e')
                end_program
            else puts "Please enter y or n, or e to end the program."
                puts 
                input = gets
                initial_query(input)
            end    
        end

        def list_or_search(input)
            if (input.to_i == 1 || input == "1.")
                system("clear")
                scrape_date
                list_people
            elsif (input.to_i == 2 || input == "2.")
                puts "Please enter the name that you would like to search, or enter r to return to the previous page, or e to end the program."
                puts
                input = gets
                search(input)
            end
        end

        def search(input)
            if input.chomp == 'r'
                initial_query('y')
            elsif input.chomp == 'e'
                end_program
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
            puts
            system("clear")
            RichPeople::People.new.list_people_index(ARR.length)
            puts
            if ARR.length > 0 && ARR.length < 3
                puts "previous(p)                                                            next(n)"
            elsif ARR.length == 3
                puts "previous(p)                                                                   "    
            else 
                puts "                                                                       next(n)"
            end
            puts 
            puts "Please select a number, or enter r to return to the previous page, or enter e to end the program."
            puts
            input = gets
            if input.chomp == 'n'
                ARR << input
                system("clear")
                list_people
            elsif input.chomp == 'p'
                ARR.pop() unless ARR.length == 0
                list_people
            elsif input.chomp == 'r'
                initial_query('y')
            elsif input.chomp == 'e'
                end_program
            elsif input.to_i.class == Integer && input.to_i != 0
                system("clear")
                display_details(input.to_i) 
            else 
                puts "Please select a number, or enter r to return to the previous page, or enter e to end the program."
                puts
                input = gets
                list_people
            end
        end

        def display_details(input)
            name = RichPeople::People.new.display_first_name(input)
            RichPeople::People.new.display_details(input) 
            puts
            puts "..."
            puts
            puts "Enter k to know more about #{name}, or r to return to the previous page."
            puts
            new_input = gets 
            more_details(input) if new_input.chomp == 'k'
        end

        def more_details(index)
            system("clear")
            RichPeople::People.new.display_details(index)
            puts "..."
            RichPeople::People.new.more_details(index)
            puts
            puts "..."
            puts
            puts "Enter e to exit the progrem, or r to return to the previous page."
            answer = gets
            end_program if answer.chomp == 'e'
            list_people if answer.chomp == 'r'
        end

        def end_program
            system("clear")
            puts "                                                            Destroyed..."
            ARR.clear
            progress_bar(0.03)
            exit
        end
    end
end