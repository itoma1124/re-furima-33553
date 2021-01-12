class Category < ActiveHash::Base
  include ActiveHash::Associations
  has_many :items
  self.data =[
    {id:0, name:'---'},
    {id:1, name:'レディース'},
    {id:2, name:'メンズ'},
    {id:3, name:'ベビー・キッズ'},
    {id:4, name:'インテイリア・住まい・小物'},
    {id:5, name:'本・音楽・ゲーム'},
    {id:6, name:'家電・スマホ・カメラ'},
    {id:7, name:'スポーツ・レジャー'},
    {id:8, name:'ハンドメイド'},
    {id:9, name:'その他'}
  ]
end
