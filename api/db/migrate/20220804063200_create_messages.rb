class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      ## ======= π γγγγθΏ½ε γγ=======      
      t.references :user
      t.string :content
      ## ====== π γγγΎγ§θΏ½ε γγ=======      
      t.timestamps
    end
  end
end
