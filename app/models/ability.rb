class Ability < ActiveRecord::Base

  belongs_to :champion
  has_and_belongs_to_many :editors, :class_name => "AdminUser"

  acts_as_list :scope => :champion

  before_validation :add_default_permalink
  before_validation :add_championID

  validates_presence_of :name
  validates_length_of :name, :maximum => 255

  scope :sorted, lambda { order("abilities.name ASC")}

  private

  def add_default_permalink
    if permalink.blank?
      self.permalink = "#{name.parameterize}"
    end
  end

  def add_championID
    self.champion_id =  champion_id
  end
end
