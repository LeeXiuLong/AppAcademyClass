require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    return @columns if @columns
    query = DBConnection.execute2(<<-SQL)
      SELECT
        *
      FROM
        "#{self.table_name}"
    SQL
    @columns = query[0]
    @columns.map!(&:to_sym)
  end

  def self.finalize!
    self.columns.each do |column|
      define_method(column) do
        self.attributes[column]
      end
      define_method("#{column}=") do |arg|
        self.attributes[column] = arg
      end
    end
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    @table_name ||= "#{self}".tableize
  end

  def self.all
   results = DBConnection.execute(<<-SQL)
    SELECT
      *
    FROM
      "#{self.table_name}"
    SQL
    self.parse_all(results)
  end

  def self.parse_all(results)
    arr = []
    results.each {|result| arr << SQLObject.new(result)}
    arr
  end

  def self.find(id)
    execute(<<-SQL)
    SELECT
      *
    FROM
      self
    WHERE
      id = "#{id}"
    SQL
  end

  def initialize(params = {})
    params.each do |key,val|
      sym_key = key.to_sym
      raise "unknown attribute '#{sym_key}'" unless self.class.columns.include?(sym_key)
      self.send("#{sym_key}=", val)
    end
  end

  def attributes
     @attributes ||= {}
  end

  def attribute_values
    # ...
  end

  def insert
    # ...
  end

  def update
    # ...
  end

  def save
    # ...
  end
end

