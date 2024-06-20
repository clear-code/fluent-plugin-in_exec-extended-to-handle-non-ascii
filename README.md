#  fluent-plugin-in_exec-extended-to-handle-non-ascii

A [Fluentd](https://fluentd.org/) input plugin extended built-in `in_exec` to handle non-ASCII characters. 

This **REPLACES** the built-in `in_exec` plugin and allows the collection of non-ASCII characters.

The code is the same as proposed in https://github.com/fluent/fluentd/pull/4533.
If it is merged and released, it is recommended to update Fluentd and use the latest built-in `in_exec`.
If you can't update Fluentd for some reason, you can use this to replace the build-in `in_exec`.

## Installation

### RubyGems

```
$ gem install fluent-plugin-in_exec-extended-to-handle-non-ascii
```

### Bundler

Add following line to your Gemfile:

```ruby
gem "fluent-plugin-in_exec-extended-to-handle-non-ascii"
```

And then execute:

```
$ bundle
```

## Configuration

* https://docs.fluentd.org/input/exec
* https://github.com/fluent/fluentd/pull/4533

Sample config:

```apache
<source>
  @type exec
  tag test
  command "echo こんにちは、世界"
  encoding utf-8
  <parse>
    @type none
  </parse>
</source>

<match test>
  @type stdout
</match>
```

## Copyright

* Copyright(c) 2024 Fluentd Authors, Daijiro Fukuda
  * The code is from https://github.com/fluent/fluentd/pull/4533.
* License
  * Apache License, Version 2.0
