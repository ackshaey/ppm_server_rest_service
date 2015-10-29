json.array!(@project_tasks) do |project_task|
  json.extract! project_task, :id, :task_name, :project_name, :percent_complete, :start_date, :finish_date
  json.url project_task_url(project_task, format: :json)
end
