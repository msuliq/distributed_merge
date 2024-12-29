# DistributedMerge

`distributed_merge` is a Ruby gem that extends the `Array` class with a method for merging 
and interleaving arrays of varying lengths, ensuring that elements are distributed as 
evenly as possible. This method can be applied to any two-dimensional array containing two 
or more sub-arrays of different sizes.

## Installation

Add the gem to your project by running:
```bash
  bundle add distributed_merge
```

If you are not using Bundler to manage dependencies, install the gem directly with:
```bash
  gem install distributed_merge
```

## Usage

To use the `distributed_merge` method, include the gem in your project:
```ruby
require 'distributed_merge'
```

Once included, you can call the `distributed_merge` method on any two-dimensional array 
containing sub-arrays of varying lengths. The method will return a single merged array 
with all elements interleaved and evenly distributed.

```ruby
[[1, 2, 3, 4], ['a', 'b'], ['C']].distributed_merge
# => [1, "b", 2, "C", 3, "a", 4]
```

In this example:
* The method merges the sub-arrays `[1, 2, 3, 4]`, `['a', 'b']`, and `['C']`.
* It ensures the elements are interleaved and distributed as evenly as possible in the final array.

## Contributing

Bug reports and pull requests are welcome at https://github.com/msuliq/distributed_merge. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/msuliq/distributed_merge/blob/main/CODE_OF_CONDUCT.md).

The best way to contribute would be to fork this repo, create a new branch from main, to merge the branch into main of the fork once the new code is in place and then open a pull request to merge forked main into the main of the present repo.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the DistributedMerge project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/msuliq/distributed_merge/blob/main/CODE_OF_CONDUCT.md).
