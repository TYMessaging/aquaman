require 'spec_helper'
require_relative './header_examples'

RSpec.describe Aquaman::HTTP::Headers::Authorization do
  subject(:header) { described_class.new(value) }

  let(:value) { FFaker::Internet.password }

  include_examples 'header'
end
