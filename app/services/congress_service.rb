class CongressService
  def self.conn
    Faraday.new(url: "https://api.propublica.org") do |faraday|
      faraday.headers["X-API-KEY"] = ENV['govt_api_key']
    end
  end

  def self.house_members_by_state(state)
    response = conn.get("/congress/v1/members/house/#{state}/current.json")

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.senate_members
    response = conn.get("/congress/v1/116/senate/members.json")

    data = JSON.parse(response.body, symbolize_names: true)
    data[:results][0][:members]
  end
end
