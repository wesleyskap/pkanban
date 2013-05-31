class SprintsController < ApplicationController

  before_filter :authenticate_user!
  before_filter :sprint_find,   :only => [:edit, :update, :destroy]
  before_filter :validate_user!, :only => [:edit, :update, :destroy]

  respond_to :html, :json

  def index
    @sprints = Sprint.where(:User_id => current_user.id)
    respond_with @sprints
  end

  def new
    @sprint = Sprint.new
    respond_with @sprints
  end

  def edit
    @sprint = Sprint.find(params[:id])
  end

  def create
    @sprint = Sprint.new(params[:sprint])
    @sprint.User_id = current_user.id

    flash[:notice] = "Sprint was successfully created." if @sprint.save
    respond_with @sprint, :location => sprints_path
  end

  def update
    @sprint = Sprint.find(params[:id])

    flash[:notice] = "Sprint was successfully updated." if @sprint.update_attributes(params[:sprint])
    respond_with @sprint
  end

  def destroy
    @sprint = Sprint.find(params[:id])

    @sprint.destroy
    respond_with @sprint
  end

private
  def sprint_find
    @sprint = Sprint.find(params[:id])
  end

  def validate_user!
    unless current_user.id == @sprint.User_id
      flash[:notice] = "Sprint not finded"
      redirect_to sprints_path
    end
  end

end
