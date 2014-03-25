require 'spec_helper'


describe User do
	let (:valid_attrs){ {
			first_name: 'Steve',
			last_name: "Smith",
			role: "launcher",
			fun_fact: "I'm a unicorn",
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

	it 'requires a role' do
		user = User.new(valid_attrs.merge(role:'experience engineer'))
		expect(user).to be_valid
	end

	it 'optionally takes a funfact' do 
    user = User.new(valid_attrs.merge(fun_fact: "I love Steve"))
    expect(user).to be_valid  
	end

	it 'optionally takes a funfact' do 
    user = User.new(valid_attrs.merge(fun_fact:""))
    expect(user).to be_valid  
	end

  it 'requires an email' do 
    user = User.new(valid_attrs.merge(email: ""))
    expect(user).to_not be_valid 
    expect(user.errors[:email]).to include "can't be blank" 
  end

  it 'should have a valid email' do
   	user = User.new(valid_attrs)
    expect(user).to be_valid
    user.email = 'not.com'
    expect(user).to_not be_valid
    user.email = 'hello@'
    expect(user).to_not be_valid
  end

  context "user instance methods" do
      it "names all the groups users belong to" do
        user = User.create(valid_attrs)
        interest_group = InterestGroup.create!(name: 'rails', creator: user)
        interest_group2 = InterestGroup.create!(name: 'django', creator: user)
        interest_group3 = InterestGroup.create!(name: 'CakePHP', creator: user)
        expect(user.number_of_groups_they_belong_to).to eql(3)
      end

      # it "shows number of posts the've made" do
      # end

      # it "shows the number of comments they've made" do

      # end

    end


end

