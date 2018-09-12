require 'spec_helper'
require_relative './header_examples'

RSpec.describe Aquaman::HTTP::Headers::UserAgent do
  subject(:header) { described_class.new(value) }

  let(:value) { 'Opera' }

  include_examples 'header'
end
