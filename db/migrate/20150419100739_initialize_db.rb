class InitializeDb < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email_address
    end

    create_table :organizations do |t|
      t.string :name
    end

    create_table :access_rights do |t|
      t.references :accessible, polymorphic: true
      t.references :user
    end

    create_table :events do |t|
      t.integer :organization_id
      t.string :name
    end

    create_table :shops do |t|
      t.integer :event_id
      t.string :name
    end

    create_table :sessions do |t|
      t.integer :user_id
      t.string :token
    end
  end
end
