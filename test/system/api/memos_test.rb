# frozen_string_literal: true

require 'application_system_test_case'

class API::MemosTest < ApplicationSystemTestCase
  def setup
    login_user 'komagata', 'testtest'
  end

  test 'show memo' do
    visit '/reservation_calenders/201911'
    assert_equal '席予約一覧 | FJORD BOOT CAMP（フィヨルドブートキャンプ）', title

    within('#memo-2019-11-01') do
      find('label[for="2019-11-01"]').click
      fill_in 'memo[body]', with: 'イベント：潮干狩り'
      click_button '作成'
    end
    within('#memo-2019-11-01') do
      assert_text 'イベント：潮干狩り'
    end
  end

  test 'create memo' do
    visit '/reservation_calenders/201911'
    assert_equal '席予約一覧 | FJORD BOOT CAMP（フィヨルドブートキャンプ）', title

    within('#memo-2019-11-01') do
      find('label[for="2019-11-01"]').click
      fill_in 'memo[body]', with: 'イベント：潮干狩り'
      click_button '作成'
    end
    within('#memo-2019-11-01') do
      assert_text 'イベント：潮干狩り'
    end
  end

  test 'update memo' do
    visit '/reservation_calenders/201911'
    assert_equal '席予約一覧 | FJORD BOOT CAMP（フィヨルドブートキャンプ）', title

    within("#memo-#{memos(:memo1).date}") do
      find("label[for='#{memos(:memo1).date}']").click
      fill_in 'memo[body]', with: 'イベント：潮干狩り'
      click_button '更新'
    end
    within("#memo-#{memos(:memo1).date}") do
      assert_text 'イベント：潮干狩り'
    end
  end

  test 'delete memo' do
    visit '/reservation_calenders/201911'
    assert_equal '席予約一覧 | FJORD BOOT CAMP（フィヨルドブートキャンプ）', title

    within("#memo-#{memos(:memo1).date}") do
      find("label[for='#{memos(:memo1).date}']").click
      click_button '削除'
    end
    within("#memo-#{memos(:memo1).date}") do
      assert_no_text memos(:memo1).body
    end
  end

  test "cann't delete memo when the user non-admin" do
    login_user 'kimura', 'testtest'
    visit '/reservation_calenders/201911'
    assert_equal '席予約一覧 | FJORD BOOT CAMP（フィヨルドブートキャンプ）', title

    within("#memo-#{memos(:memo1).date}") do
      assert_no_selector('#memo')
    end
  end
end
