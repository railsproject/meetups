class AddAttachmentMeetuppicToPhotos < ActiveRecord::Migration
  def self.up
    change_table :photos do |t|
      t.attachment :meetuppic
    end
  end

  def self.down
    remove_attachment :photos, :meetuppic
  end
end
