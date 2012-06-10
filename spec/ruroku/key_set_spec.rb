require 'spec_helper'

describe Ruroku::KeySet do
  before do
    @set = Ruroku::KeySet.new stubbed_app
    @set_api = @set.api
  end

  describe '#add' do
    it 'maps to post_key api method' do
      @set_api.should_receive :post_key
      @set.add 'key content'
    end
  end

  describe '#delete' do
    it 'maps to delete_key api method' do
      @set_api.should_receive :delete_key
      @set.delete 'example@me.com'
    end
  end

  describe '#delete_all' do
    it 'maps to delete_keys api method' do
      @set_api.should_receive :delete_keys
      @set.delete_all
    end
  end
end
