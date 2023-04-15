# DistributedMerge

[![Coverage](https://img.shields.io/badge/coverage-100%25-success.svg)](https://github.com/grosser/single_cov)

'distributed_merge' is a Ruby gem that adds a method to Array class that allows
merge interleaving arrays of non-equal length with elements being equally
distributed. The method can be called on a two-dimensional array containing two
or more sub-arrays of various size.

## Installation

To install the gem run the following command in the terminal:

    $ bundle add distributed_merge

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install distributed_merge

## Usage

To add the distributed_merge method to your project include it in your project like so:
```ruby
require 'distributed_merge'
```

When included the method can be called on any two-dimensional array containing sub-arrays of various size (non-equal length) and it will return a single layer merged array with all the elements of the sub-arrays evenly interleaved and distributed.

```ruby
[[1, 2, 3, 4], ['a', 'b'], ['C']].distributed_merge
# => [1, "b", 2, "C", 3, "a", 4]
```

## Contributing

Bug reports and pull requests are welcome at https://github.com/msuliq/distributed_merge. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/msuliq/distributed_merge/blob/main/CODE_OF_CONDUCT.md).

The best way to contribute would be to fork this repo, create a new branch from main, to merge the branch into main of the fork once the new code is in place and then open a pull request to merge forked main into the main of the present repo.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the DistributedMerge project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/msuliq/distributed_merge/blob/main/CODE_OF_CONDUCT.md).
