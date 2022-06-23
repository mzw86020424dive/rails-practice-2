class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :text
      t.references :member, null: false, foreign_key: true
      t.references :tag, null: false, default: 0, foreign_key: true

      t.timestamps
    end
  end
end
