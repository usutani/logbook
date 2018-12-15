FactoryBot.define do
  factory :restaurant do
    name { 'テストを書く' }
    note { 'RSpec＆Capybara＆FactoryBotを準備する' }
    user
  end
end

