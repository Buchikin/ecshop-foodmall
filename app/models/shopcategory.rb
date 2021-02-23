class Shopcategory < ActiveHash::Base
  self.data = [
    { id: 1, name: '和食' },
    { id: 2, name: 'ラーメン・麺類' },
    { id: 3, name: '丼もの' },
    { id: 4, name: 'イタリアン' },
    { id: 5, name: 'フレンチ' },
    { id: 6, name: '洋食' },
    { id: 7, name: '中華料理' },
    { id: 8, name: '韓国料理' },
    { id: 9, name: 'エスニック' },
    { id: 10, name: 'カレー' },
    { id: 11, name: '鍋' },
    { id: 12, name: 'ファストフード' },
    { id: 13, name: 'スイーツ' },
    { id: 14, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :stores

  end

