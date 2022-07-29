require 'rspec'
require 'cucumber'
require 'selenium-webdriver'
require 'capybara'
require 'capybara/dsl'
require 'site_prism'

require_relative '../../page_objects/confirmation_page.rb'
require_relative '../../page_objects/home_page.rb'
require_relative '../../page_objects/login_page.rb'
require_relative '../../page_objects/modal.rb'
require_relative '../../page_objects/treat_dash.rb'
require_relative '../../page_objects/treat_form'

Given('We are on snackmagic homepage') do
  $home_page = HomePage.new
  $home_page.load
  sleep(10)
end

And('We log in successfully') do
  $home_page.goto_login_page
  $login_page = LoginPage.new
  sleep(2)
  $login_page.fill_details('avneet+4444@vinsol.com',
                           'Vinsol1.')
  $login_page.submit_details
  sleep(10)
end

When('We create a treat') do
  $home_page.goto_treat_dash
  sleep(5)
  TreatDash.new.start_new_order
  sleep(5)

  $treat = TreatForm.new
  $treat.fill_details('snacks_for_testers', 'capybara')
  $treat.select_recipent(1)
  $treat.select_recipent(7)
  $treat.create_order
  sleep(5)
end

And('We select the box treat type and budget') do
  $modal = Modal.new

  sleep(2)
  $modal.choose_option(0)
  $modal.submit_modal
  sleep(5)

  $modal.choose_option(1)
  $modal.submit_modal
  sleep(5)
end

And('We fill the recipient details') do
  $modal.choose_option(0)
  $modal.submit_modal
  sleep(5)

  $modal.fill_count_details(75, 25)
  $modal.submit_modal
  sleep(5)

  $modal.submit_modal
  sleep(5)

  $modal.choose_option(1)
  $modal.submit_modal
  sleep(5)

  $modal.submit_modal
  sleep(5)
end

And('We choose shipping details') do
  $modal.choose_option(0)
  $modal.submit_modal
  sleep(5)

  $modal.write_message('Thank you for being such good employees, Have a treat')
  $modal.submit_modal
  sleep(5)
end


And('We do all the customizations') do
  $modal.choose_option(1)
  $modal.submit_modal
  sleep(5)

  $modal.choose_option(1)
  $modal.submit_modal
  sleep(5)

  $modal.choose_option(1)
  $modal.submit_modal
  sleep(5)

  $modal.choose_option(0)
  $modal.submit_modal
  sleep(5)

  $modal.choose_option(1)
  $modal.submit_modal
  sleep(5)

  $modal.choose_option(2)
  $modal.submit_modal
  sleep(5)

  $modal.choose_option(1)
  $modal.submit_modal
  sleep(5)
end

And('We have paid for the order') do
  $modal.goto_checkout
  sleep(5)

  $modal.choose_option(1)
  $modal.submit_modal
  sleep(5)

  $modal.choose_option(0)
  $modal.submit_modal
  sleep(10)
  
  $modal.choose_option(2)
  $modal.submit_modal
  sleep(5)
end

Then('We see that an order has been successfully created') do
  $confirmation_page = ConfirmationPage.new
  expect($confirmation_page).to be_displayed
end
