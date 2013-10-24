require 'spec_helper'

describe Metaa::Tag do
  it 'converts a meta tag to html' do
    tag = Metaa::Tag.new({name: 'keywords', content: 'abc'})
    expect(tag.html).to eq "<meta content=\"abc\" name=\"keywords\" />"
  end
end