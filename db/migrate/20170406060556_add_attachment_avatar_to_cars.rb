class AddAttachmentAvatarToCars < ActiveRecord::Migration
  def self.up
    change_table :cars do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :cars, :avatar
  end
end
