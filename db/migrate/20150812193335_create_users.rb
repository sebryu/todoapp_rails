class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :nick
      t.string :description
      t.string :profile_color
      t.string :role

      t.timestamps null: false
    end
  end
end
