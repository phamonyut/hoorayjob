Feature: Registration
	Scenario: Unsuccessful signup
	Given a user visits the signup page
	When he submit invalid information
	Then he should see a error message

	Scenario: Successful signup
	Given a user visits the signup page
	When he submit valid information
	Then he should has an account
	And he should see thank you message
