require 'byebug'
require_relative '02_searchable'
require 'active_support/inflector'

# Phase IIIa
class AssocOptions
  attr_accessor(
    :foreign_key,
    :class_name,
    :primary_key,
  )

  def model_class
    self.class_name.constantize
  end

  def table_name
    model_class.table_name
  end
end

class BelongsToOptions < AssocOptions
  def initialize(name, options = {})

    defaults = [
      "#{name}_id".to_sym,
      :id,
      "#{name.to_s.camelcase}"
      ]

    self.foreign_key = options[:foreign_key] || defaults[0]
    self.primary_key = options[:primary_key] || defaults[1]
    self.class_name = options[:class_name] || defaults[2]

  end
end

class HasManyOptions < AssocOptions
  def initialize(name, self_class_name, options = {})

    defaults = [
      "#{self_class_name.to_s.underscore}_id".to_sym,
      :id,
      "#{name.to_s.singularize.camelcase}"
      ]

    self.foreign_key = options[:foreign_key] || defaults[0]
    self.primary_key = options[:primary_key] || defaults[1]
    self.class_name = options[:class_name] || defaults[2]
  end
end

module Associatable
  # Phase IIIb
  def belongs_to(name, options = {})
    options = BelongsToOptions.new(name, options)
    assoc_options[name] = options
    fk = options.foreign_key
    cn = options.class_name
    pk = options.primary_key

    define_method name do
      return nil unless self.send(fk)
      owner = cn.constantize
      owner.find(self.send(fk))
    end

  end

  def has_many(name, options = {})
    options = HasManyOptions.new(name, self.to_s, options)

    fk = options.foreign_key
    cn = options.class_name
    pk = options.primary_key
    define_method name do
      property = cn.constantize
      property.where(fk => self.send(pk))
    end
  end

  def assoc_options
    @assoc_options ||= {}
  end
end

class SQLObject
  extend Associatable
end
