class MedianFinder
  def initialize(nums1, nums2)
    @nums1, @nums2 = sort_arrays_by_size(nums1, nums2)

    # current cut positions
    # nums1 = [1,2], nums2 = [3,4,5]
    # cut1 = 1, cut2 = 2
    # cuts:
    # [1,   | 2]
    # [3,4, | 5]
    @cut1 = 0
    @cut2 = 0
  end

  # disabling Metrics/MethodLength here because i dont think reducing
  # the number of lines any further can be beneficial
  def run # rubocop:disable Metrics/MethodLength
    # indices for binary search
    min_idx = 0
    max_idx = @nums1.size

    # half is +1 because in case of odd total numbers we want the left to have more of them
    # [1,2 | ]
    # [3,  | 4,5]
    #
    # without +1 we would stop moving when
    # [1,2 | ]
    # [    | 3,4,5]
    #
    # which means we would need return min_right for odd totals, instead of max_left
    half = (@nums1.size + @nums2.size + 1) / 2

    while min_idx <= max_idx
      @cut1 = (min_idx + max_idx) / 2
      @cut2 = half - @cut1

      # move the cut positions left/right until all the numbers in both arrays
      # on the left side of the cut are smaller than all the numbers on the right side
      # --------------
      # [1,   | 2]
      # [3,4, | 5]
      # => we should move right
      # [1,2 | ]
      # [3,  | 4,5]
      #
      # --------------
      # [4,  | 5]
      # [1,2 | 3]
      # => we should move left
      # [      | 4,5]
      # [1,2,3 | ]
      if move_right?
        min_idx = @cut1 + 1
      elsif move_left?
        max_idx = @cut1 - 1
      else
        return pick_median
      end
    end
  end

  private

  def move_right?
    # @cut1 < @nums1.size
    # - we didnt yet reach the right end of the array
    #
    # @nums2[@cut2 - 1] > @nums1[@cut1]
    # - nums2 before cut is larger than nums1 after cut
    @cut1 < @nums1.size && @nums2[@cut2 - 1] > @nums1[@cut1]
  end

  def move_left?
    # @cut1.positive?
    # - we didnt yet reach the left end of the array
    #
    # @nums1[@cut1 - 1] > @nums2[@cut2]
    # - nums1 before cut is larger than nums2 after cut
    @cut1.positive? && @nums1[@cut1 - 1] > @nums2[@cut2]
  end

  def pick_median
    max_left = pick_max_left
    # if the total size of both arrays is odd, we return the middle element
    return max_left if (@nums1.size + @nums2.size).odd?

    min_right = pick_min_right
    # if its even, we return the average of the two middle elements
    [min_right, max_left].sum / 2.0
  end

  def pick_max_left
    if @cut1.zero?
      # there is nothing on the left side of the cut in nums1
      # [    | 2,2]
      # [1,1* | ]
      @nums2[@cut2 - 1]
    elsif @cut2.zero?
      # there is nothing on the left side of the cut in nums2
      # [1,1* | ]
      # [    | 2,2]
      @nums1[@cut1 - 1]
    else
      # select largest number from the left side of both arrays
      # [2*  | ]
      # [1, | 3]
      [@nums1[@cut1 - 1], @nums2[@cut2 - 1]].max
    end
  end

  def pick_min_right
    if @cut1 == @nums1.size
      # there is nothing on the right side of the cut in nums1
      # [1,1 | ]
      # [    | 2*,2]
      @nums2[@cut2]
    elsif @cut2 == @nums2.size
      # there is nothing on the right side of the cut in nums2
      # [    | 2*,2]
      # [1,1 | ]
      @nums1[@cut1]
    else
      # select smallest number from the right side of both arrays
      # [1, | 3*]
      # [2, | 4]
      [@nums1[@cut1], @nums2[@cut2]].min
    end
  end

  def sort_arrays_by_size(nums1, nums2)
    # ensure @nums1 has fewer elements than @nums2 for more efficient search
    nums1.size < nums2.size ? [nums1, nums2] : [nums2, nums1]
  end
end
