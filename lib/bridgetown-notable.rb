# frozen_string_literal: true

require "bridgetown"
require "bridgetown-notable/builder"

Bridgetown::PluginManager.new_source_manifest(
  origin: BridgetownNotable,
  components: File.expand_path("../components", __dir__),
  content: File.expand_path("../content", __dir__),
  layouts: File.expand_path("../layouts", __dir__)
)
