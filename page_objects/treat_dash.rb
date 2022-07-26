class TreatDash < SitePrism::Page
  element :new_order_button, :class, 'button-program-green'
  
  def start_new_order
    self.new_order_button.click
  end
end
