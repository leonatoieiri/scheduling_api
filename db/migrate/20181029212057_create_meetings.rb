class CreateMeetings < ActiveRecord::Migration[5.2]
  def change
    create_table :meetings do |t|
      t.string :title
      t.integer :room_id
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
