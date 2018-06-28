require 'reek'
require 'reek/spec'
require 'spec_helper'

RSpec.describe 'Make sure all code' do
  it 'contains no code smells' do
    Pathname.glob('lib/**/*.rb').each do |file|
      expect(file).not_to reek
    end
  end
end
