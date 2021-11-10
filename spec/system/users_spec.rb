# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :system do
  before do
    twitter_mock
  end

  describe 'ログイン処理' do
    context '認証が成功した時' do
      it 'ログインができる' do
        visit root_path
        find_link('ログイン', href: '/auth/twitter').click
        expect(page).to have_content('ログインしました')
      end
    end
    context '認証が失敗した時' do
      before { twitter_invalid_mock }
      it 'ログインができない' do
        visit root_path
        find_link('ログイン', href: '/auth/twitter').click
        expect(page).to have_content('キャンセルしました')
      end
    end
  end

  describe 'ログアウト処理' do
    before do
      visit root_path
      find_link('ログイン', href: '/auth/twitter').click
    end
    it 'ログアウトができること' do
      expect(page).to have_content('ログアウト')
    end
  end

  describe 'ログイン状態による画面表示の確認' do
    context 'ログインしていない場合' do
      it 'ヘッダーに新規作成・投稿一覧ボタンが表示されないこと' do
        visit root_path
        within('nav') do
          expect(page).to_not have_content('新規作成')
          expect(page).to_not have_content('投稿一覧')
        end
      end
      it 'code新規作成画面に遷移できず、代わりにwelcome画面に遷移すること' do
        visit new_code_path
        within('.title') do
          expect(page).to have_content('ついこーど')
        end
      end
    end
    context 'ログインしている場合' do
      before do
        visit root_path
        find_link('ログイン', href: '/auth/twitter').click
      end
      it 'ヘッダーに新規作成・投稿一覧ボタンが表示されないこと' do
        within('nav') do
          expect(page).to have_content('新規作成')
          expect(page).to have_content('投稿一覧')
        end
      end
      it 'code新規作成画面に遷移できること' do
        visit new_code_path
        within('.title') do
          expect(page).to have_content('新規作成')
        end
      end
    end
  end
end
