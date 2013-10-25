require 'spec_helper'

module Metaa
  describe TagCollection do
    describe '#empty?' do
      it 'returns empty if there is not tag' do
        meta_collection = TagCollection.new
        expect(meta_collection).to be_empty
      end
    end

    describe '#add' do
      it 'makes the list not to be empty anymore' do
        meta_collection = TagCollection.new
        meta_collection.add Tag.new({name: 'keywords', content: 'abc'})
        expect(meta_collection).not_to be_empty
      end

      it 'adds a meta object to internal list' do
        meta_collection = TagCollection.new
        meta_collection.add Tag.new({name: 'keywords', content: 'abc'})
        expect(meta_collection.tags).not_to be_empty

        added_tag = meta_collection.tags.first
        expect(added_tag.attributes).to eq({name: 'keywords', content: 'abc'})
      end

      it 'adds a hash as a new meta object to internal list' do
        meta_collection = TagCollection.new
        meta_collection.add({name: 'keywords', content: 'abc'})
        expect(meta_collection.tags.first.attributes).to eq({name: 'keywords', content: 'abc'})
      end
    end

    describe '#to_html' do
      it 'converts list of meta objects to html' do
        meta_list = [
          Tag.new({name: 'keywords', content: 'abc'}),
          Tag.new({name: 'keywords', content: '123, 456'})
        ]
        meta_collection = TagCollection.new(meta_list)
        expect(meta_collection.to_html).to eq "<meta content=\"abc\" name=\"keywords\" /><meta content=\"123, 456\" name=\"keywords\" />"
      end
    end
  end
end