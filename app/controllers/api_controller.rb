class ApiController < ApplicationController
  
  http_basic_authenticate_with name: "connor.horton", password: "Welcome1", only: [:todotasks_auth, :projecttasks_auth, :todotask_auth, :projecttask_auth]

  def todotasks
  	@tasks = TodoTask.select('id, task_name, project_name, percent_complete, start_date, finish_date')
  	render :json => { :todotasks => @tasks} and return
  end

  def projecttasks
  	@tasks = ProjectTask.select('id, task_name, project_name, percent_complete, start_date, finish_date')
  	render :json => { :projecttasks => @tasks} and return
  end

  def todotask
  	id = params[:id]
  	@task = TodoTask.find(id)
  	render :json => @task.to_json and return
  end

  def projecttask
  	id = params[:id]
  	@task = ProjectTask.find(id)
  	render :json => @task.to_json and return
  end

  def todotasks_auth
    @tasks = TodoTask.all
    render :json => { :todotasks => @tasks} and return
  end

  def projecttasks_auth
    @tasks = ProjectTask.all
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
