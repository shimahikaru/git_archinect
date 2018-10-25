class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # default_scope { order(created_at: :desc)}

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

has_many :user_works
has_many :works, through: :user_works
accepts_nested_attributes_for :user_works, allow_destroy: true
# accepts_nested_attributes_for :tag_works, allow_destroy: true
has_many :products, ->{ order("created_at DESC")}, dependent: :delete_all
has_many :comments, ->{ order("updated_at DESC") }, dependent: :delete_all
has_many :commented_products, ->{ order("updated_at DESC") }, through: :comments, source: :product, dependent: :delete_all


validates :text, length: { maximum: 100 }

has_many :relationships
has_many :followings, through: :relationships, source: :follow
# user.followingsでuserがフォローしているuser達を取得
has_many :reverses_of_relationship, class_name: 'Relationship', foreign_key: 'follow_id'
has_many :followers, through: :reverses_of_relationship, source: :user
has_many :emails
has_one :notice, dependent: :destroy



mount_uploader :avatar, AvatarsUploader

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

  validate :add_error

  def self.count_order(count)
    if count == "1"
      self.reorder("products_count DESC")
    elsif count == "2"
    self.joins(:followers).includes(:followers).group(:user_id).reorder("count(user_id) DESC")
    elsif count == "3"
    self.reorder("created_at DESC")
    elsif count == "4"
    self.reorder("created_at ASC")
    end
  end


  def add_error
    errors[:base] << "苗字は必須です。" if familyname.blank?
    errors[:base] << "名前は必須です。" if firstname.blank?
    errors[:base] << "勤務地は必須です。" if location.blank?
    errors[:base] << "登録メールアドレスは必須です。" if email.blank?
  end

def name
   self.familyname + self.firstname
end

def follow(other_user)
  unless self == other_user
    self.relationships.find_or_create_by(follow_id: other_user.id)
  end
end

def unfollow(other_user)
  relationship = self.relationships.find_by(follow_id: other_user.id)
  relationship.destroy if relationship
end

def following?(other_user)
  self.followings.include?(other_user)
end
# def self.search(search)
#     if search
#       where(['familyname LIKE ?', "%#{search}%"]) || where(['firstname LIKE ?', "%#{search}%"]) || where(['office LIKE ?', "%#{search}%"]) #検索とnameの部分一致を表示。User.は省略
#     else
#       all #全て表示。User.は省略
#     end
#   end

end
