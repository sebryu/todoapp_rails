class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :body
      t.datetime :time
      t.string :status

      t.timestamps null: false
    end
  end
end
