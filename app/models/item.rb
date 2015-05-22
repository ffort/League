class Item < ActiveRecord::Base

  before_validation :add_default_permalink

  private

  def add_default_permalink
    if permalink.blank?
      self.permalink = "#{id}-#{name.parameterize}"
    end
  end

end
