require 'spec_helper'

describe Ruroku::AddonSet do
  before do
    @set = Ruroku::AddonSet.new stubbed_app
    @set_api = @set.api
  end

  describe '#add' do
    it 'maps to post_addon api method' do
      @set_api.should_receive :post_addon
      @set.add 'example:basic'
    end
  end

  describe '#upgrade' do
    it 'maps to put_addon api method' do
      @set_api.should_receive :put_addon
      @set.upgrade 'example:pro'
    end
  end

  describe '#delete' do
    it 'maps to delete_addon api method' do
      @set_api.should_receive :delete_addon
      @set.delete 'example:basic'
    end
  end
end
