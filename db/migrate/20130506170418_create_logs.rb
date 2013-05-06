class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.integer :article_id
      t.integer :user_id

      t.timestamps
    end
    add_index :logs, [:article_id, :created_at]
  end
end
