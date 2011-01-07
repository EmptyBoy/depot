class Product < ActiveRecord::Base
  # relationships
  has_many :line_items
  has_many :orders, :through => :line_items

  before_destroy :ensure_not_referenced_by_any_line_item
  # ensure that there aren't no line items with product_id
  def ensure_not_referenced_by_any_line_item
    if line_items.count.zero?
      return true
    else
      errors.add(:base, 'Line Items present')
      return false
    end
  end
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
