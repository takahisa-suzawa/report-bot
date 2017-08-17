class CreateWebhooks < ActiveRecord::Migration[5.1]
  def change
    create_table :webhooks do |t|
      t.string :token
      t.string :team_id
      t.string :team_domain
      t.string :channel_id
      t.string :channel_name
      t.timestamp :timestamp
      t.string :user_id
      t.string :user_name
      t.string :text
      t.string :trigger_word

      t.timestamps
    end
  end
end
