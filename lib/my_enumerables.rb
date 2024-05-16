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
