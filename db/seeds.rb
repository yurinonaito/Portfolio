# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
inu = User.find_or_create_by!(email: "inu@inu") do |user|
  user.last_name = "テスト"
  user.first_name = "イヌ"
  user.user_name = "inu"
  user.telephone_number = "01000001111"
  user.status = 1
  user.admin = true
  user.is_deleted = false
  user.password = "Inu0109"
  user.icon_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpg"), filename:"sample-user1.jpg")
end

tanuki = User.find_or_create_by!(email: "tanuki@tanuki") do |user|
  user.last_name = "テスト"
  user.first_name = "タヌキ"
  user.user_name = "tanuki"
  user.telephone_number = "01000001111"
  user.status = 1
  user.admin = false
  user.is_deleted = false
  user.password = "Tanuki0109"
  user.icon_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.jpg"), filename:"sample-user2.jpg")
end

azarashi = User.find_or_create_by!(email: "azarashi@azarashi") do |user|
  user.last_name = "テスト"
  user.first_name = "アザラシ"
  user.user_name = "azarashi"
  user.telephone_number = "01000001111"
  user.status = 1
  user.admin = false
  user.is_deleted = false
  user.password = "Azarashi0109"
  user.icon_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.jpg"), filename:"sample-user3.jpg")
end

ahiru = User.find_or_create_by!(email: "ahiru@ahiru") do |user|
  user.last_name = "テスト"
  user.first_name = "アヒル"
  user.user_name = "ahiru"
  user.telephone_number = "01000001111"
  user.status = 1
  user.admin = false
  user.is_deleted = false
  user.password = "Ahiru0109"
  user.icon_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user4.jpg"), filename:"sample-user4.jpg")
end

hitsuji = User.find_or_create_by!(email: "hitsuji@hitsuji") do |user|
  user.last_name = "テスト"
  user.first_name = "ヒツジ"
  user.user_name = "hitsuji"
  user.telephone_number = "01000001111"
  user.status = 1
  user.admin = false
  user.is_deleted = false
  user.password = "Hitsuji0109"
  user.icon_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user5.jpg"), filename:"sample-user5.jpg")
end

kirin = User.find_or_create_by!(email: "kirin@kirin") do |user|
  user.last_name = "テスト"
  user.first_name = "キリン"
  user.user_name = "kirin"
  user.telephone_number = "01000001111"
  user.status = 1
  user.admin = false
  user.is_deleted = false
  user.password = "Kirin0109"
  user.icon_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user6.jpg"), filename:"sample-user6.jpg")
end

panda = User.find_or_create_by!(email: "panda@panda") do |user|
  user.last_name = "テスト"
  user.first_name = "パンダ"
  user.user_name = "panda"
  user.telephone_number = "01000001111"
  user.status = 1
  user.admin = false
  user.is_deleted = false
  user.password = "Panda0109"
  user.icon_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user7.jpg"), filename:"sample-user7.jpg")
end

saru = User.find_or_create_by!(email: "saru@saru") do |user|
  user.last_name = "テスト"
  user.first_name = "サル"
  user.user_name = "saru"
  user.telephone_number = "01000001111"
  user.status = 1
  user.admin = false
  user.is_deleted = false
  user.password = "Saru0109"
  user.icon_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user8.jpg"), filename:"sample-user8.jpg")
end

pengin = User.find_or_create_by!(email: "pengin@pengin") do |user|
  user.last_name = "テスト"
  user.first_name = "ペンギン"
  user.user_name = "pengin"
  user.telephone_number = "01000001111"
  user.status = 1
  user.admin = false
  user.is_deleted = false
  user.password = "Pengin0109"
  user.icon_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user9.jpg"), filename:"sample-user9.jpg")
end

ookami = User.find_or_create_by!(email: "ookami@ookami") do |user|
  user.last_name = "テスト"
  user.first_name = "オオカミ"
  user.user_name = "ookami"
  user.telephone_number = "01000001111"
  user.status = 1
  user.admin = false
  user.is_deleted = false
  user.password = "Ookami0109"
  user.icon_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user10.jpg"), filename:"sample-user10.jpg")
end

kitsune = User.find_or_create_by!(email: "kitsune@kitsune") do |user|
  user.last_name = "テスト"
  user.first_name = "キツネ"
  user.user_name = "kitsune"
  user.telephone_number = "01000001111"
  user.status = 1
  user.admin = false
  user.is_deleted = false
  user.password = "Kitsune0109"
  user.icon_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user11.jpg"), filename:"sample-user11.jpg")
end

ushi = User.find_or_create_by!(email: "ushi@ushi") do |user|
  user.last_name = "テスト"
  user.first_name = "ウシ"
  user.user_name = "ushi"
  user.telephone_number = "01000001111"
  user.status = 1
  user.admin = false
  user.is_deleted = false
  user.password = "Ushi0109"
  user.icon_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user12.jpg"), filename:"sample-user12.jpg")
end


Post.create(image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post1.jpg"), filename:"sample-post1.jpg"), caption: "テスト", code_url: "https://github.com/dashboard", post_url: "https://www.nakamura-brace.co.jp/", user_id: inu.id)

Post.create(image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post2.jpg"), filename:"sample-post2.jpg"), caption: "テスト", code_url: "https://github.com/dashboard", post_url: "https://woodspirits.ethicalspirits.jp/", user_id: tanuki.id)

Post.create(image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post3.jpg"), filename:"sample-post3.jpg"), caption: "テスト", code_url: "https://github.com/dashboard", post_url: "https://www.ajuga.shop/", user_id: azarashi.id)

Post.create(image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post4.jpg"), filename:"sample-post4.jpg"), caption: "テスト", code_url: "https://github.com/dashboard", post_url: "https://www.arluis.com/fair/miyakojima/", user_id: ahiru.id)

Post.create(image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post5.jpg"), filename:"sample-post5.jpg"), caption: "テスト", code_url: "https://github.com/dashboard", post_url: "https://seen-villa.jp/", user_id: hitsuji.id)

Post.create(image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post6.jpg"), filename:"sample-post6.jpg"), caption: "テスト", code_url: "https://github.com/dashboard", post_url: "https://mimiguri.co.jp/", user_id: kirin.id)

Post.create(image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post7.jpg"), filename:"sample-post7.jpg"), caption: "テスト", code_url: "https://github.com/dashboard", post_url: "https://www.goldwin.co.jp/hellyhansen/greenbaton/", user_id: tanuki.id)

Post.create(image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post8.jpg"), filename:"sample-post8.jpg"), caption: "テスト", code_url: "https://github.com/dashboard", post_url: "https://www.cow-madoca.jp/", user_id: panda.id)

Post.create(image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post9.jpg"), filename:"sample-post9.jpg"), caption: "テスト", code_url: "https://github.com/dashboard", post_url: "https://meguribito.com/", user_id: pengin.id)

Post.create(image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post10.jpg"), filename:"sample-post10.jpg"), caption: "テスト", code_url: "https://github.com/dashboard", post_url: "https://knots-creative.com/", user_id: ookami.id)

Post.create(image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post11.jpg"), filename:"sample-post11.jpg"), caption: "テスト", code_url: "https://github.com/dashboard", post_url: "https://idsumi.com/", user_id: kitsune.id)

Post.create(image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post12.jpg"), filename:"sample-post12.jpg"), caption: "テスト", code_url: "https://github.com/dashboard", post_url: "https://www.teinei.co.jp/lp/bocodeco/", user_id: ushi.id)