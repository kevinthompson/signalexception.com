require 'spec_helper'

describe 'link_text' do
  it 'should return "Home" when argument is blank' do
    input = ''
    text  = link_text(input)
    text.should eq 'Home'
  end

  context 'with an array argument' do
    it 'returns the last segment of the array humanized' do
      input = %w[some long path]
      text  = link_text(input)
      text.should eq 'Path'
    end
  end

  context 'with an invalid input type' do
    it 'should raise an error' do
      input = { bad: 'data' }
      expect { link_text(hash) }.to raise_error(Exceptions::InvalidInputType)
    end
  end
end

describe 'path_array' do
  let(:request) { Object.new }
  it 'removes empty strings from path segments' do
    request.stub(:path).and_return('/')
    path_array.should eq []
  end
end