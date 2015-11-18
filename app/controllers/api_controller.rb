class ApiController < ApplicationController
  
  http_basic_authenticate_with name: "connor.horton", password: "Welcome1", only: [:todotasks_auth, :projecttasks_auth, :todotask_auth, :projecttask_auth]
  skip_before_action :verify_authenticity_token
  
  def todotasks
  	@tasks = TodoTask.select('id, task_name, project_name, percent_complete, start_date, finish_date').order('created_at desc')
  	render :json => { :todotasks => @tasks} and return
  end

  def projecttasks
  	@tasks = ProjectTask.select('id, task_name, project_name, percent_complete, start_date, finish_date').order('created_at desc')
  	render :json => { :projecttasks => @tasks} and return
  end

  def todotask
  	id = params[:id]
  	@task = TodoTask.find(id)
  	render :json => @task.to_json and return
  end

  def create_todotask
    name = params[:task_name]
    @todo_task = TodoTask.new
    @todo_task.task_name = name
    @todo_task.project_name = "To-do Task"
    @todo_task.percent_complete = 0
    @todo_task.save!
    render :json => @todo_task.to_json and return
  end

  def update_todotask
    id = params[:id]
    @task = TodoTask.find(id)
    if params[:task_name]
      @task.task_name = params[:task_name]
    end
    if params[:project_name]
      @task.project_name = params[:project_name]
    end
    if params[:percent_complete]
      @task.percent_complete = params[:percent_complete]
    end
    if params[:start_date]
      @task.start_date = params[:start_date]
    end
    if params[:finish_date]
      @task.finish_date = params[:finish_date]
    end
    @task.save
    render :json => @task.to_json and return
  end

  def delete_todotask
    id = params[:id]
    @task = TodoTask.find(id)
    @task.destroy!
    ret_val = "The tas was deleted successfully"
    render :json => ret_val and return
  end

  def projecttask
  	id = params[:id]
  	@task = ProjectTask.find(id)
  	render :json => @task.to_json and return
  end

  def todotasks_auth
    @tasks = TodoTask.select('id, task_name, project_name, percent_complete, start_date, finish_date').order('created_at desc')
    render :json => { :todotasks => @tasks} and return
  end

  def projecttasks_auth
    @tasks = ProjectTask.select('id, task_name, project_name, percent_complete, start_date, finish_date').order('created_at desc')
    render :json => { :projecttasks => @tasks} and return
  end

  def todotask_auth
    id = params[:id]
    @task = TodoTask.find(id)
    render :json => @task.to_json and return
  end

  def projecttask_auth
    id = params[:id]
    @task = ProjectTask.find(id)
    render :json => @task.to_json and return
  end

end
