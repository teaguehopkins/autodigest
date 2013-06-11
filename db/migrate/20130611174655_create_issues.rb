class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :name
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
