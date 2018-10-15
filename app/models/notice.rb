class Notice < ApplicationRecord
  belongs_to :user

    enum type: {
    求人:1, イベント:2, オープンデスク:3
  }
end
