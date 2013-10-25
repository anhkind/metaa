require 'spec_helper'

module Metaa
  describe Meta do
    describe '#meta' do
      it 'defines a meta tag' do
        meta_obj = Class.new(Meta).new
        meta_obj.meta name: 'title'

        tags = meta_obj.tag_collection.tags
        expect(tags.length).to eq 1

        tag = tags.first
        expect(tag.attributes).to eq({
          name: 'title'
        })
      end
    end

    describe '#tag_collection' do
      it 'returns meta tags for an object' do
        klass = Class.new(Meta) do
          def define_meta
            meta  name:     'title',
                  property: :text,
                  content:  object.title
          end
        end

        object_mock = double title: 'a title'
        meta        = klass.new(object_mock)

        expect(meta.tag_collection).to be_a TagCollection
      end
    end

    describe '#html' do
      it 'returns the meta html tags for an object' do
        object_mock = double title: 'a title'
        klass = Class.new(Meta) do
          def define_meta
            meta  name:     'title',
                  property: :text,
                  content:  object.title
          end
        end

        meta = klass.new(object_mock)

        expect(meta.to_html).to eq "<meta content=\"a title\" name=\"title\" property=\"text\" />"

        # run it again would render the same result
        expect(meta.to_html).to eq "<meta content=\"a title\" name=\"title\" property=\"text\" />"
      end
    end
  end
end