class Notice < ApplicationRecord
  belongs_to :user
  has_many :comments, ->{ order("updated_at DESC")}

    enum category: {
    求人:1, イベント:2, オープンデスク:3, その他:4
  }

  validate :add_error

  def add_error
    errors[:base] << "タイトル" if title.blank?
    errors[:base] << "カテゴリー" if category.blank?
    errors[:base] << "詳細" if text.blank?
  end
end
