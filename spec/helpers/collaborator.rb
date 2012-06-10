module Helpers
  def collaborator_data
    {
      email: 'example@me.com', access: 'edit'
    }
  end

  def collaborators_response
    stubbed_response [collaborator_data]
  end
end
