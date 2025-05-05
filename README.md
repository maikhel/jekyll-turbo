# Jekyll::Turbo

[![Build Status](https://github.com/maikhel/jekyll-turbo/actions/workflows/main.yml/badge.svg)](https://github.com/maikhel/jekyll-turbo/actions) [![Gem Version](https://badge.fury.io/rb/jekyll-turbo.svg)](https://badge.fury.io/rb/jekyll-turbo)

**jekyll-turbo** is a simple Jekyll plugin that brings [Hotwire Turbo Drive](https://turbo.hotwired.dev/) to your static site. It automatically injects the necessary `<script type="module">` tag into your HTML files at build time.

## Installation

1. Add the following to your site's `Gemfile`:

   ```ruby
   gem 'jekyll-turbo'
   ```

2. Add the following to your site's `_config.yml`:

   ```yml
   plugins:
     - jekyll-turbo
   ```

   **Note**: if `jekyll --version` is less than `3.5` use:

   ```yml
   gems:
     - jekyll-turbo
   ```

3. In your terminal, execute:

   ```bash
   bundle
   ```

4. (re)start your Jekyll server with:

   ```bash
   jekyll serve
   ```

## Usage

Install the plugin as described above.
The plugin will automatically inject this tag into the `<head>` of all your generated `.html` pages:

```HTML
<script type="module" src="https://cdn.jsdelivr.net/npm/@hotwired/turbo@8.0.4/dist/turbo.es2017-esm.js"></script>
```
Then, you can immediately use all Hotwire Turbo features on the client side, such as Turbo Drive and Turbo Frames.

**⚠️ Tip:** Note that the `github-pages` gem runs in `safe` mode and only allows [a defined set of plugins](https://pages.github.com/versions/). To use this gem in GitHub Pages, you need to build your site locally or use a CI (e.g. [Github Workflow](https://help.github.com/en/actions/configuring-and-managing-workflows/configuring-a-workflow)).

[Click here for more information.](https://jekyllrb.com/docs/continuous-integration/github-actions/)

## Planned Features
This plugin is currently zero-config and focused on simplicity. Future improvements may include:

- [ ] Option to serve Turbo locally instead of using a CDN
- [ ] Support for customizing the Turbo version
- [ ] Configuration via `_config.yml`

Feel free to open an issue or contribute via pull request if you'd like to help!

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/maikhel/jekyll-turbo. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/maikhel/jekyll-turbo/blob/main/CODE_OF_CONDUCT.md).

1. [Fork this repository](https://github.com/maikhel/jekyll-turbo/fork)
2. Create your branch (`git checkout -b feat/my-new-feature`)
3. Commit your changes (`git commit -m 'Add cool feature'`)
4. Push to the branch (git push origin feat/my-new-feature)
5. Create a new Pull Request

### Development

To install this gem onto your local machine, run `bundle exec rake install`.

### Testing

Use the following command to run tests and RuboCop check:

```bash
rake
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Jekyll::Turbo project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/maikhel/jekyll-turbo/blob/main/CODE_OF_CONDUCT.md).
