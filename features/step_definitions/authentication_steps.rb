Given /^there is a PT account with username: "([^\"]*)", password: "([^\"]*)"$/ do |username, password|
  PivotalTracker::Client.stub!(:token).and_return("abcdef")
end

Given /^there is no PT account with username: "([^\"]*)", password: "([^\"]*)"$/ do |username, password|
  PivotalTracker::Client.stub!(:token).and_return(nil)
end

Given /^I am logged in as "([^\"]*)"$/ do |username|
  Given %(there is a PT account with username: "#{username}", password: "secret")
  When %(I go to the login page)
  And %(I fill in "Username" with "#{username}")
  And %(I fill in "Password" with "secret")
  And %(I press "Login")
end
