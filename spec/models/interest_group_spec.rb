require 'spec_helper'

describe InterestGroup do
  let (:valid_attrs){{name: 'Steve'}}

  describe 'validation' do
  	context "when given calid attributes" do
  		it "is valid" do
  			interest_group = InterestGroup.new(valid_attrs)
  		end
  	end

  	it 'requires a name' do
  		interest_group = InterestGroup.new(valid_attrs.merge(name: ''))
  		expect(interest_group.errors[:name]).to include "can't be blank"
  	end
end
