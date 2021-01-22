class Octopus
  FISHES = ["fish", "fiiish", "fiiiiish", "fiiiish", "fffish", "ffiiiiisshh", "fsh", "fiiiissshhhhhh"]

  def self.longest_fish_sluggish
    FISHES.each do |candidate|
      is_longest = true
      FISHES.each do |b_fish|
        if candidate.length < b_fish.length
          is_longest = false
          break
        end
      end
      return candidate if is_longest
    end
  end

  def self.longest_fish_dominant
    fish_arr = FISHES.sort { |a, b| b.length <=> a.length }
    return fish_arr.first
  end

  def self.longest_fish_clever
    longest = ""
    FISHES.each do |fish|
      if fish.length > longest.length
        longest = fish
      end
    end
    return longest
  end

  def self.dancing_octopus_slow(dir, tiles_arr)
    tiles_arr.each_with_index do |direction, i|
      if dir == direction
        return i
      end
    end
  end

  def self.dancing_octopus_constant(dir, tiles_hash)
    return tiles_hash[dir]
  end
end
