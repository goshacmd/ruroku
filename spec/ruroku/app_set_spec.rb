require 'spec_helper'

describe Ruroku::AppSet do
  before do
    @set = Ruroku::AppSet.new stubbed_api
    @set_api = @set.api
  end

  describe '#create' do
    it 'maps to post_app api method' do
      @set_api.should_receive :post_app
      @set.create 'another-app', 'cedar'
    end
  end
end
