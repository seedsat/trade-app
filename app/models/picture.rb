class Picture < ApplicationRecord
  belongs_to :user
  has_many_attached :images, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  belongs_to :trading, dependent: :destroy

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :group
  belongs_to :status
  belongs_to :position

  with_options presence: true do
    validates :images, length: { maximum: 5, message: 'は5枚以上は投稿出来ません' }
    validates :name, length: { maximum: 50 }
    validates :info, length: { maximum: 500 }
    validates :member_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は全角で入力してください' }
  end

  # ジャンルの選択が「選択してください」の時は保存できないようにする
  with_options presence: true, numericality: { other_than: 1 } do
    validates :group_id
    validates :status_id
    validates :position_id
  end
end
