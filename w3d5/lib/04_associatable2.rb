require_relative '03_associatable'
require 'byebug'


# Phase IV
module Associatable
  # Remember to go back to 04_associatable to write ::assoc_options

  def has_one_through(name, through_name, source_name)
    through_options = assoc_options[through_name]

    define_method name do
      source_options = through_options.model_class.assoc_options[source_name]

      through = through_options.model_class
      through_id = through_options.foreign_key
      source = source_options.model_class

      call = source_options.foreign_key

      source_id = through.find(self.send(through_id)).send(call)
      source_options.model_class.find(source_id)
    end

  end
end
