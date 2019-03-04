# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Company.destroy_all
companies = []
20.times{
  c = Company.create(
    name: Faker::Company.name,
    duns_number: Faker::Company.duns_number,
    industry: Faker::Company.industry
    )
    companies.push(c)
}

User.destroy_all
users = []
30.times{
  u = User.create(
    email: Faker::Internet.free_email,
    password: '123456',
    name: Faker::Name.name_with_middle,
    rut: Faker::ChileRut.full_rut,
    phone: Faker::PhoneNumber.cell_phone_with_country_code
  )
  users.push(u)
}

Claim.destroy_all
250.times{
  Claim.create(
    company: companies.sample,
    user: users.sample,
    affair: Faker::Lorem.sentence(3, false, 4),
    description: Faker::Lorem.paragraph(2, true, 8),
    claim_date: Faker::Date.between(7.days.ago, Date.today)
  )
}
