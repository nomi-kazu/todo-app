class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.references :user, null: false
      t.string :title, null: false
      t.text :content, null: false
      t.date :deadline, null: false
      t.bigint :board_id, null: false
      t.timestamps
    end
  end
end
