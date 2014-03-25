require 'spec_helper'

describe Post do
	 let(:author){User.create(first_name: 'Bill', last_name: 'Bob', email: 'test@test.com')}
	let(:interest_group){InterestGroup.create(name: "Tigers", description: "I love Tigers", creator: author)}
  let(:post){Post.new(body: 'hello', author: author, interest_group: interest_group)}


  it 'should belong to a author' do
    # Test that post has a method called user

    expect(post).to respond_to(:author)
    # Save the post and expect the post's user to be the user tha we associated with it
    post.save!
    expect(post.author).to eql(author)
  end

  it 'requires a author' do
    # set the post to not have a user

    post.author = nil
    expect(post).to_not be_valid
    expect(post.errors[:author]).to include("can't be blank")
  end

  it 'requires a body' do
    # set the post's body to be nil
    post.body = nil
    expect(post).to_not be_valid
    expect(post.errors[:body]).to include("can't be blank")
  end

  it 'does not allow a body to be more than 500 characters' do
    # set the post's body to be over 500 characters
    post.body = 'a' * 501
    expect(post).to_not be_valid
    expect(post.errors[:body]).to include("is too long (maximum is 500 characters)")
  end
  
  it 'has many comments' do
    post.save!
    # Check that the has many method exists
    expect(post).to respond_to(:comments)
    # Create a comment that we can then check if it gets associated with a post
    comment = Comment.create(user: author, body: 'hello', post:post)
    expect(post.comments).to include(comment)
  end

  it 'should return the most popular posts' do
    
    
    user = User.create!(first_name: 'a', last_name: 'b', email: 'a@b.com')
    interest_group = InterestGroup.create!(name: 'rails', creator: user)
    post1 = Post.create!(body: 'hello', author: author, interest_group: interest_group)
    post2 = Post.create!(body: 'hello world', author: author, interest_group: interest_group)
    post3 = Post.create!(body: 'goodbye world', author: author, interest_group: interest_group)
    
    5.times do
      Comment.create(user: user, body: 'comment', post: post1)
    end
    10.times do
      Comment.create(user: user, body: 'comment', post: post2)
    end
    15.times do
      Comment.create(user: user, body: 'comment', post: post3)
    end
    expect(Post.favorite).to eql(post3)
    10.times do
      Comment.create(user: user, body: 'comment', post: post2)
    end
    expect(Post.favorite).to eql(post2)
  end
end