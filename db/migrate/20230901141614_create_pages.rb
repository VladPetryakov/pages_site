class CreatePages < ActiveRecord::Migration[5.2]
  def change
    create_table :pages do |t|
      t.string :name
      t.string :title
      t.text :text

      t.references :parent, foreign_key: { to_table: :pages }

      t.timestamps
    end
  end
end
