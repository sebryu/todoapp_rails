class Task < ActiveRecord::Base
	belongs_to :user
	belongs_to :list
  validates :list, presence: true

  def add_user user
    self.user = user
    self.save
  end
end
