class TodoTasksController < ApplicationController
  before_action :set_todo_task, only: [:show, :edit, :update, :destroy]

  # GET /todo_tasks
  # GET /todo_tasks.json
  def index
    @todo_tasks = TodoTask.all
  end

  # GET /todo_tasks/1
  # GET /todo_tasks/1.json
  def show
    # render :json => @todo_task.to_json and return
  end

  # GET /todo_tasks/new
  def new
    @todo_task = TodoTask.new
  end

  # GET /todo_tasks/1/edit
  def edit
  end

  # POST /todo_tasks
  # POST /todo_tasks.json
  def create
    @todo_task = TodoTask.new(todo_task_params)

    respond_to do |format|
      if @todo_task.save
        format.html { redirect_to @todo_task, notice: 'Todo task was successfully created.' }
        format.json { render :show, status: :created, location: @todo_task }
      else
        format.html { render :new }
        format.json { render json: @todo_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /todo_tasks/1
  # PATCH/PUT /todo_tasks/1.json
  def update
    respond_to do |format|
      if @todo_task.update(todo_task_params)
        format.html { redirect_to @todo_task, notice: 'Todo task was successfully updated.' }
        format.json { render :show, status: :ok, location: @todo_task }
      else
        format.html { render :edit }
        format.json { render json: @todo_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /todo_tasks/1
  # DELETE /todo_tasks/1.json
  def destroy
    @todo_task.destroy
    respond_to do |format|
      format.html { redirect_to todo_tasks_url, notice: 'Todo task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo_task
      @todo_task = TodoTask.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def todo_task_params
      params.require(:todo_task).permit(:task_name, :project_name, :percent_complete, :start_date, :finish_date)
    end
end
