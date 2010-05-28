Given /^there is a PT account with name: "([^\"]*)", password: "([^\"]*)"$/ do |username, password|
  PivotalTracker::Client.should_receive(:token).with(username, password).and_return("abcdef")
end

Then /^I should see an error message$/ do
  pending # express the regexp above with the code you wish you had
end

Given /^I am logged in as "([^\"]*)"$/ do |username|
  pending # express the regexp above with the code you wish you had
end
