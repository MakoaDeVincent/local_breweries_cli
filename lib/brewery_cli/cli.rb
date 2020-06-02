class Cli
    
    def run
        print_welcome
        sleep (1)
        select_city
        sleep (1)
        selection_details
    end

    def select_city
        print_city_prompt
        city = gets.chomp
        get_brewery_by_city(city)
        puts ""
        puts ""
        print_all
        puts ""
        puts ""
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
        puts "Address: #{Brewery.all[input.to_i-1].street} #{Brewery.all[input.to_i-1].city}, #{Brewery.all[input.to_i-1].state}. "
        puts ""
        puts "Phone #: #{Brewery.all[input.to_i-1].phone}"
        puts ""
        puts "Website: #{Brewery.all[input.to_i-1].website}"
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
        puts "Please input a city."
    end

    def print_all
        Brewery.all.each_with_index do |brewery, index|            
            puts "#{index+1}. #{brewery.name}"            
        end
    end

    def print_selection_prompt
        puts "Please select the number corresponding to the brewery you would like to see more information on."
    end

    def get_brewery_by_city(city)
        Api.get_brewery_by_city(city)
    end

    #def valid_id?(id)
    #    id = id.to_i
    #    if id < 1 || id > Brewery.all.size
    #        print_error
    #        sleep(1)
    #        main
    #    end
    #    id
    #end

    #def print_error
    #    puts "Invalid Selection, please try again."
    #end

end