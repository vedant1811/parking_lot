require 'database/database'

module Databaseable
  def self.included(base)
    base.extend(ClassMethods)
  end

  # needa to be called only on object create.
  # TODO: instead of this explicit call, should happen on `new`
  def save!
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
