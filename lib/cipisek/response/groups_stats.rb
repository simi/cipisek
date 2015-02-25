require 'cipisek/response'
require 'cipisek/model'
require 'cipisek/response/group_report'

module Cipisek
  class Response < Model
    class GroupsStats < Cipisek::Response
      def report
        @report ||= raw_hash["report"].collect{|report| Cipisek::Response::GroupReport.new(report)}
      end
    end
  end
end
