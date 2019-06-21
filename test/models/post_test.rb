# frozen_string_literal: true

require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user = User.create(name: 'nick', email: 'nick@email.com', password: 'password')
    @tag = Tag.create(name: 'ruby')
    @category = Category.create(name: 'programming')
  end

  test 'post can be created with valid attriibutes' do
    @post = Post.new(title: 'programming help', content: 'here is my problem', user: @user, tag: @tag, category: @category)
    assert @post.save
  end

  test 'post cannot be created without title' do
    @post = Post.new(content: 'here is my problem', user: @user, tag: @tag, category: @category)
    assert_not @post.save
  end

  test 'post cannot be created without content' do
    @post = Post.new(title: 'programming help', user: @user, tag: @tag, category: @category)
    assert_not @post.save
  end

  test 'post cannot be created without user' do
    @post = Post.new(title: 'programming help', content: 'here is my problem', tag: @tag, category: @category)
    assert_not @post.save
  end

  test 'post cannot be created without tag' do
    @post = Post.new(title: 'programming help', content: 'here is my problem', user: @user, category: @category)
    assert_not @post.save
  end

  test 'post cannot be created without category' do
    @post = Post.new(title: 'programming help', content: 'here is my problem', user: @user, tag: @tag)
    assert_not @post.save
  end
end
