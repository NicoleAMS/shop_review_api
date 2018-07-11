# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Score.delete_all
Review.delete_all
Shop.delete_all
Area.delete_all

# 6.times { FactoryGirl.create(:shop) }

# 6.times { FactoryGirl.create(:score) }

area1 = Area.create(name: 'Lewisham')

shop1 = area1.shops.create(name: 'Sainsbury\'s')
shop2 = area1.shops.create(name: 'Next')
shop3 = area1.shops.create(name: 'H&M')

shop1.reviews.create(name: 'Amazing shop', :scores_attributes => [
  {name: 'Product range', value: 4},
  {name: 'Staff friendliness', value: 4}
])
shop1.reviews.create(name: 'Great products', :scores_attributes => [
  {name: 'Product range', value: 5},
  {name: 'Staff friendliness', value: 4}
])
shop1.reviews.create(name: 'Awesome staff', :scores_attributes => [
  {name: 'Product range', value: 3},
  {name: 'Staff friendliness', value: 5}
])

shop2.reviews.create(name: 'Could be better', :scores_attributes => [
  {name: 'Product range', value: 2},
  {name: 'Staff friendliness', value: 3}
])
shop2.reviews.create(name: 'Awesome', :scores_attributes => [
  {name: 'Product range', value: 5},
  {name: 'Staff friendliness', value: 4},
  {name: 'Price', value: 5}
])
shop2.reviews.create(name: 'Great shop, but staff could be friendlier', :scores_attributes => [
  {name: 'Product range', value: 5},
  {name: 'Staff friendliness', value: 2}
])

shop3.reviews.create(name: 'Could be better', :scores_attributes => [
  {name: 'Product range', value: 1},
])
shop3.reviews.create(name: 'Not too bad', :scores_attributes => [
  {name: 'Product range', value: 3},
  {name: 'Staff friendliness', value: 3},
  {name: 'Price', value: 3}
])
shop3.reviews.create(name: 'Nice clothes', :scores_attributes => [
  {name: 'Product range', value: 5},
  {name: 'Staff friendliness', value: 3}
])