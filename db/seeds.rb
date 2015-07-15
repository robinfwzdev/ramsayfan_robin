# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Dish.destroy_all
Fan.destroy_all

fan = Fan.create(first_name: 'robin', last_name: 'futureworkz', email: 'robin@example.com', password: '12345678')

Dish.create(title: 'Pho ga', description: 'This is pho ga', cost: 20, pax: 10, vegetarian: false, fan_id: fan)
Dish.create(title: 'Hu tieu', description: 'This is hu tieu nam vang', cost: 30, pax: 10, vegetarian: false, fan_id: fan)
