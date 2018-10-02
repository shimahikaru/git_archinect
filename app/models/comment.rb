class Comment < ApplicationRecord

belongs_to :user
belongs_to :product

validates :user_id, :product_id, :text, presence: true
validates :text, length: { maximum: 150 }

end
