require 'spec_helper'


describe InterestGroup do
  let (:valid_attrs){{name: 'Steve', description: "All about steve"}}

  describe 'validation' do
  	context "when given valid attributes" do
  		it "is valid" do
  			interest_group = InterestGroup.new(valid_attrs)
  		end
    end
  end

	it 'requires a name' do
		interest_group = InterestGroup.new(valid_attrs.merge(name: ''))
    expect(interest_group).to_not be_valid
		expect(interest_group.errors[:name]).to include "can't be blank"
	end


	it 'optionally takes a description' do 
    interest_group = InterestGroup.new(valid_attrs.merge(description: "I love Steve"))
    expect(interest_group).to be_valid  
  end


  it 'optionally takes a description' do 
    interest_group = InterestGroup.new(valid_attrs.merge(description: " "))
    expect(interest_group).to be_valid  
  end

 let (:creator_attributes) {{
    first_name: "Barry",
    last_name: "Zuckercorn",
    email: "barry@hesverygood.com",
    role: "launcher"
  }}

  it 'should have a creator' do
    creator = User.create(creator_attributes)
    interest_group = InterestGroup.create(name: "Steve", description: "All About Steeve", creator: creator)
    expect(interest_group.creator).to eql creator
  end	
end

