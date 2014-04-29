class CreateUserinfos < ActiveRecord::Migration
  def change
    create_table :userinfos do |t|

        t.string :first_name
        t.string :last_name
        t.integer :user_id
        t.integer :active_status


      t.timestamps
    end
  end
end
