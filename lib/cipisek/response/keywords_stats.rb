require 'cipisek/response'
require 'cipisek/model'
require 'cipisek/response/keyword_report'

module Cipisek
  class Response < Model
    class KeywordsStats < Cipisek::Response
      def report
        @report ||= raw_hash["report"].collect{|report| Cipisek::Response::KeywordReport.new(report)}
      end
    end
  end
end
