require 'singleton'
require 'database/closest_findable_array'

class Database
  include Singleton

  def initialize
    @tables = {}
  end

  # @return an empty ClosestFindArray
  def get_table(identifier)
    @tables.fetch(identifier) do
      @tables[identifier] = ClosestFindableArray.new
    end
  end

  # only for testing
  def tear_down
    @tables = {}
  end
end
