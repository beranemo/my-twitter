class AddNameAvatarIntroductionRoleToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name,         :string, null: false, default: ''
    add_column :users, :avatar,       :string
    add_column :users, :introduction, :text
    add_column :users, :role,         :string, default: 'normal'
  end
end
