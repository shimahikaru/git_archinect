class Product < ApplicationRecord

  belongs_to :user

  has_many :whole_photos
  accepts_nested_attributes_for :whole_photos, allow_destroy: true

  has_many :details
  accepts_nested_attributes_for :details, allow_destroy: true

  has_many :genre_products
  has_many :genres, through: :genre_products
  accepts_nested_attributes_for :genre_products, allow_destroy: true

  validates :user_id, :title, :subtitle, :whet, :completion, :location, :area, :text, :category, presence: true

  enum category: {
    クラブ:1, ホテル:2, レストラン:3, ショップ:4, スクール:5, オフィス:6, バー:7, カフェ:8, 居酒屋:9, クリニック:10, ビューティー:11, 戸建て:12, 戸建てリノベーション:13, マンション:14, マンションリノベーション:15, イベント会場:16, その他:17
  }

  enum location: {
    北海道:1,青森県:2,岩手県:3,宮城県:4,秋田県:5,山形県:6,福島県:7,
    茨城県:8,栃木県:9,群馬県:10,埼玉県:11,千葉県:12,東京都:13,神奈川県:14,
    新潟県:15,富山県:16,石川県:17,福井県:18,山梨県:19,長野県:20,
    岐阜県:21,静岡県:22,愛知県:23,三重県:24,
    滋賀県:25,京都府:26,大阪府:27,兵庫県:28,奈良県:29,和歌山県:30,
    鳥取県:31,島根県:32,岡山県:33,広島県:34,山口県:35,
    徳島県:36,香川県:37,愛媛県:38,高知県:39,
    福岡県:40,佐賀県:41,長崎県:42,熊本県:43,大分県:44,宮崎県:45,鹿児島県:46,沖縄県:47,海外:48
  }

end
