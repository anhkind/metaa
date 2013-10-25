require 'spec_helper'

module Metaa
  describe Meta do
    describe '#meta' do
      it 'defines a meta tag' do
        klass = Class.new(Meta) do
          def define_meta
            meta name: 'title'
          end
        end

        meta_obj = klass.new
        meta_obj.define_meta # trigger due to lazy load

        expect(meta_obj.definitions.length).to eq 1

        definition = meta_obj.definitions.first
        expect(definition.attributes).to eq({
          name: 'title'
        })
      end
    end

    describe '#tags' do
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

        expect(meta.tags.length).to eq 1

        tag = meta.tags.first
        expect(tag.html).to eq "<meta content=\"a title\" name=\"title\" property=\"text\" />"
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

        expect(meta.html).to eq "<meta content=\"a title\" name=\"title\" property=\"text\" />"
      end
    end
  end
end