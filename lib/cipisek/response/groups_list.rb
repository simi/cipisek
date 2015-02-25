require 'cipisek/response'
require 'cipisek/model'
require 'cipisek/response/group'

module Cipisek
  class Response < Model
    class GroupsList < Cipisek::Response
      def groups
        @groups ||= raw_hash["groups"].collect{|group| Cipisek::Response::Group.new(group)}
      end
    end
  end
end
