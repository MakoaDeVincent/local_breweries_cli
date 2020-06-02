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
    end

    def self.all
        @@all
    end

end