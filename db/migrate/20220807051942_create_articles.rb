class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :description
      t.text :short_description
      t.string :tag
      
      t.timestamps
    end
  end
end
