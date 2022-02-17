class SearchController < ApplicationController
  before_action :require_user

  def index

  end

  # def require_user
  #   if !current_user
  #     flash[:alert] = 'you must be logged in'
  #     redirect_to root_path
  #   end
  # end

end
