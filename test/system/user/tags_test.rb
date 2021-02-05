# frozen_string_literal: true

require 'application_system_test_case'

class User::TagsTest < ApplicationSystemTestCase
  setup { login_user 'hatsuno', 'testtest' }

  test 'add user tag' do
    visit '/users/tags/猫'
    click_on 'このタグを自分にも追加'
    assert_no_text 'このタグを自分にも追加'
  end
end
