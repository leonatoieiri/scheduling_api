class CreateActionLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :action_logs do |t|
      t.string :controller
      t.string :action
      t.string :params

      t.timestamps
    end
  end
end
