require 'spec_helper'

module Metaa
  describe Concern do

    describe "#meta_tags" do
      it "returns meta tags for self" do
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

    describe "#meta_class" do
      it "delegates to .meta_class" do
        model = Model.new

        Model.should_receive(:meta_class).and_return(:some_meta)
        expect(model.meta_class).to be :some_meta
      end
    end
  end
end