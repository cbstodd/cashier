class Entree < ActiveRecord::Base
  validates :food_item, :description, :image_url, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }
  validates :food_item, uniqueness: true
  validates :image_url, allow_blank: true, format: {
    with: %r{\.(gif|jpg|png)\Z}i,
    message: "must be a URL for GIF, JPG or PNG image."
  }

  def self.latest
    Entree.order(:updated_at).last
  end

end
