# Jekyll::Turbo

**jekyll-turbo** is a simple Jekyll plugin that brings [Hotwire Turbo Drive](https://turbo.hotwired.dev/) to your static site. It automatically injects the necessary `<script type="module">` tag into your HTML files at build time, enabling seamless, fast page transitions - without a single line of JavaScript.

This plugin is ideal for Jekyll users who want modern navigation speed without needing Webpack, npm, or any client-side setup.

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

**⚠️ Tip:** Note that the `github-pages` gem runs in `safe` mode and only allows [a defined set of plugins](https://pages.github.com/versions/). To use this gem in GitHub Pages, you need to build your site locally or use a CI (e.g. [Github Workflow](https://help.github.com/en/actions/configuring-and-managing-workflows/configuring-a-workflow)).

[Click here for more information.](https://jekyllrb.com/docs/continuous-integration/github-actions/)

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/maikhel/jekyll-turbo. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/maikhel/jekyll-turbo/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Jekyll::Turbo project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/maikhel/jekyll-turbo/blob/main/CODE_OF_CONDUCT.md).
