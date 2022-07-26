class HomePage < SitePrism::Page
  set_url 'https://admin:admin@automation-frontend.snackmagic.com'
  element :login_button, :xpath, '/html/body/div[2]/div/div[2]/div/div/div/div/div[3]/header/div[2]/div[3]/div[2]/button'
  element :start_order_button, :xpath, '/html/body/div[2]/div/div[2]/div/div/div/div/div[3]/header/div[2]/div[3]/div[1]/div/a[2]'

  def goto_login_page
    self.login_button.click
  end
  
  def goto_treat_dash
    self.start_order_button.click
  end
end

