class TreatForm < SitePrism::Page
  element :treat_name, :xpath, '//*[@id="treatName"]'
  element :sender_name, :xpath, '//*[@id="senderName"]'
  element :submit_button, '.button-program-green'
  elements :radio_buttons, '.custom-border-radio-title'

  def fill_details(name, sender)
    self.treat_name.set(name)
    self.sender_name.set(sender)
  end

  def select_recipent(index)
    self.radio_buttons[index].click
  end

  def select_treat_type(index)
    self.radio_buttons[index+5]
  end

  def create_order
    self.submit_button.click
  end
end
