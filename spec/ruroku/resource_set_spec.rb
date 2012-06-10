require 'spec_helper'

describe Ruroku::ResourceSet do
  describe '.map_api' do
    before do
      class MyResource < Ruroku::Base; end
      class MyResourceSet < Ruroku::ResourceSet
        resource_class MyResource
        collection_api_selector :query_collection
        map_api my_method: :api_mapping
      end
    end

    it 'defines the method' do
      MyResourceSet.new(stubbed_api).respond_to?(:my_method).should be_true
    end

    it 'calls api mapping' do
      api_object = stubbed_api
      api_object.should_receive(:api_mapping).with 'param'

      my_resource_set = MyResourceSet.new api_object
      my_resource_set.my_method 'param'
    end
  end
end
