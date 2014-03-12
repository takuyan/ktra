class IterationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_iteration, only: [:show]

  def index
    @iterations = Iteration.order('start_date DESC')
  end

  def show
    @tasks = @iteration.tasks.owned_by(current_user)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @iteration }
    end
  end

  private
  def set_iteration
    @iteration = Iteration.find(params[:id])
  end
end
