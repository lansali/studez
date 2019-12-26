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
courses_array = ['Masters in Business studies', 'BSc. Comp Sci', 'BSc. Astro', 'BSc. Mathematics', 'BA Pyschology', 'BSc. Engineering', 'Diploma in Further studies', 'Certificate in culinary techniques']
employer_number = 1
student_number = 1

81.times do
    first_name  = Faker::Name.first_name
    middle_name = Faker::Name.middle_name
    last_name   = Faker::Name.last_name
    user = User.new(
        email: Faker::Internet.unique.free_email, 
        password: "password", 
        password_confirmation: "password",
        username: first_name + middle_name + last_name,
        first_name: first_name,
        middle_name: middle_name,
        last_name: last_name,
        settings: {
            privacy: 'y'
        }
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

25000.times do
    first_name  = Faker::Name.first_name
    middle_name = Faker::Name.middle_name
    last_name   = Faker::Name.last_name
    full_name   = first_name + middle_name + last_name
    user = User.new(
        email: Faker::Internet.unique.free_email, 
        password: "password", 
        password_confirmation: "password",
        username: full_name,
        first_name: first_name,
        middle_name: middle_name,
        last_name: last_name,
        settings: {
            privacy: 'n'
        }
    )
    user.save

    student = Student.create(
        user_id: user.id,
        institution_name: Faker::University.name,
        bio: Faker::TvShows::HowIMetYourMother.quote,
        interests: Faker::Superhero.name,
        year_started_course: Faker::Date.in_date_period,
        course_name: courses_array.sample,
        expected_graduation_year: Faker::Date.in_date_period
    )

    resume = Resume.create(
        student_id: student.id,
        profile_picture: Faker::Placeholdit.image(size: '50x50', format: 'jpg', background_color: 'ffffff'),
        full_name: full_name,
        tagline: Faker::TvShows::HowIMetYourMother.quote,
        phone_number: "This is a placeholder",
        physical_address: "This is a placeholder",
        email_adress: Faker::Internet.unique.free_email,
        work_experience: "This is a placeholder",
        education: "This is a placeholder",
        certifications: "This is a placeholder",
        skills: "This is a placeholder",
        languages: "This is a placeholder",
        past_projects: "This is a placeholder",
        workshops: "This is a placeholder",
        volunteerships: "This is a placeholder",
        relevant_links: "This is a placeholder",
        extra_columns: "This is a placeholder"
    )

    rand_ids = rand.to_s.split("")[2..-1]
    jobs_size = rand_ids.size
    job_number = 1

    rand_ids.each_with_index do |rand_id, index|
        next1 = index < jobs_size - 1 ? rand_ids[index+1] : index.to_s
        next2 = index < jobs_size - 2 ? rand_ids[index+2] : index.to_s
        if rand_id.to_i == 8
            opportunity_id = next1 + rand_id + rand_id
        elsif rand_id.to_i == 7
            opportunity_id = rand_id + rand_id + rand_id
        elsif rand_id.to_i == 6
            opportunity_id = rand_id + next2 + rand_id
        elsif rand_id.to_i == 5
            opportunity_id = rand_id + next1
        elsif rand_id.to_i == 4
            opportunity_id = rand_id + next2
        elsif rand_id.to_i == 3
            opportunity_id = rand_id + next1 + '3'
        elsif rand_id.to_i == 2
            opportunity_id = rand_id + next1 + next2
        else
            opportunity_id = '10' + index.to_s + rand_id
        end

        Submission.create(
            opportunity_id: opportunity_id.to_i,
            student_id: student.id,
            resume_id: resume.id,
            cover_letter: "Greetings,
                I am applying for the software engineer role.
                I came across it on Linkedin. I have interacted with Studez
                and I think it is a wonderful product. I am looking to steer
                my career towards building things that impact the education sector
                and I think I will be a good fit in your team.
                I once worked with Namely,  an NYC startup, as a remote contractor
                on their data engineering team. I developed kafka admin tools that
                enabled other developers in the team interface with the underlying
                event-gateway messaging streams. I introduced changes to the reports
                dashboard in their core Ruby on Rails application. I developed streams
                for their kafka event-gateway.  I worked on a couple of micro-services
                along the way namely C# and Go; these were for their payroll system.
                I bring with me 3 years of work experience and 2 years of internship
                experience before that. I have worked for C4DLab, Andela and
                Namely(New York Based Series D startup).
                Looking forward to your reply. Kind regards."
        )
        puts "Student[#{student_number}/25000]: Applying for job #{job_number}/#{jobs_size}"
        job_number = job_number + 1
    end
    student_number = student_number + 1
end
