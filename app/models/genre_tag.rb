class GenreTag < ApplicationRecord
belongs_to :product

def genretag
  genre = [genre1, genre2, genre3, genre4, genre5, genre6, genre7, genre8, genre9, genre10, genre11]
  genre.compact
end

    def genre1
       "フードショップ・カフェ" if self.genre1?
    end
    def genre2
       "クリニック・美容院" if self.genre2?
    end
    def genre3
      "ショップ" if self.genre3?
    end
    def genre4
      "オフィス・スクール" if self.genre4?
    end
    def genre5
      "バー・レストラン・ラウンジ" if self.genre5?
    end
    def genre6
      "居酒屋" if self.genre6?
    end
    def genre7
      "戸建て・新築" if self.genre7?
    end
    def genre8
     "戸建て・リノベーション"  if self.genre8?
    end
    def genre9
      "マンション・リノベーション" if self.genre9?
    end
    def genre10
      "商業施設・その他" if self.genre10?
    end
    def genre11
      "住宅・その他" if self.genre11?
    end

end
