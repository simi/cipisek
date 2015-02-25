require 'cipisek/response'
require 'cipisek/model'
require 'cipisek/response/stat'

module Cipisek
  class Response < Model
    class GroupStat < Cipisek::Response::Stat
    end
  end
end
