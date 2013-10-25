require 'spec_helper'

module Metaa
  describe Definition do
    describe '#attributes_for' do
      it 'returns calculated attributes for an object' do
        definition =  Definition.new({
          name:     'title',
          property: :text,
          content:  ->(object){ object.title }
        })

        object_mock = double title: 'a title'

        expect(definition.attributes_for(object_mock)).to eq({
          name:     'title',
          property: 'text',
          content:  'a title'
        })
      end
    end
  end
end
