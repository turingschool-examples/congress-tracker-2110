class CongressService
  def self.house_members_by_state(state)
    #SERVICE: handles external API calls, JSON parsing
    conn = Faraday.new(url: "https://api.propublica.org") do |faraday|
      faraday.headers["X-API-KEY"] = ENV['govt_api_key']
    end

    response = conn.get("/congress/v1/members/house/#{state}/current.json")

    JSON.parse(response.body, symbolize_names: true)
  end
end
