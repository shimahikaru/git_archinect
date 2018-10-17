class Comment < ApplicationRecord
belongs_to :user
belongs_to :product, optional: true
counter_culture :product
belongs_to :notice, optional: true
validates :user_id, :text, presence: true
validates :text, length: { maximum: 100 }

end
