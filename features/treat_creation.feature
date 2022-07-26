Feature: Treat Creation
	Scenario: We have to make a treat
		Given We are on snackmagic homepage
		And We log in successfully
		When We create a treat
		And We select the box treat type and budget
		And We fill the recipient details
		And We choose shipping details
		And We do all the customizations
		And We have paid for the order
		Then We see that an order has been successfully created
