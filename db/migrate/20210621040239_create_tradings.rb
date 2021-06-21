class CreateTradings < ActiveRecord::Migration[6.0]
  def change
    create_table :tradings do |t|
      t.references :user,    null: false, foreign_key: true
      t.references :picture, null: false, foreign_key: true
      t.timestamps
    end
  end
end
