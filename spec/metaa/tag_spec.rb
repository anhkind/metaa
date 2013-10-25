require 'spec_helper'

module Metaa
  describe Tag do
    describe '#to_html' do
      it 'converts a meta tag to html' do
        tag = Tag.new({name: 'keywords', content: 'abc'})
        expect(tag.to_html).to eq "<meta content=\"abc\" name=\"keywords\" />"
      end
    end
  end
end