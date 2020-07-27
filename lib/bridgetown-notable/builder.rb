# frozen_string_literal: true

module BridgetownNotable
  class Builder < Bridgetown::Builder
    def build
      liquid_tag "sample_plugin" do
        "This plugin works!"
      end
    end
  end
end

BridgetownNotable::Builder.register
