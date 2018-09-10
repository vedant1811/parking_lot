require 'database/database'

# In any inluding class, be sure to call `super()` inside `initialize`
module Databaseable
  def self.included(base)
    base.extend(ClassMethods)
  end

  def initialize
    table << self
  end

  def delete!
    table.delete self
  end

private
  def table
    Database.instance.get_table(self.class)
  end

  module ClassMethods
    def all
      Database.instance.get_table(self)
    end
  end
end
