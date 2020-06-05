class Api

    BASE_URL = 'https://api.openbrewerydb.org/breweries'

    #def self.get_brewery
    #    res = RestClient.get(BASE_URL)
    #    data = JSON.parse(res.body)
    #    data.each do |brewery|
    #        name =  brewery['name']
    #        id = brewery['id']
    #        Brewery.new(name, id)
    #    end
    #end

    def self.get_brewery_by_city(state, city)
        res = RestClient.get("#{BASE_URL}?by_state=#{state}&by_city=#{city}")
        data = JSON.parse(res.body)
        data.each do |brewery|
            name =  brewery['name']
            id = brewery['id']
            street = brewery['street']
            city = brewery['city']
            state = brewery['state']
            phone = brewery['phone']
            website = brewery['website_url']
            next brewery if brewery['brewery_type'] == "planning"
            Brewery.new(name, id, street, city, state, phone, website)
        end
    end
end