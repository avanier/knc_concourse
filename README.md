# knc_concourse

Installs and configures Concourse `web` and/or `worker`.

It's really just `worker` for now. :P

## Why you should not use this cookbook

Concourse is officially supported under BOSH, or ran via Docker. Doing a binary
deployment of Concourse is NOT RECOMMENDED. This cookbook assumes the following :

  - You really, really, really know what you're doing
  - You're intimately familiar with the Concourse code base
  - You're intimately familiar with the inner workings of linux, filesystems,
    Garden, `runc`, Docker images, and c-groups
  - You're aware you shouldn't run this in production
  - You know this will blow up in your face

Now, don't go complaining to Vito, I friggin' warned you.

## Why should I run this cookbook?

It would be appropriate for :

  - Proof of concepts
  - Debugging
  - Unsupported shenanigans
  - Trolling

## Installation

TODO: Describe the installation process

## Usage

TODO: Write usage instructions

## Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :D
