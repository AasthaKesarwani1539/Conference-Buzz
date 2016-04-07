class CreateConferences < ActiveRecord::Migration
  def change
    create_table :conferences do |t|
      t.string :title
      t.string :url
      t.date :from_date
      t.date :to_date
      t.string :venue_city
      t.string :venue_country
      t.date :cfp_opens_on
      t.date :cfp_closes_on
      t.string :created_by
      t.string :created_by_email
      t.references :topic, index: true

      t.timestamps
    end
  end
end
