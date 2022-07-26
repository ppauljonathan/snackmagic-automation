class Modal < SitePrism::Page
  elements :options, '.custom-border-radio-content'
  elements :submit_button, '.button-program-green'
  element :expected_count, :id, 'expectedCount'
  element :international_count, :id, 'internationalCount'
  element :message, 'textarea'
  elements :checkout, '.btn-primary'

  def choose_option(index)
    self.options[index].click
  end

  def submit_modal
    self.submit_button[0].click
  end

  def fill_count_details(exp, intl)
    self.expected_count.set(exp)
    self.international_count.set(intl)
  end

  def write_message(msg)
    self.message.set(msg)
  end

  def goto_checkout
    self.checkout[0].click
  end
end
