class CreateTaskManagerApps < ActiveRecord::Migration[7.0]
  def change
    create_table :task_manager_apps do |t|
      t.string :task
      t.text :description
      t.binary :catergory
      t.date :due
      t.date :created
      t.binary :completed

      t.timestamps
    end
  end
end
