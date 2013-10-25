require 'spec_helper'

module Metaa
  describe Tag do
    it 'converts a meta tag to html' do
      tag = Tag.new({name: 'keywords', content: 'abc'})
      expect(tag.html).to eq "<meta content=\"abc\" name=\"keywords\" />"
    end
  end
end