class CreateConferencesTopics < ActiveRecord::Migration
  def change
    create_table :conferences_topics, id: false do |t|  
      t.belongs_to :conference
      t.belongs_to :topic
    end
  end
end
