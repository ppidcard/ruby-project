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
                scrape_data
                list_people
            elsif (input.to_i == 2 || input == "2.")
                system("clear")
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
            else 
                get_result_from_searching_name(input)
                input = gets 
                select_return_or_end(input)
            end
        end

        def get_result_from_searching_name(input)
            scrape_data
            system("clear")
            RichPeople::People.new.search_by_name(input)
            puts "Please select a number, or enter r to return to the previous page, or e to end the program."
        end

        def progress_bar(speed)
            progressbar = ProgressBar.create
            50.times { progressbar.increment;sleep speed }
        end

        def scrape_data
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
            change_pages(input)
            select_return_or_end(input)
            input = gets
            list_people
        end

        def change_pages(input)
            if input.chomp == 'n'
                ARR << input
                system("clear")
                list_people
            elsif input.chomp == 'p'
                ARR.pop() unless ARR.length == 0
                list_people
            end
        end

        def select_return_or_end(input)
            if input.chomp == 'r'
                initial_query('y')
            elsif input.chomp == 'e'
                end_program
            elsif input.to_i.class == Integer && input.to_i != 0
                system("clear")
                display_details(input.to_i) 
            else 
                wrong_input
            end

        end

        def wrong_input
            puts "Please select a number, or enter r to return to the previous page, or enter e to end the program."
            puts
            input_new = gets
            select_return_or_end(input_new)
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
            initial_query('y') if new_input.chomp == 'r'
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