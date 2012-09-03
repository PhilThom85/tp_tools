require "./must_in_test"
require "./foxy_equ"

class AssignUnlessDefTest < Test::Unit::TestCase

  # when nothing is given
  must "assign with nil" do
    assert_equal nil, foxy_equ
  end

  # When a value is given
  must "assign with the value" do
    assert_equal 5, foxy_equ(5)
  end
  must "assign with the value even default is given" do
    assert_equal 6, foxy_equ(6, 10)
  end

  # When no value is given (nil)  but the default should assign default
  must "assign the default" do
    assert_equal 3, foxy_equ(nil, 3)
  end

  must "assign the default with nil when default is not passed" do
    assert_equal nil, foxy_equ(nil)
  end

  # Needs to implement when options are give as default for instance instead of an arg
  must "assign the default when given in a hash" do
    assert_equal 12, foxy_equ( nil, :default => 12 )
  end

  must "assign the hash contained in default" do
    hash = { :default => 23, :cond => true }
    assert_equal hash, foxy_equ( nil, :default => hash )
  end

  must "assign multi variables with default if value is undefined" do
    l,w,h = foxy_equ( [ 17, nil, 13 ], 1 )
    assert_equal 17, l
    assert_equal 1, w
    assert_equal 13, h
  end

  # when array is given with symbol, the default is to get array from options :array
  must "get value from array and assign correctly" do
    arr = { :length => 5, :width => 18, :height => 7 }
    l,w,h = foxy_equ [ :length, :width, :height ], :default => 1, :array => arr
    assert_equal 5, l
    assert_equal 18, w
    assert_equal 7, h
  end

  must "get value from array and assign correctly if value is nil" do
    arr = { :length => 5, :width => nil, :height => 7 }
    l,w,h = foxy_equ [ :length, :width, :height ], :default => 1, :array => arr
    assert_equal 5, l
    assert_equal 1, w
    assert_equal 7, h
  end

  must "get value from array and assign correctly if key does not exist" do
    arr = { :length => 5, :height => 7 }
    l,w,h = foxy_equ [ :length, :width, :height ], :default => 666, :array => arr
    assert_equal 5, l
    assert_equal 666, w
    assert_equal 7, h
  end

  # must "assign depending on condition" do
  #   l,w,h = foxy_equ [0,1,2], :array => verbose, :cond => ~> { |k| verbose.count >= k+1 }
  #   l = verbose[0] if verbose.count >= 1
  #   w = verbose[1] if verbose.count >= 2
  #   h = verbose[2] if verbose.count >= 3
  # end
end
