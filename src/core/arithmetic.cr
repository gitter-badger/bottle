require "./flask"
require "./jug"

module Bottle::BMath
  extend self

  def add(a : Flask, b : Flask)
    a.each_index { |i| a[i] += b[i] }
    a
  end

  def add(a : Jug, b : Jug)
    a.each_index { |i, j| a[i, j] += b[i, j] }
    a
  end

  def add(a : Flask, x : Number)
    a.each_index { |i| a[i] += x }
    a
  end

  def add(a : Jug, x : Number)
    a.each_index { |i, j| a[i, j] += x }
    a
  end

  def sub(a : Flask, b : Flask)
    a.each_index { |i| a[i] -= b[i] }
    a
  end

  def sub(a : Jug, b : Jug)
    a.each_index { |i, j| a[i, j] -= b[i, j] }
    a
  end

  def sub(a : Flask, x : Number)
    a.each_index { |i| a[i] -= x }
    a
  end

  def sub(a : Jug, x : Number)
    a.each_index { |i, j| a[i, j] -= x }
    a
  end

  def mul(a : Flask, b : Flask)
    a.each_index { |i| a[i] *= b[i] }
    a
  end

  def mul(a : Jug, b : Jug)
    a.each_index { |i, j| a[i, j] *= b[i, j] }
    a
  end

  def mul(a : Flask, x : Number)
    a.each_index { |i| a[i] *= x }
    a
  end

  def mul(a : Jug, x : Number)
    a.each_index { |i, j| a[i, j] *= x }
    a
  end

  def div(a : Flask, b : Flask)
    Flask(Float64).new(a.size) { |i| Float64.new(a[i] / b[i]) }
  end

  def div(a : Jug, b : Jug)
    a.each_index { |i, j| a[i, j] /= b[i, j] }
    a
  end

  def div(a : Flask, x : Number)
    Flask(Float64).new(a.size) { |i| Float64.new(a[i] / x) }
  end

  def div(a : Jug, x : Number)
    a.each_index { |i, j| a[i, j] /= x }
    a
  end
end
