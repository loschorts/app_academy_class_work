require 'byebug'
require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    tbl = DBConnection.execute2(<<-SQL).first
      SELECT
        *
      FROM
        #{self.table_name}
        SQL
    tbl_cols = tbl.map(&:to_sym)
  end

  def self.finalize!
    columns.each do |column|
      #getter
      define_method "#{column}" do
        attributes[column]
      end

      #setter
      define_method "#{column}=" do |x|
        attributes[column] = x
      end

    end

  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    @table_name ||= self.to_s.tableize
  end

  def self.all
    results = DBConnection.execute(<<-SQL)
      SELECT
        #{self.table_name}.*
      FROM
        #{self.table_name}
        SQL

      parse_all(results)
  end

  def self.parse_all(results)
    results.map do |str_hash|
      sym_hash = {}
      str_hash.each do |k, v|
        sym_hash[k.to_sym] = v
      end
      self.new(sym_hash)
    end
  end

  def self.find(id)
    results = DBConnection.execute(<<-SQL)
      SELECT
        #{self.table_name}.*
      FROM
        #{self.table_name}
      WHERE
        id = #{id}
    SQL
    self.parse_all(results).first
  end

  def initialize(params = {})
    params.each do |attr_name, value|
      raise 'attributes must be symbols' unless attr_name.is_a?(Symbol)
      raise "unknown attribute '#{attr_name}'" unless self.class.columns.include?(attr_name)
      self.send("#{attr_name}=", value)
    end
  end

  def attributes
    @attributes ||= {}
  end

  def attribute_values
    self.class.columns.map do |column|
      self.send(column)
    end
  end

  def insert
    col_names = self.class.columns
    length = col_names.length

    question_marks = (["?"] * length).join(", ")
    question_marks = "(#{question_marks})"
    DBConnection.execute(<<-SQL, *attribute_values)
    INSERT INTO
      #{self.class.table_name} (#{col_names.join(", ")})
    VALUES
      #{question_marks}
    SQL
    attributes[:id] = DBConnection.last_insert_row_id
  end

  def update

    set_line = attributes.keys.map do |column|
      "#{column} = ?"
    end.join(", ")

    DBConnection.execute(<<-SQL, *attribute_values, self.id)
    UPDATE
      #{self.class.table_name}
    SET
      #{set_line}
    WHERE
      id = ?
    SQL
  end

  def save
    self.id.nil? ? insert : update
  end
end
