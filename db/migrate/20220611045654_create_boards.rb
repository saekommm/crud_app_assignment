class CreateBoards < ActiveRecord::Migration[5.2]
  def change
    create_table :boards do |t|
      t.string :title
      t.text :body
      # t.references :post, foreign_key: true

      t.timestamps
    end
  end
end
