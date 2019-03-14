class AddContentTypeToSnippets < ActiveRecord::Migration[5.2]
  def change
    add_column :snippets, :content_type, :string
  end
end
