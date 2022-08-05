class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      ## ======= 👇 ここから追加する=======      
      t.references :user
      t.string :content
      ## ====== 👆 ここまで追加する=======      
      t.timestamps
    end
  end
end
