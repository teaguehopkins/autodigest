class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :author
      t.string :link
      t.text :summary
      t.references :issue

      t.timestamps
    end
    add_index :articles, :issue_id
  end
end
