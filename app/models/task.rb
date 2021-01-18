class Task < ApplicationRecord
  validates :task_name,  presence: true
  validates :task_detail,  presence: true
  validates :expiration_date,  presence: true
  validates :priority, presence: true , numericality: { only_integer: true, greater_than: -1, less_than: 4 }
  scope :search_status, -> (status){where('status = ?',status)}
    scope :search_title, -> (title){where('title LIKE ?',"%#{task_name}%")}
end
