module Enumerable
  def my_each_with_index
    i = 0;
    self.each do |element|
      yield(element, i)
      i += 1
    end
    self
  end

  def my_select
    selected = []
    self.each do |element|
      if yield(element)
        selected << element
      end
    end
    selected
  end

  def my_all?
    self.each { |element| return false unless yield(element) }
    true
  end  

  def my_any?
    self.each { |element| return true if yield(element) }
    false
  end

  def my_none?
    self.each { |element| return false if yield(element) }
    true
  end

  def my_count(&block)
    return self.length unless block
    selected = self.my_select { |element| block.call(element) }
    selected.length
  end

  def my_map
    transformed = []
    self.my_each_with_index { |element, i| transformed[i] = yield(element) }
    transformed
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each
    i = 0
    while i < self.length do
      yield(self[i])
      i += 1
    end
    self
  end
end
