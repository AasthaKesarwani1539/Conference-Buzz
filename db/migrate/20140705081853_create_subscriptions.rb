class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.string :email
      t.references :topic, index: true

      t.timestamps
    end
  end
end
