require 'spec_helper'

describe GroupMembership do
  let(:user){User.create(first_name: 'Bob', last_name: 'Bill', email: 'test@test.com')}
  let(:interest_group){InterestGroup.create(name: 'Best group ever', creator: user)}
  let(:group_membership){GroupMembership.new(user: user, interest_group: interest_group)}

  it 'should belong to a user' do
    expect(group_membership).to respond_to(:user)
  end

  it 'should belong to a interest group' do
    expect(group_membership).to respond_to(:interest_group)
  end

  it 'should validate the presence of a user' do
    group_membership.user = nil
    expect(group_membership).to_not be_valid
    expect(group_membership.errors[:user]).to include("can't be blank")
  end
  
  it 'should validate the presence of an interest group' do
    group_membership.interest_group = nil
    expect(group_membership).to_not be_valid
    expect(group_membership.errors[:interest_group]).to include("can't be blank")
  end
end