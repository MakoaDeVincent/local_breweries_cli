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
    def test
        puts 'practicing branching'
    end
    def get_brewery_by_city(state, city)
        Api.get_brewery_by_city(state, city)
    end

    def selection_details
        print_selection_prompt
        input = gets.chomp.to_i
        # if !valid_selection?(input)
        #     print_error
        #     selection_details
        # else
        #     brewery = find_brewery(input)
        #     print_brewery_details(brewery)
        # end
        
        if input < 1 || input > Brewery.all.size
            puts "Sorry, that doesnt seem to be a valid number.".colorize(:red)
            sleep (1)
            puts "Try again!".colorize(:red)
            puts ""
            sleep (1)
            selection_details
        else
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
            puts "--------------------------------"
            puts ""
            puts ""

        end
    end

    def options
        selection = gets.chomp.downcase
        if selection == "exit"
            print_exit
        elsif selection == "list"
            list
        else
            puts "Sorry, I didn't quite get that. Try again!".colorize(:red)
            options
        end
    end


    def list
        puts ""
        print_all
        puts ""
        sleep (1)
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