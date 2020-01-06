require 'io/console'

desc "Create a first user"
task :create_user => :environment do
  user = build_user
  if user.valid?
    user.save
    puts "The user is created"
  else 
    puts "This user is not valid"
  end
end

def build_user
  print "First name: "
  first_name = STDIN.gets.chomp 
  print "Middle name: "
  middle_name = STDIN.gets.chomp 
  print "Last name: "
  last_name = STDIN.gets.chomp 
  print "email: "
  email = STDIN.gets.chomp   
  print "Password: "
  password = STDIN.noecho(&:gets).chomp
  puts
  username = first_name + ' ' + last_name
  User.new(first_name: first_name,
           middle_name: middle_name,
           last_name: last_name,
           username: username,
           email: email,
           password: password,
           password_confirmation: password)
end
  
