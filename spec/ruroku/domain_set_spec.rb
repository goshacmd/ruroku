require 'spec_helper'

describe Ruroku::DomainSet do
  before do
    @set = Ruroku::DomainSet.new stubbed_app
    @set_api = @set.api
  end

  describe '#add' do
    it 'maps to post_domain api method' do
      @set_api.should_receive :post_domains
      @set.add 'example.com'
    end
  end

  describe '#delete' do
    it 'maps to delete_domain api method' do
      @set_api.should_receive :delete_domain
      @set.delete 'example.com'
    end
  end
end
