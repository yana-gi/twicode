# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :system do
  describe 'ログイン処理' do
    describe 'ログイン状態' do
      context 'ログインしていない場合' do
        it 'ヘッダーにログインボタンが表示されること'
        it 'ヘッダーのログインボタンを押すとTwitterのログイン画面に遷移されること'
        it '新規登録画面に遷移するとログイン画面に遷移されること'
      end
      context 'ログインしている場合' do
        it 'ヘッダーにログアウトボタンが表示されること'
      end
    end

    describe 'Twitter認証' do
      context '成功時' do
        it '新規投稿画面に遷移すること'
        it '成功した旨のメッセージが表示されること'
        it 'user_idが取得できていること'
      end
      context '失敗時' do
        it 'トップ画面に戻ること'
        it '失敗した旨のメッセージが表示されること'
      end
      context '中断時' do
        it 'トップ画面に戻ること'
        it '中断した旨のメッセージが表示されること'
      end
    end
  end

  describe 'ログアウト処理' do
    describe 'ログアウトができること' do
      it 'ログアウトしましたと表示されること'
      it 'ヘッダーにログインボタンが表示されること'
    end
  end
end
