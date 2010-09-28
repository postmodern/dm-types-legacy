source 'http://rubygems.org'

DATA_MAPPER = 'git://github.com/datamapper'
DM_VERSION = '~> 1.0.0'

# We bundle both AS and extlib while extlib compatibility needs to be kept
# around. require 'dm-core' will ensure that only one is activated at any
# time though. This is done by trying to require AS components and
# fallback to requiring extlib in case a LoadError was rescued when
# requiring AS code.
#
# Due to bundle exec activating all groups in the Gemfile, it's
# recommended to run
#
#     bundle install --without quality
#
# to have a development environment that is able to run the specs.
# The problem is that metric_fu activates active_support=2.2.3 if we
# comment out the gem 'activesupport' declaration - have a look below for
# why we would want to do that (and a bit later, for why that's actually
# not *strictly* necessary, but recommended)
#
# To run the specs using AS, leave this Gemfile as it is and just run:
#
#     bundle install --without qality
#     ADAPTERS=sqlite3 bundle exec rake spec # or whatever adapter
#
# To run the specs using extlib, comment out the: gem 'activesupport' line
# and run:
#
#     bundle install --without quality
#     ADAPTERS=sqlite3 bundle exec rake spec # or whatever adapter
#
# If you want to run the quality tasks as provided by metric_fu and
# related gems, you have to run:
#
#     bundle install
#     bundle exec rake metrics:all
#
# Switch back to a bundle without quality gems before trying to run the
# specs again:
#
#     bundle install --without quality
#     ADAPTERS=sqlite3 bundle exec rake spec # or whatever adapter
#
# It was mentioned above that all this is not *strictly* necessary, and
# this is true. Currently dm-core does the following as the first require
# when checking for AS:
#
#     require 'active_support/core_ext/object/singleton_class'
#
# Because this method is not present in activesupport <= 3.0.0.beta,
# dm-core's feature detection will actually do the "right thing" and fall
# back to extlib. However, since this is not the case for all dm-more gems
# as well, the safest thing to do is to respect the more tedious workflow
# for now, as it will at least be guaranteed to work the same for both
# dm-core and dm-more.
#
# Note that this won't be an issue anymore once we dropped support for
# extlib completely, or bundler folks decide to support something like
# "bundle exec --without=foo rake spec" (which probably is not going to
# happen anytime soon).
#

if ENV['EXTLIB']
  gem 'extlib', 		'~> 0.9.15'
else
  gem 'activesupport',	'~> 3.0.0', :require => 'active_support'
end

gem 'dm-core',	DM_VERSION #, :git => "#{DATA_MAPPER}/dm-core.git"

group :development do
  gem 'rake',		'~> 0.8.7'
  gem 'jeweler',	'~> 1.5.0.pre'
end

group :doc do
  case RUBY_PLATFORM
  when 'java'
    gem 'maruku',	'~> 0.6.0'
  else
    gem 'rdiscount',	'~> 1.6.3'
  end

  gem 'yard',		'~> 0.6.0'
end

group :test do
  adapters = ENV['ADAPTER'] || ENV['ADAPTERS']
  adapters = adapters.to_s.gsub(',',' ').split(' ') - ['in_memory']

  unless adapters.empty?
    DO_VERSION = '~> 0.10.3'
    DM_DO_ADAPTERS = %w[sqlite postgres mysql oracle sqlserver]

    gem 'data_objects', DO_VERSION, :git => "#{DATA_MAPPER}/do.git"

    adapters.each do |adapter|
      if DM_DO_ADAPTERS.any? { |dm_do_adapter| dm_do_adapter =~ /#{adapter}/ }
        adapter = 'sqlite3' if adapter == 'sqlite'
        gem "do_#{adapter}", DO_VERSION, :git => "#{DATA_MAPPER}/do.git"
      end
    end

    gem 'dm-do-adapter', DM_VERSION, :git => "#{DATA_MAPPER}/dm-do-adapter.git"

    adapters.each do |adapter|
      gem "dm-#{adapter}-adapter", DM_VERSION, :git => "#{DATA_MAPPER}/dm-#{adapter}-adapter.git"
    end
  end

  plugins = ENV['PLUGINS'] || ENV['PLUGIN']
  plugins = plugins.to_s.tr(',', ' ').split.push('dm-migrations').uniq

  plugins.each do |plugin|
    gem plugin, DM_VERSION, :git => "#{DATA_MAPPER}/#{plugin}.git"
  end
end

gem 'rspec',	'~> 1.3.0', :group => [:development, :test]