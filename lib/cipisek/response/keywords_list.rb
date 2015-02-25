require 'cipisek/response'
require 'cipisek/model'
require 'cipisek/response/keyword'

module Cipisek
  class Response < Model
    class KeywordsList < Cipisek::Response
      def keywords
        @keywords ||= raw_hash["keywords"].collect{|keyword| Cipisek::Response::Keyword.new(keyword)}
      end
    end
  end
end
