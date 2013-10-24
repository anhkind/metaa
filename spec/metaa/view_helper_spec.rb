require 'spec_helper'

module Metaa
  describe ViewHelpers do
    let(:subject) { Class.new{include ViewHelpers}.new }

    describe "#add_meta_tags" do
      it "adds the meta tags from an input array" do
        meta = [
          { name: 'keywords', content: 'abc'}
        ]

        subject.add_meta_tags meta
        expect(subject.send :meta_tags).to eq([
          { name: 'keywords', content: 'abc'}
        ])
      end

      it "adds the meta tags from an input hash" do
        meta = { name: 'keywords', content: 'abc'}

        subject.add_meta_tags meta
        expect(subject.send :meta_tags).to eq([
          { name: 'keywords', content: 'abc'}
        ])
      end
    end

    describe "#display_meta_tags" do
      it "displays the added meta tags" do
        subject.stub meta_tags: [
                                  { name: 'keywords', content: 'abc'}
                                ]

        expect(subject.display_meta_tags).to eq "<meta content=\"abc\" name=\"keywords\" />"
      end

    end
  end
end

