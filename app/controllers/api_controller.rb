class ApiController < ApplicationController
  def todotasks
  	@tasks = TodoTask.all
  	render :json => @tasks.to_json and return
  end

  def projecttasks
  	@tasks = ProjectTask.all
  	render :json => @tasks.to_json and return
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


end
