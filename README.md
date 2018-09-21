# README

<b>Setup:<b>

git clone https://github.com/wilsonw926/smartcar.git

Run 'bundle install' and 'rake db:migrate'.

Run 'rails s' to start server. 

Sample calls with given vehicles (1234 and 1235) include...

http://localhost:3000/vehicle/1234/  
http://localhost:3000/vehicle/1234/fuel  
http://localhost:3000/vehicle/1234/battery  
http://localhost:3000/vehicle/1234/door   
etc.

<b>To run tests:<b>

bundle exec rspec spec in the smartcar directory (outter most dir.)

<b>Link I used to learn about testing:<b> 
  
http://geekhmer.github.io/blog/2014/07/30/test-routes-with-rspec-in-ruby-on-rails/   
https://github.com/rspec/rspec-rails
