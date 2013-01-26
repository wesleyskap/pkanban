class TasksController < ApplicationController
  
  before_filter :authenticate_user!

  # GET /tasks/1/kanban
  def kanban
    @coll_01 = Task.where(:Sprint_id => params[:id], :column => 1)
    @coll_02 = Task.where(:Sprint_id => params[:id], :column => 2)
    @coll_03 = Task.where(:Sprint_id => params[:id], :column => 3)
    @coll_04 = Task.where(:Sprint_id => params[:id], :column => 4)
    
    # validate    
    @sprint = Sprint.find(params[:id])
    self.validate_user(current_user.id, @sprint.User_id)
  end

  # POST /tasks/sort
  def sort
    for i in 1..4
      @coll = 'coll_0' + i.to_s()
      if params[@coll]
        params[@coll].each do |id|
          Task.update(id, :column => i)
        end
      end
    end

    render :nothing => true
  end  

  # GET /tasks/new
  def new
    @task       = Task.new
    @sprint_id  = params[:id]
    
    # validate    
    @sprint = Sprint.find(params[:id])
    self.validate_user(current_user.id, @sprint.User_id)
  end

  # GET /tasks/1/edit
  def edit
    @task       = Task.find(params[:id])
    @sprint_id  = @task.Sprint_id
    
    # validate
    @sprint = Sprint.find(@sprint_id)
    self.validate_user(current_user.id, @sprint.User_id)
  end

  # POST /tasks
  def create
    @task = Task.new(params[:task])

    # validate
    @sprint = Sprint.find(params[:task][:Sprint_id])
    self.validate_user(current_user.id, @sprint.User_id)

    if @task.save
      redirect_to :action=>'kanban', :id=> params[:task][:Sprint_id]
    else
      render :action => "new" 
    end
  end

  # PUT /tasks/1
  def update
    @task = Task.find(params[:id])
    
    # validate
    @sprint = Sprint.find(params[:task][:Sprint_id])
    self.validate_user(current_user.id, @sprint.User_id)

    if @task.update_attributes(params[:task])
      redirect_to :action=>'kanban', :id=>params[:task][:Sprint_id]
    else
      render :action => "edit"
    end
  end

  # DELETE /tasks/1
  def destroy
    @task = Task.find(params[:id])
    
    # validate
    @sprint = Sprint.find(@task.Sprint_id)
    self.validate_user(current_user.id, @sprint.User_id)

    @task.destroy

    redirect_to :back
  end

  def validate_user(session_id, user_id)
    if ( session_id != user_id )
      redirect_to :controller => 'sprints', :action => 'index'
    end
  end

end
