require 'spec_helper'

describe Ruroku::ReleaseSet do
  before do
    @set = Ruroku::ReleaseSet.new stubbed_app
    @set_api = @set.api
  end

  describe '#rollback' do
    it 'maps to post_release api method' do
      @set_api.should_receive :post_release
      @set.rollback 'v1'
    end
  end
end
