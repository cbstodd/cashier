require 'test_helper'

class EntreeTest < ActiveSupport::TestCase
  fixtures :entrees

  test "entree attributes must not be empty" do
    entree = Entree.new
    assert entree.invalid?
    assert entree.errors[:food_item].any?
    assert entree.errors[:description].any?
    assert entree.errors[:price].any?
    assert entree.errors[:image_url].any?
  end

  test "entree price must be positive" do
    entree = Entree.new(food_item: "Pizza",
                   description: "yyy",
                   image_url: "zzz.jpg")
    entree.price = -1
    assert entree.invalid?
    assert_equal ["must be greater than or equal to 0.01"],
    entree.errors[:price]

    entree.price = 0
    assert entree.invalid?
    assert_equal ["must be greater than or equal to 0.01"],
    entree.errors[:price]

    entree.price = 11
    assert entree.valid?
  end

  def new_entree(image_url)
    Entree.new(food_item: "My Book Title",
            description: "yyy",
            price: 1,
            image_url: image_url)
  end
  test "image url" do
    ok = %w[ fred.gif fred.png FRED.JPG FRED.Jpg
            http://a.b.c/x/y/z/fred.gif ]
    bad = %w[ fred.doc fred.gif/more fred.gif.more ]
    ok.each do |url|
      assert new_entree(url).valid?, "#{url} should be valid"
    end
    bad.each do |url|
      assert new_entree(url).invalid?, "#{url} shouldn't be valid"
    end
  end

  test "entree is not vaild without a unique food_item" do
    entree = Entree.new(food_item: entrees(:one).food_item,
                  description: "yyy",
                  price: 11.99,
                  image_url: "cheese.jpg")
    assert entree.invalid?
    assert_equal ["has already been taken"],
    entree.errors[:food_item]
  end


end
