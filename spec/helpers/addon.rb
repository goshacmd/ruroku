module Helpers
  def addon_data
    {
      name: 'example:basic', description: 'The Example Basic addon.',
      state: 'public', beta: false
    }
  end

  def addons_response
    stubbed_response [addon_data]
  end
end
