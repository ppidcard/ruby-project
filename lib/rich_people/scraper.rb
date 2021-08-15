require 'nokogiri'
require 'open-uri'
require 'awesome_print'
require_relative './people.rb'

module RichPeople
    class Scraper
        BASE_PATH = "https://www.celebritynetworth.com/list/top-100-richest-people-in-the-world/"
        def get_page(link = BASE_PATH)
            url = link
            uri = URI.parse(url)
            doc = Nokogiri::HTML(uri.open)
            
        end
        def get_people
            page = get_page
            page.css("li.top_profile").map do |person|
                person
            end
        end

        def save_people
            people = get_people
            people.map do |person|
                new_person = People.new
                name = person.css("h2.title").text.strip
                new_person.name = name.split(' ')[0..-3].join(" ")
                new_person.net_worth = person.css(".net_worth").text.strip
                new_person.url = person.css("a.anchor").attr("href").value.strip
                new_person.description = person.css(".bio").text.strip
                person_detail(new_person)
                
            end
        end

        def person_detail(person)
            page = get_page(person.url)
            res = make_details_table(page)
            save_more_details(res, "Date of Birth:", person)
            save_more_details(res, "Gender:", person)
            save_more_details(res, "Nationality:", person)
            save_more_details(res, "Profession:", person)
            person
        end

        def make_details_table(table)
            res = {}
            table.xpath("//tr").map do |x|
                
                keys = x.css("td")[0].text.strip
                x.css("td")[1] ? values = x.css("td")[1].text.strip : values = "Unknown"
                res[keys] = values
            end
            res
        end

        def save_more_details(table, key_word, obj)
            new_key = "@#{key_word.delete_suffix(":").downcase.split(" ").join("_")}".to_sym

            res_hash = table.select {|key, val| key == key_word}
            res_hash.map do |key, val| 
            obj.instance_variable_set(new_key, val)
            end
        end

        # def print_courses
        #     Course.all.each.with_index(1) do |course, index|
        #         puts "#{index}. #{course.title}"
        #     end
        # end
    end
end

