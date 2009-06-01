class UserSearchController < ApplicationController
  @per_page = 10

  def search
    @users = User.find_with_ferret(params[:query], :per_page => @per_page)
    render :partial => "results"
  end

end
