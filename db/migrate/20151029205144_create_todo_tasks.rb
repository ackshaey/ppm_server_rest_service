class CreateTodoTasks < ActiveRecord::Migration
  def change
    create_table :todo_tasks do |t|
      t.string :task_name
      t.string :project_name
      t.decimal :percent_complete
      t.date :start_date
      t.date :finish_date

      t.timestamps null: false
    end
  end
end
