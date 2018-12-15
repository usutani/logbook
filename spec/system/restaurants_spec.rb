require 'rails_helper'

describe '飲食店管理機能', type: :system do
  let(:user_a) { FactoryBot.create(:user, name: 'ユーザーA', email: 'a@example.com') }
  let(:user_b) { FactoryBot.create(:user, name: 'ユーザーB', email: 'b@example.com') }

  describe '一覧表示機能' do
    before do
      FactoryBot.create(:restaurant, name: '最初の飲食店', user: user_a)
      visit login_path
      fill_in 'メールアドレス', with: login_user.email
      fill_in 'パスワード', with: login_user.password
      click_button 'ログインする'
    end

    context 'ユーザーAがログインしているとき' do
      let(:login_user) { user_a }

      it 'ユーザーAが作成した飲食店が表示される' do
        expect(page).to have_content '最初の飲食店'
      end
    end

    context 'ユーザーBがログインしているとき' do
      let(:login_user) { user_b }

      it 'ユーザーAが作成した飲食店が表示されない' do
        expect(page).to have_no_content '最初の飲食店'
      end
    end
  end
end
