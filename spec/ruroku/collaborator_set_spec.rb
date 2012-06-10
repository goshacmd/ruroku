require 'spec_helper'

describe Ruroku::CollaboratorSet do
  before do
    @set = Ruroku::CollaboratorSet.new stubbed_app
    @set_api = @set.api
  end

  describe '#add' do
    it 'maps to post_collaborator api method' do
      @set_api.should_receive :post_collaborator
      @set.add 'example@me.com'
    end
  end

  describe '#delete' do
    it 'maps to delete_collaborator api method' do
      @set_api.should_receive :delete_collaborator
      @set.delete 'example@me.com'
    end
  end
end
