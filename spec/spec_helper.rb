require 'rspec'
require 'dm-core/spec/setup'
require 'dm-core/spec/lib/adapter_helpers'

require 'dm-types/legacy'

DataMapper::Spec.setup

RSpec.configure do |config|
  config.extend(DataMapper::Spec::Adapters::Helpers)
end
