# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Code', type: :system do
  before do
    twitter_mock
    visit root_path
    find_link('ログイン', href: '/auth/twitter').click
  end
  describe '新規作成' do
    before { visit new_code_path }

    context 'CodeのBodyが空文字の場合' do
      it '保存ができず、エラーメッセージが表示されること' do
        click_on '投稿する'
        expect(page).to have_content 'コードを入力してください'
      end
    end
    context 'CodeのBodyが空文字ではない場合' do
      it 'Codeの保存に成功し、詳細画面に遷移すること' do
        select 'Ruby', from: 'parse_language'
        fill_in 'code_body', with: 'test'
        click_on '投稿する'
        expect(page).to have_content '詳細画面'
        expect(page).to have_content 'コードを投稿しました'
      end
    end
  end

  describe '詳細画面' do
    before do
      visit new_code_path
      select 'Ruby', from: 'parse_language'
      fill_in 'code_body', with: 'test'
      click_on '投稿する'
    end
    it 'テキストコードが表示されること' do
      expect(page).to have_content 'test'
    end
    it '画像が表示されること'

    it 'Tweetボタン'

    describe '削除ボタン' do
      context '作成したユーザーの場合' do
        it 'Codeの削除ができること' do
          click_on '削除'
          page.accept_confirm
          expect(page).to have_content 'コードを削除しました'
        end
      end
      context '作成したユーザー以外の場合' do
        before { click_on 'ログアウト' }
        it 'Codeの削除ボタンが表示されないこと' do
          code = Code.last
          visit code_path(code)
          expect(page).to_not have_content '削除'
        end
      end
    end

    describe '戻るボタン' do
      it 'コードを作成したユーザーの一覧画面に遷移すること'
    end
  end

  describe '一覧画面' do
    it 'ユーザー名が表示されること'
    it 'ユーザーが作成したCodeのみが表示されること'
    it '画像をクリックすると詳細画面に遷移すること'
  end
end
