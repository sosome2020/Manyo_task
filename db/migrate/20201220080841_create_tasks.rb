class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :task_name
      t.text :task_detail
      t.datetime :expiration_date
      t.timestamps
      t.string :status
      t.integer :priority
    end
  end
end
