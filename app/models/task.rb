class Task < ApplicationRecord
  validates :task_name,  presence: true
  validates :task_detail,  presence: true
end
