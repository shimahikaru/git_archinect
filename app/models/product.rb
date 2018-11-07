class Product < ApplicationRecord

  is_impressionable counter_cache: true

  default_scope { order(created_at: :desc)}

  # scope :has_genre_id_all, -> genre_ids {
  #   product = arel_table
  #   genre_product = GenreProduct.arel_table
  #   subquery = genre_product.project(genre_product[:product_id])
  #   .where(genre_product[:genre_id].in(genre_ids))
  #   .group(genre_product[:product_id])
  #   .having(genre_product[:genre_id].count('distinct').eq(genre_ids.size))
  #   where(product[:id].in(subquery))
  # }

  belongs_to :user
  counter_culture :user

  has_many :whole_photos, inverse_of: :product, dependent: :delete_all
  accepts_nested_attributes_for :whole_photos, reject_if: :all_blank, allow_destroy: true

  has_many :details, inverse_of: :product, dependent: :delete_all
  accepts_nested_attributes_for :details, reject_if: :all_blank, allow_destroy: true

  has_many :genre_products, dependent: :delete_all
  has_many :genres, through: :genre_products, dependent: :delete_all
  accepts_nested_attributes_for :genre_products, allow_destroy: true

  has_many :comments, ->{ order("updated_at DESC")}, dependent: :delete_all

  validate :add_error

  def self.search_genre(genres)
      productgenre = GenreProduct.searchgenres(genres)
      self.where(id: productgenre)
  end

  def self.count_order(count)
    if count == "1"
      self.reorder('comments_count DESC')
    elsif count == "2"
    self.reorder('impressions_count DESC')
    elsif count == "3"
      self.reorder('created_at DESC')
    elsif count == "4"
    self.reorder('created_at ASC')
    end
  end



  def add_error
    errors[:base] << "タイトル" if title.blank?
    errors[:base] << "写真" if whole_photos.length == 0
    errors[:base] << "工期" if whet.blank?
    errors[:base] << "場所" if location.blank?
    errors[:base] << "床面積" if area.blank?
    errors[:base] << "コンセプト" if text.blank?
    errors[:base] << "カテゴリー" if category.blank?
  end

  validates :text, length: { maximum: 350 }
  validates :title, length: { maximum: 15 }
  validates :subtitle, length: { maximum: 30 }


  enum category: {
    "ホテル・旅館":1, "物販店・専門店":2, "オフィス・スクール":3, "バー・クラブ":4, "カフェ・レストラン":5, 居酒屋:6, "各国料理・ダイニングレストラン":7, "和洋菓子・フードストア":8, "ブティック・アパレル雑貨":9, "クリニック・ビューティー":10, "戸建て新築・リノベーション":11, マンションリノベーション:12, "イベント・大型商業施設":13, その他:14
  }

  enum charge: {
    "設計・デザイン":1, アシスタント:2
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



 # def self.search(search_location,search_category)

 #    where(['content LIKE ?', "%#{search}%"]).where(['content LIKE ?', "%#{search}%"])

 #  end



end
