require 'singleton'

class Database
  include Singleton

  def initialize
    @tables = {}
  end

  # @return an Array
  def get_table(identifier)
    @tables.fetch(identifier) do
      @tables[identifier] = []
    end
  end

  # only for testing
  def tear_down
    @tables = {}
  end
end
