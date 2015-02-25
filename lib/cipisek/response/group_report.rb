require 'cipisek/response'
require 'cipisek/model'
require 'cipisek/response/group_stat'

module Cipisek
  class Response < Model
    class GroupReport < Cipisek::Response
      attributes :group_id

      def stats
        @stats ||= raw_hash["stats"].collect{|stat| Cipisek::Response::GroupStat.new(stat)}
      end
    end
  end
end
