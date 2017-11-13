class ParametersPage < BasePage
  def initialize
    @title = Element.new(:xpath, '//android.widget.TextView[contains(@text, "Parametri")]')
    @button_apply = Element.new(:id, 'save_filter')
    @button_back = Element.new(:id, 'Navigate up')
    @input_name = Element.new(:id, 'param_filter_name')
    @frame_parameter = ElementGroup.new(:id, 'parameter_body_holder')
    @title_parameter_name = ElementGroup.new(:id, 'parameter_name')
    @frame_param_holder = ElementGroup.new(:id, 'param_text_holder')
    @input_parameter_left = Element.new(:id, 'left_param')
    @input_parameter_right = Element.new(:id, 'right_param')
  end

  def visible?
    @title.visible?
    @button_apply.visible?
    @button_back.visible?
  end

  def set_name(name)
    @input_name.send_keys(name)
    self.hide_keyboard
  end

  def set_parameter(name, left_param, right_param)
      @frame_parameter.list.each do |element|
        sub_element =   element.find_element(@title_parameter_name.value[:type], @title_parameter_name.value[:value])
      
      if sub_element.text == name
        print sub_element.text
        element.find_element(@input_parameter_left.value[:type], @input_parameter_left.value[:value]).send_keys left_param
        element.find_element(@input_parameter_right.value[:type], @input_parameter_right.value[:value]).send_keys right_param
        break
      end
    end
    self.hide_keyboard
  end

  def save_filter
    @button_apply.click
  end
end