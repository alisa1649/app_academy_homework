require "octopus"

describe "longest_fish_sluggish" do
  it "should return the longest fish" do
    expect(Octopus.longest_fish_sluggish).to eq("fiiiissshhhhhh")
  end
end

describe "longest_fish_dominant" do
  it "should return the longest fish" do
    expect(Octopus.longest_fish_dominant).to eq("fiiiissshhhhhh")
  end
end

describe "longest_fish_clever" do
  it "should return the longest fish" do
    expect(Octopus.longest_fish_clever).to eq("fiiiissshhhhhh")
  end
end

describe "dancing_octopus_slow" do
  it "should return the index for given direction" do
    tiles_arr = ["up", "right-up", "right", "right-down", "down", "left-down", "left", "left-up"]

    expect(Octopus.dancing_octopus_slow("right", tiles_arr)).to eq(2)
  end
end

describe "dancing_octopus_constant" do
  it "should return the index for given direction" do
    tiles_hash = { "up" => 0, "right-up" => 1, "right" => 2, "right-down" => 3, "down" => 4, "left-down" => 5, "left" => 6, "left-up" => 7 }

    expect(Octopus.dancing_octopus_constant("right", tiles_hash)).to eq(2)
  end
end
