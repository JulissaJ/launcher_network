require 'spec_helper'

describe Comment do
  let(:user){User.create(first_name: 'Bill', last_name: 'Bob', email: 'test@test.com')} #Valid attribute fields
  let(:post){Post.create(title: "HELLO",  body: 'hello', author: user)} #This should correctly refer to author/user class
  let(:comment){Comment.new(body: 'comment', user: user, post: post)}

  it 'should belong to a user' do
    # A comment has the belongs to user method
    expect(comment).to respond_to(:user)
    # A comment should belong to the user it is associated with
    expect(comment.user).to eql(user)

  end

  it 'should belong to a post' do
    # A comment has the belongs to post method
    expect(comment).to respond_to(:post)
    # A comment should belong to the post that it is associated with
    expect(comment.post).to eql(post)
  end

  it 'should validate presence of user' do
    comment.user = nil
    expect(comment).to_not be_valid
    expect(comment.errors[:user]).to include("can't be blank")
  end

  it 'should validate presence of post' do
    comment.post = nil
    expect(comment).to_not be_valid
    expect(comment.errors[:post]).to include("can't be blank")
  end

  it 'should validate presence of body' do
    comment.body = nil
    expect(comment).to_not be_valid
    expect(comment.errors[:body]).to include("can't be blank")
  end
end


#:variable_name refers to a method not a let variable!
# examples lines 10,18,26,32