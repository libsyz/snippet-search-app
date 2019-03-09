class CreateSnippets < ActiveRecord::Migration[5.2]
  def change
    create_table :snippets do |t|
      t.text :content
      t.string :type
      t.string :client
      t.string :competency

      t.timestamps
    end
  end
end
