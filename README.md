# safely

[![Build Status](https://travis-ci.org/kennethkalmer/safely.png)](https://travis-ci.org/kennethkalmer/safely)
[![Coverage Status](https://coveralls.io/repos/kennethkalmer/safely/badge.png)](https://coveralls.io/r/kennethkalmer/safely)

Safely is a simple exception handling and alerting mechanism extract from the [daemon-kit](https://github.com/kennethkalmer/daemon-kit) project.

Safely currently supports error reporting to Hoptoad, or via email. Safely can also log all exceptions to a file when a program exited abnormally, shedding light on what caused the failures.

## Installation and Usage

Please refer to the [wiki](https://github.com/kennethkalmer/safely/wiki) for installation and usage information.

## TODO

* Support for logging exceptions
* Fine-tune strategies
* Support for trapping exceptions on exit

## Contributing to safely

* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it
* Fork the project
* Start a feature/bugfix branch
* Commit and push until you are happy with your contribution
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## Copyright

Copyright (c) 2014 Kenneth Kalmer. See LICENSE.txt for
further details.

