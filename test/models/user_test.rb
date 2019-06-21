# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'the truth' do
    assert true
  end

  test 'should not save user without a password' do
    user = User.new(name: 'Nick', email: 'nick@email.com')
    assert_not user.save
  end

  test 'should not save user without a name' do
    user = User.new(email: 'nick@email.com', password: 'password')
    assert_not user.save
  end

  test 'should not save user without an email' do
    user = User.new(name: 'Nick', password: 'password')
    assert_not user.save
  end

  test 'should save user with valid attriibutes' do
    user = User.new(name: 'nick', email: 'nick@email.com', password: 'password')
    assert user.save
  end
end
