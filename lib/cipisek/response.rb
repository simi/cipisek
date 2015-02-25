require 'cipisek/model'
require 'cipisek/response/user'
require 'cipisek/response/foreign_account'

module Cipisek
  class Response < Model
    attributes :status, :statusMessage, :session, :sessionStarted,
      :diagnostics
  end
end
