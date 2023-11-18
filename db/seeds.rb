# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
   email: 'admin@admin',
   password: 'adminadmin'
)

   15.times do |n|
      Customer.create!(
         last_name: "試験#{n + 1}",
         first_name: "太郎#{n + 1}",
         kana_last_name: "シケン#{n + 1}",
         kana_first_name: "タロウ#{n + 1}",
         phone_number: "00000#{n + 1}",
         post_cord: "000000#{n + 1}",
         address: "試験町#{n + 1}",
         email: "test#{n + 1}@gmail.com",
         password: "123456"
         )
      end

   Genre.create(name: "ケーキ")
   Genre.create(name: "プリン")
   Genre.create(name: "焼き菓子")
   Genre.create(name: "キャンディ")

   10.times do |n|
      item=Item.create!(
         genre_id: 1,
         name: "商品#{n + 1}",
         introduction: "商品説明#{n + 1}",
         before_tax: 2000
         )
      # item.image.attach(io: File.open(Rails.root.join( 'app/assets/images/no_image.jpg')),
         # filename: 'no_image.jpg')
      end