require "json"

class EdgedbCliLatest < Formula
  def self.plat
    if OS.mac?
      "macos-x86_64"
    elsif OS.linux?
      "linux-x86_64" if Hardware::CPU.intel?
    end
  end

  def self.latest_version
    indexes = JSON.parse(`curl --silent https://packages.edgedb.com/archive/.jsonindexes/#{plat}.json`)
    versions = []
    indexes["packages"].each do |package|
      next unless package["name"] == "edgedb-cli"

      versions.push(package["version"])
    end
    versions.sort.reverse!.first
  end

  def self.download_sha256_checksum
    `curl --silent "https://packages.edgedb.com/dist/#{plat}/edgedb-cli_latest.sha256"`.split.first
  end

  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  url "https://packages.edgedb.com/dist/#{plat}/edgedb-cli_latest?edgedb.latest",
    :using => :nounzip
  sha256 download_sha256_checksum
  version "unknown" # `brew style` insists on string literals for version, get outta here
  version latest_version
  bottle :unneeded

  def install
    bin.install "edgedb.latest" => "edgedb"
  end

  test do
    system "#{bin}/edgedb --version"
  end
end
