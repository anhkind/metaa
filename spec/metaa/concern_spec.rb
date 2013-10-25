require 'spec_helper'

module Metaa
  describe Concern do
    describe "meta" do
      it "returns meta object for self" do
        model = Model.new
        meta = model.meta

        expect(meta).to be_a ModelMeta
        expect(meta.object).to be model
      end

      it "uses the #meta_class" do
        model = Model.new
        model.stub meta_class: OtherMeta

        expect(model.meta).to be_an_instance_of OtherMeta
      end
    end

    describe "#meta_tags" do
      it "returns html meta tags for self" do
        meta_mock = double :meta, to_html: "<meta content=\"a title\" name=\"title\" property=\"text\" />"
        model     = Model.new
        model.stub meta: meta_mock

        html = model.meta_tags

        expect(html).to eq "<meta content=\"a title\" name=\"title\" property=\"text\" />"
      end
    end

    describe "#meta_class" do
      it "delegates to .meta_class" do
        model = Model.new

        Model.should_receive(:meta_class).and_return(:some_meta)
        expect(model.meta_class).to be :some_meta
      end
    end
  end
end