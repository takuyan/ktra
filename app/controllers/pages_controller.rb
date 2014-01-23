class PagesController < ApplicationController
  before_filter :redirect_if_signin, only: [:index]
  def index
  end
  private
  def redirect_if_signin
    redirect_to tasks_path if user_signed_in?
  end
end
