class CreatePictures < ActiveRecord::Migration[6.0]
  def change
    create_table :pictures do |t|
      t.string     :name,        null: false
      t.text       :info,        null: false
      t.integer    :group_id,    null: false
      t.string     :member_name, null: false
      t.integer    :status_id,   null: false
      t.integer    :position_id, null: false
      t.references :user,        null: false, foreign_key: true
      t.timestamps
    end
  end
end
