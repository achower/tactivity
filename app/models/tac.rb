class Tac < ApplicationRecord
	belongs_to :user
	has_attached_file :image, :styles => { :large => "600x600>", :medium => "300x300>", :thumb => "100x100>" }
	validates :image, presence: true
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
	validates :description, presence: true
end
