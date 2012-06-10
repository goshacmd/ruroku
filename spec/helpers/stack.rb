module Helpers
  def stack_data
    {
      name: 'cedar', current: true, requested: false, beta: true
    }
  end

  def stacks_response
    stubbed_response [stack_data]
  end
end
