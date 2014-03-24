require 'spec_helper'


describe User do
	let (:valid_attrs){ {
			first_name: 'Steve',
			last_name: "Smith",
			fun_fact: "I'm a unicorn",
			exp_engineer: false,
			launcher: true,
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
		user = User.new(valid_attrs.merge(first_name: ''))
    expect(user).to_not be_valid
		expect(user.errors[:first_name]).to include "can't be blank"
	end

	it 'requires a last name' do
		user = User.new(valid_attrs.merge(last_name: ''))
    expect(user).to_not be_valid
		expect(user.errors[:last_name]).to include "can't be blank"
	end


	it 'optionally takes a funfact' do 
    user = User.new(valid_attrs.merge(fun_fact: "I love Steve"))
    expect(user).to be_valid  
	end

  it 'requires an email' do 
    user = User.new(valid_attrs.merge(email: ""))
    expect(user).to_not be_valid 
    expect(user.errors[:email]).to include "can't be blank" 
  end

 #  context 'Is either a launcher or an EE' do
	# 	it 'requires an email' do 
	# 	  user = User.new(valid_attrs.merge(description: " "))
	# 	  expect(user).to be_valid  
	# 	end
	# end
end
