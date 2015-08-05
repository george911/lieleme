Feature: User login

  So that I can browse the profile of talents and hunters
  As a user
  I want to login

	Scenario: User login
	  Given an user named george and password is 11111111 
	  When I input the right account name and password 
	  Then I will login
