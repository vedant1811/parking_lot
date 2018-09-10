class ClosestFindableArray < Array
  # pass in a block same as `Enumerable#find`
  # @return the closest matching object or `nil`
  def closest_find(start_index)
    indices = (1...size).flat_map { |i| [-i, i] }
        .insert(0, 0)
        .map { |i| start_index + i }
        .select { |i| (0...size).include?(i) }

    matching_index = indices.find { |i| yield(self[i]) }
    matching_index && self[matching_index]
  end
end
