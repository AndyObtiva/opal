class Numeric
  def %(other)
    `self % other`
  end

  alias_method :modulo, :%

  def & (other)
    `self & other`
  end

  def | (other)
    `self | other`
  end

  def ~
    `~self`
  end

  def ^ (other)
    `self ^ other`
  end

  def << (count)
    `self << count`
  end

  def >> (count)
    `self >> count`
  end

  def abs
    `Math.abs(self)`
  end

  def magnitude
    `Math.abs(self)`
  end

  def hash
    `self.$f + '_' + self`
  end

  def even?
    `self % 2 == 0`
  end

  def odd?
    `self % 2 != 0`
  end

  def succ
    `self + 1`
  end

  alias_method :next, :succ

  def pred
    `self - 1`
  end

  def upto (finish)
    return enum_for :upto, finish unless block_given?

    `
      for (var i = self; i <= finish; i++) {
        if ($iterator.call($context, i) === $breaker) {
          return $breaker.$v;
        }
      }
    `

    self
  end

  def downto (finish)
    return enum_for :downto, finish unless block_given?

    `
      for (var i = self; i >= finish; i--) {
        if ($iterator.call($context, i) === $breaker) {
          return $breaker.$v;
        }
      }
    `

    self
  end

  def times
    return enum_for :times unless block_given?

    `
      for (var i = 0; i < self; i++) {
        if ($iterator.call($context, i) === $breaker) {
          return $breaker.$v;
        }
      }
    `

    self
  end

  def zero?
    `self == 0;`
  end

  def nonzero?
    `self == 0 ? null : self`
  end

  def ceil
    `Math.ceil(self);`
  end

  def floor
    `Math.floor(self)`
  end

  def integer?
    `self % 1 == 0`
  end

  def to_s
    `self.toString()`
  end

  def inspect
    `self.toString()`
  end

  def to_i
    Integer.from_native(`parseInt(self)`)
  end

  def to_f
    Float.from_native(`parseFloat(self)`)
  end
end

class Integer < Numeric
  def self.=== (other)
    raise ArgumentError, 'the passed value is not a number' unless Class.typeof(other) == 'number'

    other.integer?
  end
end

class Float < Numeric
  def self.=== (other)
    raise ArgumentError, 'the passed value is not a number' unless Class.typeof(other) == 'number'

    !other.integer?
  end
end
