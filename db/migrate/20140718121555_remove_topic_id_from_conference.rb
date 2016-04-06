class RemoveTopicIdFromConference < ActiveRecord::Migration
  def change
    remove_column :conferences, :topic_id, :integer
  end
end
