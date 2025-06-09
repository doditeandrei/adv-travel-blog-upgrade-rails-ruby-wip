# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
authors = {
  'Ariane Doe' => 'https://res.cloudinary.com/giaconi/image/upload/v1610404058/hans-jurgen-mager-PE-OBpbwYb8-unsplash_aurifl.jpg',
  'John Doe' => 'https://res.cloudinary.com/giaconi/image/upload/v1641809511/licensed-image_xnlbim.jpg',
  'Marylin Tmp' => 'https://res.cloudinary.com/giaconi/image/upload/v1641809551/Marilyn_Monroe__Photoplay_1953_hbnj9h.jpg'
}
main_categories = {
  'Romania' => 'https://res.cloudinary.com/giaconi/image/upload/v1611854126/header-full-width-5_slbpcb.png',
  'Ponturi' => 'https://res.cloudinary.com/giaconi/image/upload/v1610814870/charles-postiaux-TnUG2pWraPE-unsplash_xqgrws.jpg',
  'Prin Lume' => 'https://res.cloudinary.com/giaconi/image/upload/v1611854125/header-full-width-4_orpr1n.png',
  'Experiente & Cazari' => 'https://res.cloudinary.com/giaconi/image/upload/v1611854124/header-full-width-1_qmqgmc.png'
}

main_categories.each do |main|
  MainCategory.create!(name: main[0], slug: main[0].parameterize, image: main[1], description: SecureRandom.hex(30), limit: rand(0..8))
end

authors.each do |author|
  Author.create(name: author[0], slug: author[0].parameterize, bio: 'cool bio', avatar: author[1], email: "#{SecureRandom.hex(4)}@gmail.com")
end

mains = MainCategory.all
authors = Author.all

10.times do
  Category.create(name: SecureRandom.hex(3), slug: SecureRandom.hex(5), main_category: mains.sample)
end

categories = Category.all

30.times do
  Article.create(date: Time.now, author: authors.sample, category: categories.sample, title: SecureRandom.hex(30), slug: SecureRandom.hex(4), intro_photo: 'https://source.unsplash.com/random', introduction: SecureRandom.hex(10), body: SecureRandom.hex(50) )
end
