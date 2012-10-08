require 'spec_helper'

describe 'page_class' do
  it 'returns "home" when path_array is empty' do
    stub!(:path_array).and_return([])
    page_class.should eq 'home'
  end
end