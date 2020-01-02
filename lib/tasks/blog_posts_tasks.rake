require_relative '../progress_bar.rb'

desc 'create moderators and respective blogs'
task create_moderators_and_respective_blogs: :environment do
    emails = ["@gmail.com", "@yahoo.com", "@onelive.com", "@me.com", "@tech.com", "@company.com"]
    sample_blog = "<h1><strong>Studez Blog post</strong></h1><div><br><strong>1.1.6 Punctuation Suffixes and Prefixes&nbsp;</strong></div><div>We saw previously that methods whose names end with = can be invoked by assignment expressions. Ruby methods can also end with a question mark or an exclamation point. A question mark is used to mark predicates—methods that return a Boolean value. For example, the Array and Hash classes both define methods named empty? that test whether the data structure has any elements. An exclamation mark at the end of a method name is used to indicate that caution is required with the use of the method. A number of core Ruby classes define pairs of methods with the same name, except that one ends with an exclamation mark and one does not. Usually, the method without the exclamation mark returns a modified copy of the object it is invoked on, and the one with the exclamation mark is a mutator method that alters the object in place. The Array class, for example, defines methods sort and sort!.&nbsp;</div><div>In addition to these punctuation characters at the end of method names, you’ll notice punctuation characters at the start of Ruby variable names: global variables are prefixed with $, instance variables are prefixed with @, and class variables are prefixed with @@. These prefixes can take a little getting used to, but after a while you may come to appreciate the fact that the prefix tells you the scope of the variable. The prefixes are required in order to disambiguate Ruby’s very flexible grammar. One way to think of variable prefixes is that they are one price we pay for being able to omit parentheses around method invocations.&nbsp;</div><div><strong>1.1.7 Regexp and Range&nbsp;</strong></div><div>We mentioned arrays and hashes earlier as fundamental data structures in Ruby. We demonstrated the use of numbers and strings as well. Two other datatypes are worth mentioning here. A Regexp (regular expression) object describes a textual pattern and has methods for determining whether a given string matches that pattern or not. And a Range represents the values (usually integers) between two endpoints. Regular expressions and ranges have a literal syntax in Ruby:&nbsp;</div><pre>/[Rr]uby/ # Matches \'Ruby\' or \'ruby\' \r\n/\\d{5}/ # Matches 5 consecutive digits\r\n1..3 # All x where 1 &lt;= x &lt;= 3 \r\n1...3 # All x where 1 &lt;= x &lt; 3 </pre><div>Regexp and Range objects define the normal == operator for testing equality. In addition, they also define the === operator for testing matching and membership. Ruby’s case statement (like the switch statement of C or Java) matches its expression against each of the possible cases using ===, so this operator is often called the <em>case equality opera- tor</em>.</div><div><br></div>"
    total_moderators_number = 14
    moderator_number = 1

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

        post = Post.new(
            author_id: user.id,
            content: sample_blog,
            title: "Another blog ##{user.id}"
        )
        post.save

        progress('Moderator seed data', moderator_number, total_moderators_number)
        moderator_number = moderator_number + 1
    end
end
