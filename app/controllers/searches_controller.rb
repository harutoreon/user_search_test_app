class SearchesController < ApplicationController
  def search
    @users = User.search(params[:search], params[:word])
  end
end
