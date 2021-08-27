# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Admin.create(email: 'admin@example.com', password: 'aaaaaaaa', password_confirmation: 'aaaaaaaa')

Language.create(name: 'thai')
Language.create(name: 'vietnamese')
Language.create(name: 'indonesian')
Language.create(name: 'malay')
Language.create(name: 'lao')
Language.create(name: 'nepali')

# (数字 * 1.1)は消費税を考慮
Ticket.create(fee: 2000 * 1.1, lesson_count: 1)
Ticket.create(fee: 5000 * 1.1, lesson_count: 3)
Ticket.create(fee: 7500 * 1.1, lesson_count: 5)
Ticket.create(fee: 7000, lesson_count: 5)
Ticket.create(fee: 9500, lesson_count: 7)
Ticket.create(fee: 12000, lesson_count: 10)

MonthlyPlan.create(name: 'light', ticket_id: Ticket.find_by(fee: 7000).id)
MonthlyPlan.create(name: 'standard', ticket_id: Ticket.find_by(fee: 9500).id)
MonthlyPlan.create(name: 'heavy', ticket_id: Ticket.find_by(fee: 12000).id)
