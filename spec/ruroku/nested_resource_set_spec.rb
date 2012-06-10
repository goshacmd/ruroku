require 'spec_helper'

describe Ruroku::NestedResourceSet do
  describe '.map_api' do
    before do
      class MyResource < Ruroku::Base; end
      class MyNestedResourceSet < Ruroku::NestedResourceSet
        resource_class MyResource
        collection_api_selector :query_collection

        map_api my_method: :api_mapping
      end
    end

    it 'defines the method' do
      MyNestedResourceSet.new(stubbed_app).respond_to?(:my_method).should be_true
    end

    it 'calls api mapping' do
      app = stubbed_app
      app.api.should_receive(:api_mapping).with app.name, 'param'

      my_nested_resource_set = MyNestedResourceSet.new app
      my_nested_resource_set.my_method 'param'
    end
  end
end
