class SearchesController < ApplicationController
  def search
    @users = User.search(params[:search][:search], params[:search][:word])
  end
end
