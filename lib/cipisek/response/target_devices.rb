require 'cipisek/response'
require 'cipisek/model'

module Cipisek
  class Response < Model
    class TargetDevices < Cipisek::Response
      attributes :desktop, :mobile, :tablet, :other
    end
  end
end
