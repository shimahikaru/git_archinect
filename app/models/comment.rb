class Comment < ApplicationRecord

belongs_to :user
belongs_to :product
counter_culture :product
validates :user_id, :product_id, :text, presence: true
validates :text, length: { maximum: 100 }

end
