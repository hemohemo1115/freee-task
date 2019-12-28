class ChangeDatatypeUserIdOfMessages < ActiveRecord::Migration[6.0]
  def change
    change_column :messages, :user_id, :integer
  end
end
