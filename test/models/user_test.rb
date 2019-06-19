# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'the truth' do
    assert true
  end

  test 'should not save user without password' do
    user = User.new(name: 'Nick', email: 'nick@email.com')
    assert_not user.save
  end
end
