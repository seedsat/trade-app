class Picture < ApplicationRecord
  belongs_to :user
  has_many_attached :images

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :group
  belongs_to :status
  belongs_to :position

  with_options presence: true do
    validates :images, :images_presence
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

  def images_presence
    if images.attached?
      # inputに保持されているimagesがあるかを確認
      if images.length > 6
        errors.add(:image, '5枚まで投稿できます')
      end
    end
  end
end
