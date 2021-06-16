class Address < ApplicationRecord

  belongs_to :user

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: "はハイフンを入れて入力してください" }
    validates :prefecture_id, numericality: { other_than: 1, message: 'は選んでください' }
    validates :city
    validates :house_number
    validates :telephone_number, numericality: { only_integer: true, message: "は数字のみで入力してください" }
  end
  validates :telephone_number, format: { with: /\A\d{10,11}\z/, message: 'は桁数が違います' }
end
