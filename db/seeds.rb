# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(name: 'Rob', username: 'rob', password: 'admin', role: 1)
User.create(name: 'Guest', username: 'test', password: 'test')
Category.create(name: 'Helpful')
Category.create(name: 'Gadget')
Image.create(title: 'Light Bulb', link: "http://cdn.financialsamurai.com/wp-content/uploads/2011/03/lightbulb.jpg")
Image.create(title: 'Gadget', link: "https://pbs.twimg.com/profile_images/558205571220779008/rsB4JqwX_400x400.jpeg")
