class Comment < ApplicationRecord
belongs_to :user
belongs_to :product
counter_culture :product
belongs_to :notice
validates :user_id, :text, presence: true
validates :text, length: { maximum: 100 }

end
