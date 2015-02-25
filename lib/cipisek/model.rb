require 'cipisek/utils'

module Cipisek
  class Model
    attr_accessor :raw_hash

    def initialize(hash)
      self.raw_hash = hash
    end

    def self.attributes(*array)
      array.each do |original_name|
        mapped_name = Cipisek::Utils.underscore(original_name)
        define_method(mapped_name.to_sym) do
          self.raw_hash[original_name.to_s]
        end
      end
    end
  end
end
