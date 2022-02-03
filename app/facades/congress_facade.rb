class CongressFacade
  def self.members(state)
    # state = params[:state]
    # # Establishing our connection
    # conn = Faraday.new(url: "https://api.propublica.org") do |faraday|
    #   faraday.headers["X-API-KEY"] = ENV['govt_api_key']
    # end
    #
    # response = conn.get("/congress/v1/members/house/#{state}/current.json")
    # # Parsing our response
    # json = JSON.parse(response.body, symbolize_names: true)
    json = CongressService.members_of_house(state)

    # Assigning response to object
    @members = json[:results].map do |member_data|
      Member.new(member_data)
    end
  end
end
