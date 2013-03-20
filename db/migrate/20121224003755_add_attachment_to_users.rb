class AddAttachmentToUsers < ActiveRecord::Migration
  def change
    add_attachment :users, :mp3
  end
end
