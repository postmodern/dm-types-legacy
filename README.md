# dm-types-legacy

* [Source](http://github.com/postmodern/dm-types-legacy)
* [Issues](http://github.com/postmodern/dm-types-legacy/issues)
* [Documentation](http://rubydoc.info/gems/dm-types-legacy/frames)
* [Email](mailto:postmodern.mod3 at gmail.com)

## Description

dm-types-legacy is a collection of legacy data types for working with
legacy databases or unsanitized data.

## Types

* {DataMapper::Types::Legacy::DateString}: Date values stored as Strings.
* {DataMapper::Types::Legacy::TimeString}: Time values stored as Strings.
* {DataMapper::Types::Legacy::NumericIPAddr}: IP Addresses stored as
  Integers.
* {DataMapper::Types::Legacy::URIText}: URI escaped text.
* {DataMapper::Types::Legacy::HTMLText}: HTML escaped text.

## Requirements

* [dm-core](http://github.com/datamapper/dm-core/) ~> 1.0

## Install

    $ sudo gem install dm-types-legacy

## License

Copyright (c) 2010-2011 Hal Brodigan

See {file:LICENSE.txt} for license information.
