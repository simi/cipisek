require 'cipisek/response'
require 'cipisek/model'
require 'cipisek/response/stat'

module Cipisek
  class Response < Model
    class KeywordStat < Cipisek::Response::Stat
      attributes :searchQuery
    end
  end
end
