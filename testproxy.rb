require 'watir-webdriver'
require 'highline/import'

puts 'please enter your username:'
username = gets.chomp
password = HighLine.ask("please enter your password:") { |q| q.echo = "*" }
puts 'please enter an email address:'
emailaddress = gets.chomp
puts 'please enter your subject:'
subject = gets.chomp
puts 'please enter your proxy name:'
proxyname = gets.chomp
puts 'please enter your proxy port:'
proxyport = gets.chomp

def create_firefox_profile
    profile = Selenium::WebDriver::Firefox::Profile.new
    profile['network.proxy.ftp']           = proxyname
    profile['network.proxy.ftp_port']      = proxyport
    profile['network.proxy.http']          = proxyname
    profile['network.proxy.http_port']     = proxyport
    profile['network.proxy.no_proxies_on'] = "localhost, 127.0.0.1"
    profile['network.proxy.ssl']           = proxyname
    profile['network.proxy.ssl_port']      = proxyport
    profile['network.proxy.type']          = 1
    profile
end
 
ENV['no_proxy'] = '127.0.0.1'

b = Watir::Browser.new :firefox, :profile => create_firefox_profile

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
