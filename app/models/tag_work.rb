class TagWork < ApplicationRecord

belongs_to :user

def work_tag
  works = [work1, work2, work3, work4, work5, work6, work7, work8, work9, work10, work11]
  works.compact
end

    def work1
       "戸建て・新築" if self.work1?
    end
    def work2
       "リノベーション" if self.work2?
    end
    def work3
      "商業施設" if self.work3?
    end
    def work4
      "店舗設計" if self.work4?
    end
    def work5
      "プロダクトデザイン" if self.work5?
    end
    def work6
      "家具・照明デザイン" if self.work6?
    end
    def work7
      "内装設計・管理" if self.work7?
    end
    def work8
     "家具・照明デザイン"  if self.work8?
    end
    def work9
      "建築・施工管理" if self.work9?
    end
    def work10
      "空間デザイン" if self.work10?
    end
    def work11
      "グラフィックデザイン" if self.work11?
    end

end
