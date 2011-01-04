class Product < ActiveRecord::Base
  # order by title
  default_scope :order => 'title'
  # validations
  validates :title, :description, :image_url, :presence => true
  validates :price, :numericality => { :greater_than_or_equal_to => 0.01 }
  validates :title, :uniqueness => true
  validates :image_url, :format => {
    :with => %r{\.(gif|jpg|jpeg|png)$}i,
    :message => 'must be a GIF, JPEG or PNG image.'
  }
end
