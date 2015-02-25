require 'cipisek/response'
require 'cipisek/model'

module Cipisek
  class Response < Model
    class Premise < Cipisek::Response
      attributes :id
    end
  end
end
