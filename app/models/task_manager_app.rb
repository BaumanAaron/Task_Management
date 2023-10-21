class TaskManagerApp < ApplicationRecord
    scope :alphabetical_task, -> (direction) { order(task: direction) }
    scope :alphabetical_desc, -> (direction) { order(description: direction) }
    scope :category_order, -> (direction) { order(category: direction) }
    scope :due_order, -> (direction) { order(due: direction) }
    scope :completed_order, -> (direction) { order(completed: direction) }
    
end
