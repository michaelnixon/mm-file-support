class Mover < ActiveRecord::Base
  has_and_belongs_to_many :data_tracks
  has_and_belongs_to_many :movement_groups
  has_and_belongs_to_many :projects
  has_and_belongs_to_many :takes
  validates :name, presence: true
  # validates :dob, presence: true
  # validates :gender, presence: true  
  # validates :expertise, presence: true  
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "150x150>" }
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/  
  
  # provide a slightly nicer url for referencing individual items
  def to_param
    [id, name.parameterize].join("-")
  end  
end
