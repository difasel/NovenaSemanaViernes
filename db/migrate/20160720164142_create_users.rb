class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |u|
    u.string :name
    u.string :email
    u.string :password_digest
    u.timestamps
    end
  end
end
