module Helpers
  def user_data
    {
      id: 1, name: 'Test User', email: 'example@me.com', confirmed: true,
      verified: true, confirmed_at: Time.parse('01/01/2012 00:00'),
      verified_at: Time.parse('01/01/2012 00:01'),
      last_login: Time.parse('06/06/2012 11:50'),
      created_at: Time.parse('01/01/2012 00:00')
    }
  end

  def user_response
    stubbed_response user_data
  end
end
