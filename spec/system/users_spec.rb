# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :system do
  before do
    OmniAuth.config.mock_auth[:twitter] = nil
  end

  describe 'ログイン処理' do
    context 'ログインボタンを押してTwitter認証を許可した時' do
      it 'ログインができる' do
        Rails.application.env_config['omniauth.auth'] = twitter_mock
        visit root_path
        find_link('ログイン', href: '/auth/twitter').click
        expect(page).to have_content('ログインしました')
      end
    end
    context 'ログインボタンを押してTwitter認証をキャンセルした時' do
      it 'ログインができない' do
        Rails.application.env_config['omniauth.auth'] = twitter_invalid_mock
        visit root_path
        find_link('ログイン', href: '/auth/twitter').click
        expect(page).to have_content('キャンセルしました')
      end
    end
  end

  describe 'ログアウト処理' do
    before do
      Rails.application.env_config['omniauth.auth'] = twitter_mock
      visit root_path
      find_link('ログイン', href: '/auth/twitter').click
    end
    it 'ログアウトができること' do
      expect(page).to have_content('ログアウト')
    end
  end

  describe 'ログイン状態による画面表示の確認' do
    context 'ログインしていない場合' do
      before { visit root_path }
      it 'ヘッダーに新規作成・投稿一覧ボタンが表示されないこと' do
        within('nav') do
          expect(page).to_not have_content('新規作成')
          expect(page).to_not have_content('投稿一覧')
        end
      end
    end
    context 'ログインしている場合' do
      before do
        Rails.application.env_config['omniauth.auth'] = twitter_mock
        visit root_path
        find_link('ログイン', href: '/auth/twitter').click
      end
      it 'ヘッダーに新規作成・投稿一覧ボタンが表示されないこと' do
        within('nav') do
          expect(page).to have_content('新規作成')
          expect(page).to have_content('投稿一覧')
        end
      end
    end
  end
end
