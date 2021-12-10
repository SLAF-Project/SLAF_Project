# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Idiom.destroy_all
Comment.destroy_all
Like.destroy_all
Unlike.destroy_all

10.times do
    User.create(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        email: Faker::Internet.email,
        password: 'test123',
        password_confirmation: 'test123',
        admin: false
        )
end

#Admin user
User.create(first_name: 'Armand',
    last_name: 'Richelieu',
    email: 'richelieu.armand@yopmail.com',
    password: '123soleil',
    password_confirmation: '123soleil',
    alias: 'Le recteur',
    admin: true
)

100.times do
    Idiom.create(
        title_en: Faker::Hipster.word.capitalize,
        title_fr: Faker::Space.star.capitalize,
        grammatical_type: Faker::Lorem.word,
        body: Faker::Lorem.sentence(word_count: 20),
        example:Faker::Lorem.sentence(word_count: 3, supplemental: true),
        user: User.all.sample,
        validated: [true, false].sample
)
end

5.times do
    Comment.create(
        body: Faker::Lorem.sentence(word_count: 3, supplemental: true),
        user: User.all.sample,
        idiom: Idiom.all.sample
)
end

80.times do
    Like.create(
        user: User.all.sample,
        idiom: Idiom.all.sample
)
end


20.times do
    Unlike.create(
        user: User.all.sample,
        idiom: Idiom.all.sample
)
end