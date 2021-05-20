class ChangeColumnToTasks < ActiveRecord::Migration[6.1]
  def change
    change_column_null :tasks, :board_id, false
  end
end
