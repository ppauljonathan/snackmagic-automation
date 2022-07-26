class LoginPage < SitePrism::Page
  element :username, :xpath, '/html/body/div[1]/div/div[2]/div[5]/form[1]/div[1]/input'
  element :password, :xpath, '//*[@id="password-login"]'
  element :submit_button, :xpath, '/html/body/div[1]/div/div[2]/div[5]/form[1]/div[3]/div/button'

  def fill_details(uname, passwd)
    self.username.set(uname)
    self.password.set(passwd)
  end
  
  def submit_details
    self.submit_button.click
  end
end
