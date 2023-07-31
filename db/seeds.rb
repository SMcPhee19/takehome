# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Customer.destroy_all
Tea.destroy_all
Subscription.destroy_all

Customer.create!(first_name: 'Greg', last_name: 'Miller', email: 'ceosenior@kindafunny.com', address: '1234 Fake St')
Customer.create!(first_name: 'Tim', last_name: 'Gettys', email: 'tim_mf_gettys@kindafunny.com', address: '123 Main Street')
Customer.create!(first_name: 'Nick', last_name: 'Scarpino', email: 'producer_slash_seducer@kindafunny.com', address: '123 Maple Street')
Customer.create!(first_name: 'Andy', last_name: 'Cortez', email: 'nitro_rifle@kindafunny.com', address: '123 Oak Street')
Customer.create!(first_name: 'Kevin', last_name: 'Coello', email: 'bigkevdog@kidnafunny.com', address: '123 Elm Street')
Customer.create!(first_name: 'Joey', last_name: 'Noelle', email: 'itschristmaseverymonth@kindafunny.com', address: '123 Spruce Street')
Customer.create!(first_name: 'Blessing', last_name: 'Adeoye Jr.', email: 'blesswho@kindafunny.com', address: '123 Pine Street')
Customer.create!(first_name: 'Barrett', last_name: 'Courtney', email: 'sadboybarrett@kidnafunny.com', address: '123 Cedar Street')
Customer.create!(first_name: 'Mike', last_name: 'Howard', email: 'snowmikebike@kindafunny.com', address: '123 Birch Street')
Customer.create!(first_name: 'Roger', last_name: 'Pecoraro', email: 'thelock@kindafunny.com', address: '123 Ash Street')
Customer.create!(first_name: 'Greg', last_name: 'Gettys', email: 'coolgreg@kindafunny.com', address: '123 Walnut Street')

Tea.create!(title: 'Earl Grey', description: 'A classic black tea with a citrusy twist', brew_temp: '200', brew_time: '3')
Tea.create!(title: 'English Breakfast', description: 'A classic black tea', brew_temp: '184', brew_time: '5')
Tea.create!(title: 'Black', description: 'A classic black tea', brew_temp: '197', brew_time: '1')
Tea.create!(title: 'Masala Chai', description: 'A classic black tea with a spicy twist', brew_temp: '166', brew_time: '4')
Tea.create!(title: 'Green', description: 'A classic green tea', brew_temp: '175', brew_time: '2')
Tea.create!(title: 'Matcha', description: 'Green Tea Varietal grown in dark shaded areas', brew_temp: '178', brew_time: '5')
Tea.create!(title: 'Sencha', description: 'Green Tea variety grown in sunlight', brew_temp: '154', brew_time: '4')
Tea.create!(title: 'Oolong', description: 'A classic oolong tea', brew_temp: '200', brew_time: '3')
Tea.create!(title: 'White', description: 'A classic white tea', brew_temp: '150', brew_time: '5')
Tea.create!(title: "Pu'erh", description: "A classic pu'erh tea", brew_temp: '193', brew_time: '1')
Tea.create!(title: 'Herbal', description: 'A classic herbal tea', brew_temp: '212', brew_time: '5')
Tea.create!(title: 'Rooibos', description: 'A classic rooibos tea', brew_temp: '192', brew_time: '2')
Tea.create!(title: 'Chamomile', description: 'A classic chamomile tea', brew_temp: '183', brew_time: '4')
Tea.create!(title: 'Peppermint', description: 'A classic peppermint tea', brew_temp: '187', brew_time: '4')
Tea.create!(title: 'Chrysanthemum', description: 'A classic chrysanthemum tea', brew_temp: '206', brew_time: '5')
Tea.create!(title: 'Hibiscus', description: 'A classic hibiscus tea', brew_temp: '174', brew_time: '2')