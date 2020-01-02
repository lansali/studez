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
require_relative '../lib/progress_bar.rb'

require 'faker'
opportunity_ids = []
emails = ["@gmail.com", "@yahoo.com", "@onelive.com", "@me.com", "@tech.com", "@company.com"]
categories = ['Design', 'IT', 'Engineering', 'Education', 'Business', 'Medicine', 'Agriculture']
courses_array = ['Masters in Business studies', 'BSc. Comp Sci', 'BSc. Astro', 'BSc. Mathematics', 'BA Pyschology', 'BSc. Engineering', 'Diploma in Further studies', 'Certificate in culinary techniques']
salary_ranges = ['KSh. 20k - KSh. 25k', 'KSh. 28k - KSh. 32k', 'KSh. 39k - KSh. 50k', 'KSh. 50k - KSh. 80k', 'KSh. 65k - KSh. 85k', 'KSh. 80k - KSh. 90k', 'KSh. 90k - KSh. 105k']
opportunity_types = ['Internship', 'Part-time', 'Full-time', 'Remote', 'Contract']
employer_number = 1
student_number = 1
moderator_number = 1

total_employers_number = 81

total_employers_number.times do
    first_name  = Faker::Name.first_name
    middle_name = Faker::Name.middle_name
    last_name   = Faker::Name.last_name
    email       = first_name.downcase + "." + middle_name.downcase + emails.sample
    full_name   = first_name + " " + middle_name + " " + last_name

    user = User.new(
        email: email, 
        password: "password", 
        password_confirmation: "password",
        username: full_name,
        first_name: first_name,
        middle_name: middle_name,
        last_name: last_name,
        settings: {
            privacy: 'y',
            account_type: 'business'
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
            name: Faker::Superhero.name,
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
                opportunity_type: opportunity_types.sample,
                salary_range: salary_ranges.sample,
                category: categories[counter],
                requirements: Faker::TvShows::GameOfThrones.quote,
                other: Faker::Marketing.buzzwords,
                deadline: Faker::Date.forward(days: 15)
            )
            opportunity_ids << opportunity.id
            counter = counter + 1
        end
    end
    # puts "Creating employer #{employer_number}/81"
    progress('Employers seed data', employer_number, total_employers_number)
    employer_number = employer_number + 1
end

total_students_number = total_employers_number * 3

total_students_number.times do
    first_name  = Faker::Name.first_name
    middle_name = Faker::Name.middle_name
    last_name   = Faker::Name.last_name
    email       = first_name.downcase + "." + middle_name.downcase + emails.sample
    full_name   = first_name + " " + middle_name + " " + last_name

    user = User.new(
        email: email, 
        password: "password", 
        password_confirmation: "password",
        username: full_name,
        first_name: first_name,
        middle_name: middle_name,
        last_name: last_name,
        settings: {
            privacy: 'n',
            account_type: 'student'
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
        email_adress: Faker::Internet.free_email,
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
        # puts "Student[#{student_number}/#{total_students_number}]: Applying for job #{job_number}/#{jobs_size}"
        progress('Student seed data', student_number, total_students_number)
        job_number = job_number + 1
    end
    student_number = student_number + 1
end

sample_blog = "<h1><strong>Studez Blog post</strong></h1><div><br><strong>1.1.6 Punctuation Suffixes and Prefixes&nbsp;</strong></div><div>We saw previously that methods whose names end with = can be invoked by assignment expressions. Ruby methods can also end with a question mark or an exclamation point. A question mark is used to mark predicates—methods that return a Boolean value. For example, the Array and Hash classes both define methods named empty? that test whether the data structure has any elements. An exclamation mark at the end of a method name is used to indicate that caution is required with the use of the method. A number of core Ruby classes define pairs of methods with the same name, except that one ends with an exclamation mark and one does not. Usually, the method without the exclamation mark returns a modified copy of the object it is invoked on, and the one with the exclamation mark is a mutator method that alters the object in place. The Array class, for example, defines methods sort and sort!.&nbsp;</div><div>In addition to these punctuation characters at the end of method names, you’ll notice punctuation characters at the start of Ruby variable names: global variables are prefixed with $, instance variables are prefixed with @, and class variables are prefixed with @@. These prefixes can take a little getting used to, but after a while you may come to appreciate the fact that the prefix tells you the scope of the variable. The prefixes are required in order to disambiguate Ruby’s very flexible grammar. One way to think of variable prefixes is that they are one price we pay for being able to omit parentheses around method invocations.&nbsp;</div><div><strong>1.1.7 Regexp and Range&nbsp;</strong></div><div>We mentioned arrays and hashes earlier as fundamental data structures in Ruby. We demonstrated the use of numbers and strings as well. Two other datatypes are worth mentioning here. A Regexp (regular expression) object describes a textual pattern and has methods for determining whether a given string matches that pattern or not. And a Range represents the values (usually integers) between two endpoints. Regular expressions and ranges have a literal syntax in Ruby:&nbsp;</div><pre>/[Rr]uby/ # Matches \'Ruby\' or \'ruby\' \r\n/\\d{5}/ # Matches 5 consecutive digits\r\n1..3 # All x where 1 &lt;= x &lt;= 3 \r\n1...3 # All x where 1 &lt;= x &lt; 3 </pre><div>Regexp and Range objects define the normal == operator for testing equality. In addition, they also define the === operator for testing matching and membership. Ruby’s case statement (like the switch statement of C or Java) matches its expression against each of the possible cases using ===, so this operator is often called the <em>case equality opera- tor</em>.</div><div><br></div>"

total_moderators_number = 14

total_moderators_number.times do
    first_name  = Faker::Name.first_name
    middle_name = Faker::Name.middle_name
    last_name   = Faker::Name.last_name
    email       = first_name.downcase + "." + middle_name.downcase + emails.sample
    full_name   = first_name + " " + middle_name + " " + last_name

    user = User.new(
        email: email, 
        password: "password", 
        password_confirmation: "password",
        username: full_name,
        first_name: first_name,
        middle_name: middle_name,
        last_name: last_name,
        settings: {
            privacy: 'y',
            account_type: 'moderator'
        }
    )
    user.save

    Post.new(
        author_id: user.id,
        content: sample_blog,
        title: "Another blog ##{user.id}"
    )

    progress('Moderator seed data', moderator_number, total_moderators_number)
    moderator_number = moderator_number + 1
end
