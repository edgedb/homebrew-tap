require "json"

class EdgedbCliNightly < Formula
  def self.plat
    if OS.mac?
      "macos-x86_64"
    elsif OS.linux?
      "linux-x86_64" if Hardware::CPU.intel?
    end
  end

  def self.download_file_path
    "edgedb-cli_1.0.0-beta.2+d20210521.ga52c1a887_202105210009~nightly"
  end

  def self.download_sha256_checksum
    `curl --silent "https://packages.edgedb.com/archive/#{plat}.nightly/#{download_file_path}.sha256"`.split.first
  end

  desc "Nightly build of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  url "https://packages.edgedb.com/archive/#{plat}.nightly/#{download_file_path}?edgedb.nightly",
    :using => :nounzip
  version "1.0.0-beta.2+d20210521.ga52c1a887"
  sha256 download_sha256_checksum
  bottle :unneeded

  def install
    bin.install "edgedb.nightly" => "edgedb-nightly"
  end

  test do
    system "#{bin}/edgedb-nightly --version"
  end
end
