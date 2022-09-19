class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :commenter
      t.belongs_to :article, index: true
      t.timestamps
    end
  end
end
