class AddAttachmentAttachmentToResumes < ActiveRecord::Migration
  def self.up
    change_table :resumes do |t|
      t.attachment :attachment
    end
  end

  def self.down
    remove_attachment :resumes, :attachment
  end
end
