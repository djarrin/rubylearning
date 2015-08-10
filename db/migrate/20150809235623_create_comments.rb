class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :commenter
      t.text :body
      
      # this line adds an integer column called 'article_id'
      t.references :article, index: true, foreign_key: true

      t.timestamps null: false
    end
    #as stated in the method, this creates a foreign key for the comments and articles columns
    add_foreign_key :comments, :articles
  end
end
