require_relative "median_finder"

# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Float}
def find_median_sorted_arrays(nums1, nums2)
  MedianFinder.new(nums1, nums2).run
end
