require 'spec_helper'

module Metaa
  describe Meta do
    describe 'class methods' do
      describe '#meta' do
        it 'defines a meta tag' do
          klass = Class.new(Meta)
          block = ->(object){ object.title }

          klass.class_eval do
            meta  name:     'title',
                  property: :text,
                  content:  block
          end

          expect(klass.definitions.length).to eq 1

          definition = klass.definitions.first
          expect(definition.attributes).to eq({
            name:     'title',
            property: :text,
            content:   block
          })
        end
      end
    end

    describe '#tags' do
      it 'returns meta tags for an object' do
        klass = Class.new(Meta)

        klass.class_eval do
          meta  name:     'title',
                property: :text,
                content:  ->(object){ object.title }
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
        klass = Class.new(Meta)

        klass.class_eval do
          meta  name:     'title',
                property: :text,
                content:  ->(object){ object.title }
        end

        object_mock = double title: 'a title'
        meta        = klass.new(object_mock)

        expect(meta.html).to eq "<meta content=\"a title\" name=\"title\" property=\"text\" />"
      end
    end
  end
end