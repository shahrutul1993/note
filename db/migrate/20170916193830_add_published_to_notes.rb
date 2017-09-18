class AddPublishedToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :published, :boolean, default: false
    add_column :notes, :published_at, :datetime
  end
end
