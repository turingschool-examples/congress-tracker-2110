class CongressService
  def self.members_of_house(state)
    # Establishing our connection
    # conn = Faraday.new(url: "https://api.propublica.org") do |faraday|
    #   faraday.headers["X-API-KEY"] = ENV['govt_api_key']
    # end

    response = conn.get("/congress/v1/members/house/#{state}/current.json")
    # Parsing our response
    json = JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    conn = Faraday.new(url: "https://api.propublica.org") do |faraday|
      faraday.headers["X-API-KEY"] = ENV['govt_api_key']
    end
  end
end
