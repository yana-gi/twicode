# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Code', type: :system do
  let!(:login_user) { FactoryBot.create(:user, uid: '123456') }
  let!(:user_a) { FactoryBot.create(:user, uid: '111111') }

  before do
    mock_twitter!
    visit root_path
    find_link('ログイン', href: '/auth/twitter').click
  end
  describe '新規作成' do
    before { visit new_code_path }

    context 'CodeのBodyが空文字の場合' do
      it '保存ができず、エラーメッセージが表示されること' do
        click_on '画像を作成する'
        expect(page).to have_content 'Codeを入力してください'
      end
    end
    context 'CodeのBodyが空文字ではない場合' do
      it 'Codeの保存に成功し、詳細画面に遷移すること' do
        select 'Ruby', from: 'code_language'
        fill_in 'code_body', with: 'test'
        fill_in 'code_title', with: 'Test title'
        click_on '画像を作成する'
        expect(page).to have_content '詳細画面'
        expect(page).to have_content '画像を作成しました'
      end
    end

    describe 'title' do
      context 'Codeのtitleが空文字の場合' do
        before do
          select 'Ruby', from: 'code_language'
          fill_in 'code_body', with: 'test'
          click_on '画像を作成する'
          expect(page).to have_content '詳細画面'
        end
        it '自動でタイトルが設定されること' do
          expect(page).to have_content 'Code of'
        end
      end
    end
  end

  describe '詳細画面' do
    before do
      code = FactoryBot.create(:code, user: login_user)
      visit code_path(code)
      expect(page).to have_content '詳細画面'
    end

    it 'テキストコードが表示されること' do
      expect(page).to have_content 'test'
    end
    it '画像が表示されること' do
      expect(page).to have_css '#code-image'
    end
    it 'Tweetボタンが表示されること' do
      expect(page).to have_link 'Tweetする'
    end

    describe '削除ボタン' do
      context '作成したユーザーの場合' do
        it 'Codeの削除ができること' do
          click_on '削除'
          page.accept_confirm
          expect(page).to have_content '削除しました'
        end
      end
      context '作成したユーザー以外の場合' do
        before do
          find('.is-hoverable').hover
          click_on 'ログアウト'
          expect(page).to have_content 'ログアウトしました'
        end
        it 'Codeの削除ボタンが表示されないこと' do
          code = Code.last
          visit code_path(code)
          expect(page).to_not have_content '削除'
        end
      end
    end

    describe '一覧へ遷移するボタン' do
      it 'コードを作成したユーザーの一覧画面に遷移すること' do
        find('.user-code-index-link').click
        expect(page).to have_content '投稿一覧'
      end
    end
  end

  describe '一覧画面' do
    before do
      FactoryBot.create(:code, title: 'Code of login_user', user: login_user)
      FactoryBot.create(:code, title: 'Code of user_a', user: user_a)
      click_on '投稿一覧'
    end

    it 'ユーザー名が表示されること' do
      expect(page).to have_content 'Mock Userの投稿一覧'
    end
    it '画像をクリックすると詳細画面に遷移すること' do
      find('.code-image').click
      expect(page).to have_content '詳細画面'
    end
    it 'ユーザーが作成したCodeのみが表示されること' do
      expect(page).to have_content 'Code of login_user'
      expect(page).to_not have_content 'Code of user_a'
    end
  end
end
