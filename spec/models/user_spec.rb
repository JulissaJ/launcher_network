require 'spec_helper'

describe User do
	let (:valid_attrs){ {
			first_name: 'Steve',
			last_name: "Smith",
			fun_fact: "I'm a unicorn"
			exp_engineer: false
			launcher: true
			email: "imsecretlyaunicorn@gmail.com"
			} }
  describe 'validation' do
  	context "when given valid attributes" do
  		it "is valid" do
  			user = User.new(valid_attrs)
  		end
    end
  end

	it 'requires a first name' do
		user = User.new(valid_attrs.merge(name: ''))
    expect(interest_group).to_not be_valid
		expect(interest_group.errors[:name]).to include "can't be blank"
	end

	it 'requires a last name' do
		user = User.new(valid_attrs.merge(name: ''))
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
end
