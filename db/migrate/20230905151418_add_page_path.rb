class AddPagePath < ActiveRecord::Migration[5.2]
  def change
    add_column :pages, :path, :string, array: true, default: []
    add_index :pages, :path, using: 'gin'
  end
end
