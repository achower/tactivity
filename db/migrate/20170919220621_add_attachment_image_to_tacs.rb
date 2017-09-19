class AddAttachmentImageToTacs < ActiveRecord::Migration[5.1]
  def self.up
    change_table :tacs do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :tacs, :image
  end
end
