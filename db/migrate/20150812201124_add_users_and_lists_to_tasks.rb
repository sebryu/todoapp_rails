class AddUsersAndListsToTasks < ActiveRecord::Migration
  def change
    add_reference :tasks, :user, index: true, foreign_key: true
    add_reference :tasks, :list, index: true, foreign_key: true
  end
end
