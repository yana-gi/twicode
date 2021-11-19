# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe '.find_or_create_from_auth_hash' do
    let(:auth_hash) do
      {
        provider: 'twitter',
        uid: 'uid',
        info: {
          nickname: 'twicode',
          name: 'TwiCode',
          image: 'http://example.com/twicode.jpg'
        }
      }
    end

    context 'uidに対応するUserが作成されていないとき' do
      it '引数で設定した属性のUserオブジェクトが返ること' do
        user = User.find_or_create_from_auth_hash(auth_hash)
        expect(user.uid).to eq 'uid'
        expect(user.twitter_id).to eq 'twicode'
        expect(user.twitter_name).to eq 'TwiCode'
        expect(user.twitter_icon).to eq 'http://example.com/twicode.jpg'
        expect(user).to be_persisted
      end

      it 'Userモデルのレコードが一件増えていること' do
        expect { User.find_or_create_from_auth_hash(auth_hash) }.to change { User.count }.from(0).to(1)
      end
    end

    context 'uidに対応するUserが既に作成されているとき' do
      let!(:created_user) { FactoryBot.create(:user, uid: 'uid') }

      it '引数に対応するUserレコードのオブジェクトが返ること' do
        user = User.find_or_create_from_auth_hash(auth_hash)
        expect(user).to eq created_user
      end

      it 'Userモデルのレコード件数が変化していないこと' do
        expect { User.find_or_create_from_auth_hash(auth_hash) }.not_to change(User, :count)
      end
    end
  end
end
