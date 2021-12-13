# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :system do
  before do
    mock_twitter!
  end

  describe 'ログイン処理' do
    context '認証が成功した時' do
      it 'ログインができる' do
        visit root_path
        find_link('TwiCode を使ってみる', href: '/auth/twitter').click
        expect(page).to have_content('ログインしました')
      end
    end
    context '認証が失敗した時' do
      before { mock_twitter_failure! }
      it 'ログインができない' do
        visit root_path
        find_link('TwiCode を使ってみる', href: '/auth/twitter').click
        expect(page).to have_content('キャンセルしました')
      end
    end
  end

  describe 'ログアウト処理' do
    before do
      visit root_path
      find_link('TwiCode を使ってみる', href: '/auth/twitter').click
      find('.logout-link').click
    end
    it 'ログアウトができること' do
      expect(page).to have_content('ログアウトしました')
    end
  end

  describe 'ログイン状態による画面表示の確認' do
    context 'ログインしていない場合' do
      it 'root_pathにアクセスするとwelcome画面に遷移すること' do
        visit root_path
        expect(page).to have_content('TwitterでちょっとしたCodeを共有')
      end
      it 'code新規作成画面に遷移できず、代わりにwelcome画面に遷移すること' do
        visit new_code_path
        expect(page).to have_content('TwitterでちょっとしたCodeを共有')
      end
    end
    context 'ログインしている場合' do
      before do
        visit root_path
        find_link('TwiCode を使ってみる', href: '/auth/twitter').click
      end
      it 'Homeに新規作成ボタンが表示されること' do
        expect(page).to have_content('新しくコードを投稿する')
      end
      it 'code新規作成画面に遷移できること' do
        visit new_code_path
        within('h1') do
          expect(page).to have_content('コードの画像を作成')
        end
      end
    end
  end
end
