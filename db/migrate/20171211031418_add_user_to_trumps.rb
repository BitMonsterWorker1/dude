class AddUserToTrumps < ActiveRecord::Migration[5.1]
  def change
    add_reference :trumps, :user, foreign_key: true
  end
end
