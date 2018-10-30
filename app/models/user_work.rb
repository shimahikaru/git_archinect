class UserWork < ApplicationRecord
  belongs_to :user
  belongs_to :work

  def self.searchworks(works)
    self.where(work_id: works).select(:user_id)
  end

end
