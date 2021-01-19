class Map
  def initialize
    @arr = Array.new() { Array.new(2) }
  end

  def set(key, val)
    found = false
    @arr.each do |subarr|
      if subarr.first == key
        subarr[1] = val
        found = true
      end
    end
    @arr << [key, val] if !found
    @arr
  end

  def get(key)
    @arr.each do |subarr|
      if subarr.first == key
        return subarr[1]
      end
    end
  end

  def delete(key)
    @arr.each_with_index do |subarr, i|
      if subarr.first == key
        @arr.delete_at(i)
      end
    end
  end

  def show
    @arr.each do |subarr|
      puts "#{subarr[0]}: #{subarr[1]}"
    end
  end
end
