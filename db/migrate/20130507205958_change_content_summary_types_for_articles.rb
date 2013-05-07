class ChangeContentSummaryTypesForArticles < ActiveRecord::Migration
  def up
    change_column :articles, :content, :text
    change_column :articles, :summary, :text
  end

  def down
    change_column :articles, :content, :string
    change_column :articles, :summary, :string
  end
end
