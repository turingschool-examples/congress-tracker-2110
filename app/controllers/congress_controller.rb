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
    @state = params[:state]
    @members = CongressFacade.members(@state)

    render "welcome/index"
  end

  def search
    @member = CongressFacade.senate_search(params[:search])

    render "welcome/index"
  end
end
