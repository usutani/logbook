require 'rails_helper'

describe '飲食店管理機能', type: :system do
  let(:user_a) { FactoryBot.create(:user, name: 'ユーザーA', email: 'a@example.com') }
  let(:user_b) { FactoryBot.create(:user, name: 'ユーザーB', email: 'b@example.com') }
  let!(:restaurant_a) { FactoryBot.create(:restaurant, name: '最初の飲食店', user: user_a) }

  before do
    visit login_path
    fill_in 'メールアドレス', with: login_user.email
    fill_in 'パスワード', with: login_user.password
    click_button 'ログインする'
  end

  shared_examples_for 'ユーザーAが作成した飲食店が表示される' do
    it { expect(page).to have_content '最初の飲食店' }
  end

  describe '一覧表示機能' do
    context 'ユーザーAがログインしているとき' do
      let(:login_user) { user_a }

      it_behaves_like 'ユーザーAが作成した飲食店が表示される'
    end

    context 'ユーザーBがログインしているとき' do
      let(:login_user) { user_b }

      it 'ユーザーAが作成した飲食店が表示されない' do
        expect(page).to have_no_content '最初の飲食店'
      end
    end
  end

  describe '詳細表示機能' do
    context 'ユーザーAがログインしているとき' do
      let(:login_user) { user_a }

      before do
        visit restaurant_path(restaurant_a)
      end

      it_behaves_like 'ユーザーAが作成した飲食店が表示される'
    end
  end

  describe '新規作成機能' do
    let(:login_user) { user_a }
    let(:restaurant_name) { '新規に登録した飲食店' } # デフォルトとして設定

    before do
      visit new_restaurant_path
      fill_in '店名', with: restaurant_name
      click_button '登録する'
    end

    context '新規作成画面で店名を入力したとき' do
      it '正常に登録される' do
        expect(page).to have_selector '.alert-success', text: '新規に登録した飲食店'
      end
    end

    context '新規作成画面で店名を入力しなかったとき' do
      let(:restaurant_name) { '' }

      it 'エラーとなる' do
        within '#error_explanation' do
          expect(page).to have_content '店名を入力してください'
        end
      end
    end
  end
end
