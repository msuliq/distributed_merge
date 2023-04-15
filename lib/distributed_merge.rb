# frozen_string_literal: true

require_relative "distributed_merge/version"

### Distributed Merge
## Over View
# when included this gem adds 'distributed_merge' method to Array class that can
# be called on two-dimensional arrays containing arrays of varying size to
# return a single layer merged array with all elements evenly interleaved and
# distributed
## Usage
# [[1, 2, 3, 4], ['a', 'b'], ['C']].distributed_merge
#   returns: [1, "b", 2, "C", 3, "a", 4]

module DistributedMerge
  module DistributedMergeArray # :nodoc:
    # Accepts a two-dimensional array with subarrays of varying size and returns
    # merged array with the elements distributed across.
    def distributed_merge
      return self unless two_dimensional?

      data = sort_arrays_by_size
      largest = data.first

      data.drop(1).each do |ary|
        offset = largest.length / (ary.length + 1)

        ary.each_with_index do |el, i|
          if ary.length == 1
            largest.insert((largest.length / 2), el)
          elsif i == 1
            largest.insert(((largest.length / 2) - offset), el)
          elsif i.even?
            largest.insert(((largest.length / 2) + (offset + i)), el)
          else
            largest.insert(((largest.length / 2) - (offset + i)), el)
          end
        end
      end

      largest
    end

    def two_dimensional?
      return false unless all_arrays?

      flatten(1).none? { |arg| arg.instance_of?(Array) } && flatten(1).count > 1
    end

    def all_arrays?
      all? { |arg| arg.instance_of?(Array) }
    end

    def sort_arrays_by_size
      sort_by { |ary| ary.flatten.count }.reverse
    end
  end
end

Array.include DistributedMerge::DistributedMergeArray
