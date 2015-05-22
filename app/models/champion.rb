class Champion < ActiveRecord::Base

  before_validation :add_default_permalink

  has_many :abilities

  acts_as_list

  validates_presence_of :champion_name
  validates_length_of :champion_name, :maximum => 255
  validates_presence_of :permalink
  validates_length_of :permalink, :within => 3..255
  validates_uniqueness_of :permalink

  scope :support, lambda { where(:primary_role => "Support")}
  scope :tank, lambda { where(:primary_role => "Tank")}
  scope :sorted, lambda { order("champions.champion_name ASC")}
  scope :search, lambda {|query|
    where(["champion_name LIKE ?", "%#{query}%"])
  }


  private

  def add_default_permalink
    if permalink.blank?
      self.permalink = "#{champion_name.parameterize}"
    end
  end

end
