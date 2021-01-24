class CreateLabellings < ActiveRecord::Migration[6.0]
  def change
    create_table :labellings do |t|

      t.timestamps
    end
  end
end
