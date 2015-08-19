class List < ActiveRecord::Base
	has_many :tasks
	has_many :users_lists
	has_many :users, through: :users_lists

  def to_s
    name
  end
end
