require 'watir-webdriver'
require 'highline/import'

puts 'please enter your username:'
username = gets.chomp
password = HighLine.ask("please enter your password:") { |q| q.echo = "*" }
puts 'please enter an email address:'
emailaddress = gets.chomp
puts 'please enter your subject:'
subject = gets.chomp

b = Watir::Browser.new 

b.goto 'http://gmail.com'
b.text_field(:id => 'Email').set username
b.text_field(:id => 'Passwd').set password
b.button(:name => 'signIn').click
b.div(:class => 'T-I J-J5-Ji T-I-KE L3').wait_until_present
b.div(:class => 'T-I J-J5-Ji T-I-KE L3').click
b.textarea(:name => 'to').wait_until_present
b.textarea(:name => 'to').set emailaddress
b.text_field(:name => 'subjectbox').set subject

#gmail are clever (well done gmail!) so sending the email can't be done like this
