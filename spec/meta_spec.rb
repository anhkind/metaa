require 'spec_helper'

describe Metaa::Meta do
  it 'converts a meta object to html' do
    meta      = Metaa::Meta.new({:name => 'keywords', :content => 'abc, xyz'})
    expect(meta.html).to eq "<meta content=\"abc, xyz\" name=\"keywords\" />"
  end
end