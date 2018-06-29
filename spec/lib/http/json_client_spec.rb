require 'spec_helper'
require_relative '../fakes/fake_provider_request_factory'
require_relative './client_context'

RSpec.describe Aquaman::HTTP::JsonClient do
  include_context 'client'
end
