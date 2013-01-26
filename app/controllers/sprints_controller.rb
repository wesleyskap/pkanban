class SprintsController < ApplicationController

  before_filter :authenticate_user!
 
  # GET /sprints
  # GET /sprints.json
  def index
    @sprints = Sprint.where(:User_id => current_user.id)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @sprints }
    end
  end

  # GET /sprints/new
  # GET /sprints/new.json
  def new
    @sprint = Sprint.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @sprint }
    end
  end

  # GET /sprints/1/edit
  def edit
    @sprint = Sprint.find(params[:id])

    self.validate_user(current_user.id, @sprint.User_id)
  end

  
  # POST /sprints
  # POST /sprints.json
  def create
    @sprint = Sprint.new(params[:sprint])
    @sprint.User_id = current_user.id

    respond_to do |format|
      if @sprint.save
        format.html { redirect_to :action => 'index' }
        format.json { render :json => @sprint, :status => :created, :location => @sprint }
      else
        format.html { render :action => "new" }
        format.json { render :json => @sprint.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /sprints/1
  # PUT /sprints/1.json
  def update
    @sprint = Sprint.find(params[:id])

    respond_to do |format|
      if @sprint.update_attributes(params[:sprint])
        format.html { redirect_to :action => 'index' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @sprint.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /sprints/1
  # DELETE /sprints/1.json
  def destroy
    @sprint = Sprint.find(params[:id])
    
    self.validate_user(current_user.id, @sprint.User_id)
    @sprint.destroy

    respond_to do |format|
      format.html { redirect_to sprints_url }
      format.json { head :no_content }
    end
  end
  
  def validate_user(session_id, user_id)
    if ( session_id != user_id )
      redirect_to :action => 'index'
    end
  end

end
