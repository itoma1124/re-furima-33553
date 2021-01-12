require 'rails_helper'

RSpec.describe 'Users', type: :system do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'トップページ' do
    it 'ログアウト状態では、ヘッダーに新規登録/ログインボタンが表示される' do
      visit root_path
      expect(page).to have_content('新規登録')
      expect(page).to have_content('ログイン')
    end
    it 'ログイン状態では、ヘッダーにユーザーのニックネーム/ログアウトボタンが表示される' do
      # @userの登録
      visit new_user_registration_path
      fill_in 'nickname', with: @user.nickname
      fill_in 'email', with: @user.email
      fill_in 'password', with: @user.password
      fill_in 'password_confirmation', with: @user.password_confirmation
      fill_in 'last-name', with: @user.family_name
      fill_in 'first-name', with: @user.first_name
      fill_in 'last-name-kana', with: @user.family_name_kana
      fill_in 'first-name-kana', with: @user.first_name_kana
      fill_in 'user_birthday_id_1i', with: @user.birthday_id.year
      fill_in 'user_birthday_id_2i', with: @user.birthday_id.month
      fill_in 'user_birthday_id_3i', with: @user.birthday_id.day
      click_on('会員登録')
      # @userでログイン
      visit new_user_session_path
      fill_in 'email', with: @user.email
      fill_in 'password', with: @user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      expect(page).to have_content('ログアウト')
    end
    it 'ヘッダーの新規登録ボタンをクリックすることで、新規登録ページに遷移する' do
      visit root_path
      click_on('新規登録')
      expect(current_path).to eq new_user_registration_path
    end
    it 'ヘッダーのログインボタンをクリックすることで、ログインページに遷移する' do
      visit root_path
      click_on('ログイン')
      expect(current_path).to eq new_user_session_path
    end
    it 'ヘッダーのログアウトボタンをクリックすることで、ログアウトができる' do
      visit new_user_session_path
      fill_in 'email', with: @user.email
      fill_in 'password', with: @user.password
      find('input[name="commit"]').click
      visit root_path
      find('logout"]').click
      visit root_path
      expect(page).to have_content('新規登録')
      expect(page).to have_content('ログイン')
    end
  end
end
