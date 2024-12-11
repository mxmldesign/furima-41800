class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'メンズ' },
    { id: 3, name: 'ウィメンズ' },
    { id: 4, name: 'ベビー・キッズ' },
    { id: 5, name: 'インテリア・雑貨' },
    { id: 6, name: '本・音楽・ゲーム' },
    { id: 7, name: 'ホビー・玩具' },
    { id: 8, name: '電化製品' },
    { id: 9, name: 'スポーツ' },
    { id: 10, name: 'ハンドメイド' },
    { id: 11, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :items
end
