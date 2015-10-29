json.array!(@todo_tasks) do |todo_task|
  json.extract! todo_task, :id, :task_name, :project_name, :percent_complete, :start_date, :finish_date
  json.url todo_task_url(todo_task, format: :json)
end
