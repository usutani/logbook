require 'rails_helper'

describe '飲食店管理機能', type: :system do
  describe '一覧表示機能' do
    before do
      # ユーザーAを作成しておく
      # 作成者がユーザAである飲食店を作成しておく
      user_a = FactoryBot.create(:user, name: 'ユーザーA', email: 'a@example.com')
      FactoryBot.create(:restaurant, name: '最初の飲食店', user: user_a)
    end

    context 'ユーザーAがログインしているとき' do
      before do
        # ユーザAでログインする
        visit login_path
        fill_in 'メールアドレス', with: 'a@example.com'
        fill_in 'パスワード', with: 'password'
        click_button 'ログインする'
      end

      it 'ユーザーAが作成した飲食店が表示される' do
        # 作成済みの飲食店がの名称が画面上に表示されていることを確認
        expect(page).to have_content '最初の飲食店'
      end
    end
  end
end
