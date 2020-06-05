class Brewery
    attr_accessor :name, :id, :street, :city, :state, :phone, :website

    @@all = []

    def initialize (name, id, street, city, state, phone, website)
        @name = name
        @id = id
        @street = street
        @city = city
        @state = state
        @phone = phone
        @website = website
        @@all << self
        remove_brewery_in_planning
    end

    def self.all
        @@all
    end

    def remove_brewery_in_planning
        @@all.delete_if {|brewery| brewery.name.include? "Brewery in Planning"}
        #only deletes first occurance, doesnt delete occurances after that
    end

end