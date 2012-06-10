module Helpers
  def config_var_data
    {
      'KEY1' => 'value', 'KEY2' => 'value'
    }
  end

  def config_vars_response
    stubbed_response config_var_data
  end
end
