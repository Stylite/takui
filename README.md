# takui

A simple crystal based image host.

## Installation

```bash
$ git clone https://github.com/stylite/takui
$ cd takui
$ shards install
$ crystal build --release src/takui.cr
$ export KEMAL_ENV=production # or you can edit in Kemal.config.env = "production"
$ ./takui
```
Make sure to fill out a config.yaml file. An example is placed here [Config](https://github.com/stylite/takui/blob/master/config.example.yaml)


## Contributing

1. Fork it (<https://github.com/stylite/takui/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Stylite](https://github.com/stylite) - creator and maintainer
