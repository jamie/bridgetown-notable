# Notable for Bridgetown

A Bridgetown plugin to hoist notes and attachements from [Notable](https://notable.app/) inside your site.

## Installation

Run this command to add this plugin to your site's Gemfile:

```shell
$ bundle add bridgetown-notable -g bridgetown_plugins
```

## Usage

Currently supports hosting a single Notable data directory at `src/`, such that `src/notes` holds note entries, and `src/attachments` holds attachments.

Requires a bit of setup in bridgetown.config.yml:

```yaml
defaults:
  - scope:
      path: notes/
    values:
      notable: true
      layout: notable
```

By setting `notable: true` on pages, this plugin will:

- format `[[wikilinks]]` between Notable pages, with `<a class="wikilink"` to hook in styles if desired
- update markdown links/images from `@attachment` to a path Bridgetown can find
- track backlinks in `page.backlinks` if that's your thing

You can specify any layout you want, it's provided a `page` object like any other.

<!-- 
### Optional configuration options

The plugin will automatically use any of the following metadata variables if they are present in your site's `_data/site_metadata.yml` file.

… None yet -->

## Testing

* Run `bundle exec rspec` to run the test suite
* Or run `script/cibuild` to validate with Rubocop and test with rspec together.

## Contributing

1. Fork it (https://github.com/jamie/bridgetown-notable/fork)
2. Clone the fork using `git clone` to your local development machine.
3. Create your feature branch (`git checkout -b my-new-feature`)
4. Commit your changes (`git commit -am 'Add some feature'`)
5. Push to the branch (`git push origin my-new-feature`)
6. Create a new Pull Request

----

## Releasing (you can delete this section in your own plugin repo)

To release a new version of the plugin, simply bump up the version number in both `version.rb` and
`package.json`, and then run `script/release`. This will require you to have a registered account
with both the [RubyGems.org](https://rubygems.org) and [NPM](https://www.npmjs.com) registries.
You can optionally remove the `package.json` and `frontend` folder if you don't need to package frontend
assets for Webpack.

If you run into any problems or need further guidance, please check out our [Bridgetown community resources](https://www.bridgetownrb.com/docs/community)
where friendly folks are standing by to help you build and release your plugin or theme.

**NOTE:** make sure you add the `bridgetown-plugin` [topic](https://github.com/topics/bridgetown-plugin) to your
plugin's GitHub repo so the plugin or theme will show up on [Bridgetown's official Plugin Directory](https://www.bridgetownrb.com/plugins)! (There may be a day or so delay before you see it appear.)
