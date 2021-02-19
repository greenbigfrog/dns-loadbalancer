# dns-loadbalancer

Changes DNS records with Cloudflare on a interval (round robin style but with interval), or if a service is detected to be overloaded or unavailable, tracked via prometheus queries.

## Instructions
Pass the following as ENV vars, preferably probably `.env`
```
CLOUDFLARE_TOKEN=abcdefghijklmnopqrstuvwxyz
ZONE=4abe1fe2add41273f25ec0eb54455df38
```

## Development

TODO: Write development instructions here

## Contributing

1. Fork it (<https://github.com/greenbigfrog/dns-loadbalancer/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Jonathan B.](https://github.com/greenbigfrog) - creator and maintainer
