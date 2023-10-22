class SearchesController < ApplicationController

  def search
    # console
    @users = User.search(params[:search], params[:word])
  end
end