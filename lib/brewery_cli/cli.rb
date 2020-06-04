class Cli
    
    def run
        print_welcome
        sleep (1)
        select_city
        sleep (1)
        selection_details
        sleep (1)
        #print_end
    end

    def select_city
        print_state_prompt
        state = gets.chomp
        print_city_prompt
        city = gets.chomp
        get_brewery_by_city(state, city)
        puts ""
        puts ""
        print_all
        puts ""
        puts ""
    end

    def get_brewery_by_city(state, city)
        Api.get_brewery_by_city(state, city)
    end

    def selection_details
        print_selection_prompt
        input = gets.chomp
        puts ""
        puts ""
        puts ""
        puts Brewery.all[input.to_i-1].name
        puts "--------------------------------"
        puts ""
        puts "Address: #{Brewery.all[input.to_i-1].street} #{Brewery.all[input.to_i-1].city}, #{Brewery.all[input.to_i-1].state}."
        puts ""
        puts "Phone #: #{Brewery.all[input.to_i-1].phone}"
        puts ""
        puts "Website: #{Brewery.all[input.to_i-1].website}"
        puts ""
        puts ""
    end


    def print_welcome
        puts "Welcome to Beer Near Me!"
        puts ""
        sleep (1)
        puts "Find Local Breweries in your city!"
        puts ""
        puts ""
        puts ""
    end

    def print_city_prompt
        puts "Please input your city."
    end

    def print_state_prompt
        puts "Please input your State."
    end

    def print_all
        Brewery.all.each_with_index do |brewery, index|            
            puts "#{index+1}. #{brewery.name}"            
        end
    end

    def print_selection_prompt
        puts "Please select the number corresponding to the brewery you would like to see more information on."
    end

    #def print_end
    #    puts "To exit, please type 'exit'."
    #    puts "To pick a new brewery in your city, please type 'back'."
    #    puts "To search breweries in a new city, please type 'new'."
    #end

end