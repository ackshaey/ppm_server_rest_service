require 'test_helper'

class ProjectTasksControllerTest < ActionController::TestCase
  setup do
    @project_task = project_tasks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:project_tasks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create project_task" do
    assert_difference('ProjectTask.count') do
      post :create, project_task: { finish_date: @project_task.finish_date, percent_complete: @project_task.percent_complete, project_name: @project_task.project_name, start_date: @project_task.start_date, task_name: @project_task.task_name }
    end

    assert_redirected_to project_task_path(assigns(:project_task))
  end

  test "should show project_task" do
    get :show, id: @project_task
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @project_task
    assert_response :success
  end

  test "should update project_task" do
    patch :update, id: @project_task, project_task: { finish_date: @project_task.finish_date, percent_complete: @project_task.percent_complete, project_name: @project_task.project_name, start_date: @project_task.start_date, task_name: @project_task.task_name }
    assert_redirected_to project_task_path(assigns(:project_task))
  end

  test "should destroy project_task" do
    assert_difference('ProjectTask.count', -1) do
      delete :destroy, id: @project_task
    end

    assert_redirected_to project_tasks_path
  end
end
