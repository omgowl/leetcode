def two_sum(nums, target)
  memory = {}

  nums.each.with_index do |num, idx|
    return [memory[num], idx] if memory[num]

    memory[target - num] = idx
  end

  false
end
