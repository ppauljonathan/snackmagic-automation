class HomePage < SitePrism::Page
  set_url 'https://admin:admin@automation-frontend.snackmagic.com'
  elements :login_button, '.program-link'
  elements :start_order_button, '.button-program-green'

  def goto_login_page
    self.login_button[1].click
  end
  
  def goto_treat_dash
    self.start_order_button[0].click
  end
end

