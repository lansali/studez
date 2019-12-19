# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# 
# Examples using Faker gem:
#   require 'faker'

#   movies = Movie.create([{ name: Faker::Name.name }, { name: Faker::Name.name }])
#   Character.create(name: Faker::Name.name, movie: movies.first)
# password_digest: Faker::Internet.password,

require 'faker'
opportunity_ids = []
categories = ['Design', 'IT', 'Engineering', 'Education', 'Business', 'Medicine', 'Agriculture']
employer_number = 1
student_number = 1

81.times do
    user = User.new(
        email: Faker::Internet.unique.free_email, 
        password: "password", 
        password_confirmation: "password",
        username: Faker::Name.unique.name,
        first_name: Faker::Name.first_name,
        middle_name: Faker::Name.middle_name,
        last_name: Faker::Name.last_name
    )
    user.save

    employer = Employer.create(
        user_id: user.id,
        title: Faker::Job.title,
        bio: Faker::TvShows::HowIMetYourMother.quote
    )

    3.times do
        business = Business.create(
            employer_id: employer.id,
            logo: Faker::Placeholdit.image(size: '50x50', format: 'jpg', background_color: 'ffffff'),
            description: Faker::TvShows::HowIMetYourMother.quote,
            location: Faker::Nation.capital_city
        )

        counter = 0
        7.times do
            opportunity = Opportunity.create(
                business_id: business.id,
                name: Faker::Job.title,
                description: Faker::TvShows::HowIMetYourMother.quote,
                location: Faker::Nation.capital_city,
                category: categories[counter],
                requirements: Faker::TvShows::GameOfThrones.quote,
                other: Faker::Marketing.buzzwords,
                deadline: Faker::Date.forward(days: 15)
            )
            opportunity_ids << opportunity.id
            counter = counter + 1
        end
    end
    puts "Creating employer #{employer_number}/81"
    employer_number = employer_number + 1
end

50.times do
    user = User.new(
        email: Faker::Internet.unique.free_email, 
        password: "password", 
        password_confirmation: "password",
        username: Faker::Name.unique.name,
        first_name: Faker::Name.first_name,
        middle_name: Faker::Name.middle_name,
        last_name: Faker::Name.last_name
    )
    user.save

    student = Student.create(
        user_id: user.id,
        institution_name: Faker::University.name,
        bio: Faker::TvShows::HowIMetYourMother.quote,
        interests: Faker::Superhero.name,
        year_started_course: Faker::Date.in_date_period,
        expected_graduation_year: Faker::Date.in_date_period
    )

    opportunity_ids.each do |opportunity_id|
        Submission.create(
            opportunity_id: opportunity_id,
            student_id: student.id
        )
    end
    puts "Creating student #{student_number}/50"
    student_number = student_number + 1
end
