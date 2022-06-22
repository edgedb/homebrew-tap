require "json"

class EdgedbCliNightly < Formula
  def self.plat
    if OS.mac?
      "x86_64-apple-darwin"
    elsif OS.linux?
      "x86_64-unknown-linux-musl"
    end
  end

  def self.download_file_path
    "edgedb-cli-1.2.0-dev.782+11d0cb6"
  end

  def self.download_sha256_checksum
    `curl --silent "https://packages.edgedb.com/archive/#{plat}.nightly/#{download_file_path}.sha256"`.split.first
  end

  desc "Nightly build of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  url "https://packages.edgedb.com/archive/#{plat}.nightly/#{download_file_path}?edgedb.nightly",
    using: :nounzip
  version "1.2.0-dev.782+11d0cb6"
  sha256 download_sha256_checksum

  def install
    bin.install "edgedb.nightly" => "edgedb-nightly"
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
