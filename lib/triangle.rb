class Triangle
  # write code here
  # write macros
  attr_reader :a, :b, :c
  # initialization
  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
  end
  # instance method #kind what returns its type as a symbol
  # this instance method should raise a custom error TriangleError if the triangle is invalid

  # LETS WRITE A BETTER KIND
  def kind
    # greater_than_zero(a, b, c)
    # triangle_inequality
    check_triangle


          if a == b && b == c
            :equilateral
          elsif a == b || b == c || c == a
            :isosceles
          else
            :scalene
          end
  end

  # write a method to check if sides are greater than zero
  def sides_greater_than_zero?
    # i want a true answer here to validate sides are truly greater than zero
    # a > 0 && b > 0 && c > 0
    [a, b, c].all?(&:positive?)
  end
  # write a method that makes sure the sum of any two sides is greater than the third side
  def triangle_inequality?
    a + b > c && b + c > a && c + a > b
  end

# write a check_triangle method to make sure it passes the sides_greater_than_zero method
# as well as the triangle_inequality method
def check_triangle
  raise TriangleError unless sides_greater_than_zero? && triangle_inequality?
end

  # write custom error class
  class TriangleError < StandardError
  end

end

# newbie = Triangle.new(1, 2, 3)
# puts newbie.kind