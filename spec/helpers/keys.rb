module Helpers
  def key_data
    {
      contents: 'ssh-rsa ...key data... david@carbon.local',
      email: 'keyowner@domain.com'
    }
  end

  def keys_response
    stubbed_response [key_data]
  end
end
