# frozen_string_literal: true

require "spec_helper"

describe(BridgetownNotable) do
  let(:overrides) { {} }
  let(:config) do
    Bridgetown.configuration(Bridgetown::Utils.deep_merge_hashes({
      "full_rebuild" => true,
      "root_dir"     => root_dir,
      "source"       => source_dir,
      "destination"  => dest_dir,
    }, overrides))
  end
  let(:metadata_overrides) { {} }
  let(:metadata_defaults) do
    {
      "name" => "My Awesome Site",
      "author" => {
        "name" => "Ada Lovejoy",
      }
    }
  end
  let(:site) { Bridgetown::Site.new(config) }
  before(:each) do
    metadata = metadata_defaults.merge(metadata_overrides).to_yaml.sub("---\n", "")
    File.write(source_dir("_data/site_metadata.yml"), metadata)
    site.process
    FileUtils.rm(source_dir("_data/site_metadata.yml"))
  end

  let(:first) { File.read(dest_dir("/notes/first.html")) }
  let(:second) { File.read(dest_dir("/notes/second.html")) }

  it "updates attachment links" do
    expect(first).to match('src="/attachments/foo')
  end

  it "populates backlinks" do
    expect(first).to match('backlink: second')
  end

  it "formats wikilinks" do
    expect(second).to match('<a href="/notes/first.html" class="wikilink">first</a>')
  end
end
