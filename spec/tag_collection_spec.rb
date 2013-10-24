require 'spec_helper'

describe Metaa::TagCollection do
  describe '#add' do
    it 'add a meta object to internal list' do
      meta_collection = Metaa::TagCollection.new
      meta_collection.add Metaa::Tag.new({:name => 'keywords', :content => 'abc, xyz'})
      expect(meta_collection.items.first.attributes).to eq({:name => 'keywords', :content => 'abc, xyz'})
    end

    it 'add a hash as a new meta object to internal list' do
      meta_collection = Metaa::TagCollection.new
      meta_collection.add({:name => 'keywords', :content => 'abc, xyz'})
      expect(meta_collection.items.first.attributes).to eq({:name => 'keywords', :content => 'abc, xyz'})
    end
  end

  describe '#html' do
    it 'converts list of meta objects to html' do
      meta_list = [
        Metaa::Tag.new({:name => 'keywords', :content => 'abc, xyz'}),
        Metaa::Tag.new({:name => 'keywords', :content => '123, 456'})
      ]
      meta_collection = Metaa::TagCollection.new(meta_list)
      expect(meta_collection.html).to eq "<meta content=\"abc, xyz\" name=\"keywords\" /><meta content=\"123, 456\" name=\"keywords\" />"
    end
  end

end