FactoryBot.define do
  factory :order_address do
    token                 {"tok_abcdefghijk00000000000000000"}
    postal_code           {"123-4567"}
    province_id           { rand(1..47) }
    city                  { "テスト市テスト区" }
    address_line          { "テスト町１−２−４" }
    building              { "テストビル２０１" }
    phone_num             { "0901234567"}
  end
end
