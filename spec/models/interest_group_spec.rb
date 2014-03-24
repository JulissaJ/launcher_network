require 'spec_helper'


describe InterestGroup do
  let (:valid_attrs){{name: 'Steve'}}

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

	# it 'requires a creator' do
 #    interest_group = InterestGroup.new(valid_attrs)
 #    expect(interest_group).to_not be_valid
	#  	expect(interest_group.errors[:creator]).to include "need a creator"
	#  end

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
      exp_engineer: true,
      launcher: false
    }}
    
  describe 'associations' do
    it 'should have a creator' do
      # create a User object
      
      creator = User.create(creator_attributes)
      # create an InterestGroup object with that user object as the creator
      group_attributes = {
        name: "Excuses",
        creator: creator
      }
      

      group = InterestGroup.create(group_attributes)
      
      expect(group.creator).to eq creator
    end
  end		
end


