json.extract! task_manager_app, :id, :task, :description, :catergory, :due, :created, :completed, :created_at, :updated_at
json.url task_manager_app_url(task_manager_app, format: :json)
