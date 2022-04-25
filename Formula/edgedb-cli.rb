require "json"

class EdgedbCli < Formula
  def self.plat
    if OS.mac?
      "x86_64-apple-darwin"
    elsif OS.linux?
      "x86_64-unknown-linux-musl"
    end
  end

  def self.download_file_path
    "edgedb-cli-1.1.2+0cdbb5f"
  end

  def self.download_sha256_checksum
    `curl --silent "https://packages.edgedb.com/archive/#{plat}/#{download_file_path}.sha256"`.split.first
  end

  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  url "https://packages.edgedb.com/archive/#{plat}/#{download_file_path}?edgedb.latest",
    using: :nounzip
  version "1.1.2+0cdbb5f"
  sha256 download_sha256_checksum

  def install
    bin.install "edgedb.latest" => "edgedb"
  end

  test do
    system "#{bin}/edgedb", "--version"
  end
end
