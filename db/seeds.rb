# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

themes = Theme.create([
    { name: 'Blue', color: '#00008f', created_by: 1 }, 
    { name: 'Brown', color: '#00938f', created_by: 1 },  
    { name: 'Gray', color: '#f0938f', created_by: 1 }
])

User.create([
    { user_name: 'developer', first_name: 'Site', last_name: 'Developer', email: 'developer@gmail.com', password: '123123', language: 1, theme_id: themes.first.id },
    { user_name: 'admin', first_name: 'Site', last_name: 'Admin', email: 'admin@gmail.com', password: '123123', language: 1, theme_id: themes.first.id },
    { user_name: 'user', first_name: 'Site', last_name: 'User', email: 'user@gmail.com', password: '123123', language: 1, theme_id: themes.first.id }
])