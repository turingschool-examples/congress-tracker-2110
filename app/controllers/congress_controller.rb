class CongressController < ApplicationController

  # What is a design pattern and what design patterns are we already familiar with?
  # * Agreed upon style as a way to do something to make code readable
  #   * MVC
  #   * REST
  # Which pillars of OOP are not being followed in our CongressController?
  # * Encapsulation
  # * Abstraction - we're seeing everything under the hood
  # What are some things we can isolate and extract better in CongressController?
  # * Establishing Connection
  # * Parsing the response
  # * Assigning response to some kind of Member object


  def index
    @members = CongressFacade.members(params[:state])
    # state = params[:state]
    # # Establishing our connection
    # conn = Faraday.new(url: "https://api.propublica.org") do |faraday|
    #   faraday.headers["X-API-KEY"] = ENV['govt_api_key']
    # end
    #
    # response = conn.get("/congress/v1/members/house/#{state}/current.json")
    # # Parsing our response
    # json = JSON.parse(response.body, symbolize_names: true)
    #
    # # Assigning response to object
    # @members = json[:results].map do |member_data|
    #   Member.new(member_data)
    # end

    render "welcome/index"
  end

  def search
    @member = CongressFacade.senate_search(params[:search])

    # response = conn.get("/congress/v1/116/senate/members.json")
    #
    # data = JSON.parse(response.body, symbolize_names: true)
    #
    # members = data[:results][0][:members]
    #
    # found_members = members.find_all {|m| m[:last_name] == params[:search]}
    # @member = found_members.first
    # binding.pry
    render "welcome/index"
  end
end
