require 'cipisek/response'
require 'cipisek/model'
require 'cipisek/response/keyword_stat'

module Cipisek
  class Response < Model
    class KeywordReport < Cipisek::Response
      attributes :keyword_id

      def stats
        @stats ||= raw_hash["stats"].collect{|stat| Cipisek::Response::KeywordStat.new(stat)}
      end
    end
  end
end
