class Modal < SitePrism::Page
  elements :options, :class, 'custom-border-radio-content'
  elements :submit_button, :class, 'button-program-green'
  element :expected_count, :id, 'expectedCount'
  element :international_count, :id, 'internationalCount'
  element :message, :tag_name, 'textarea'
  element :checkout, :class, 'btn-primary'

  def choose_option(index)
    self.options[index].click
  end

  def submit_modal(index)
    self.submit_button[index]
  end

  def fill_count_details(exp, intl)
    self.expected_count.set(exp)
    self.international_count.set(intl)
  end

  def write_message(msg)
    self.message.set(msg)
  end

  def goto_checkout
    self.checkout.click
  end
end
