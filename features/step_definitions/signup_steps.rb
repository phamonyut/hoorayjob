Given /^a user visits the signup page$/ do
  visit signup_path
end

When /^he submit invalid information$/ do
  click_button "Submit"
end

Then /^he should see a error message$/ do
  page.should have_selector('div.error')
end


When /^he submit valid information$/ do
  fill_in "Name", with: "tester"
  # blah blah blah
  click_button "Submit"
end

Then /^he should has an account$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^he should see thank you message$/ do
  page.should have_selector('div.info')
end