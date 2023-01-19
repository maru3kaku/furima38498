class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      
      t.integer    :article_id     , null: false

      t.timestamps
    end
  end
end
