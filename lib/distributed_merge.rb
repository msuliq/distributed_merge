# frozen_string_literal: true

require_relative "distributed_merge/version"

module DistributedMerge
  class Array # :nodoc:
    # Accepts a two-dimensional array with subarrays of varying size and returns
    # merged array with the elements distributed evenly.

    def distributed_merge
      return self unless two_dimensional?

      data = sort_by { |ary| ary.flatten.count }.reverse
      largest = data.first

      data.drop(1).each do |ary|
        offset = largest.length / (ary.length + 1)
        ary.each_with_index do |el, i|
          if i == 1
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
      all? { |arg| arg.is_a?(Array) } && flatten(1).count > 1
    end
  end
end
