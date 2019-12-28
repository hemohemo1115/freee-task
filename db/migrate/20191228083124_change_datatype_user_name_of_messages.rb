class ChangeDatatypeUserNameOfMessages < ActiveRecord::Migration[6.0]
  def change
    change_column :messages, :user_id, :string
  end
end
