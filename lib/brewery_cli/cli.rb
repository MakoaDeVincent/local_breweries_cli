class Cli
    
    def run
        print_welcome
        sleep (1)
        select_city
        sleep (1)
        selection_details
        sleep (1)
        print_options
        options
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
        puts Brewery.all[input.to_i-1].name.colorize(:yellow)
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

    def options
        selection = gets.chomp.downcase
        if selection == "exit"
            print_exit
        elsif selection == "list"
            list
        else
            puts "Sorry, I didn't quite get that. Try again!"
            options
        end
    end


    def list
        puts ""
        print_all
        puts ""
        sleep (2)
        selection_details
        print_options
        options
    end


    # PRINT METHODS
    #---------------------------------------

    def print_welcome
        puts "Welcome to Beer Near Me!".colorize(:yellow)
        puts ""
        sleep (1)
        puts "Find Local Breweries in your city!".colorize(:yellow)
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
        if Brewery.all == []
            puts "Sorry, there doesn't seem to be any breweries in your city. Try inputting a nearby city to see breweries in that area.".colorize(:red)
            puts ""
            sleep (1)
            select_city
        else 
            Brewery.all.each_with_index do |brewery, index|            
                puts "#{index+1}. #{brewery.name}".colorize(:yellow)
            end     
        end
    end

    def print_selection_prompt
        puts "Please select the number corresponding to the brewery that you would like to see more information on."
    end

    def print_options
        puts "To pick a new brewery in your city, please type" + " " + "'list'.".colorize(:yellow)
        puts "To exit, please type" + " " + "'exit'.".colorize(:yellow)
        puts ""
        puts ""
    end

    def print_exit
        puts ""
        puts ""
        puts "Thank you for using Beer Near Me! Enjoy your beer!".colorize(:yellow)
        puts ""
        puts ""
    end

end