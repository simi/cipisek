require 'cipisek/model'
require 'cipisek/response/user'

module Cipisek
  class Response < Model
    class ForeignAccount < Cipisek::Response::User
      attributes :access, :relationName, :relationStatus, :relationType
    end
  end
end
