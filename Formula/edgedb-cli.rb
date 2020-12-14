require "json"

class EdgedbCli < Formula
  def self.plat
    if OS.mac?
      "macos-x86_64"
    elsif OS.linux?
      "linux-x86_64" if Hardware::CPU.intel?
    end
  end

  def self.download_file_path
    "edgedb-cli_1.0.0-alpha.7_2020121305"
  end

  def self.download_sha256_checksum
    `curl --silent "https://packages.edgedb.com/archive/#{plat}/#{download_file_path}.sha256"`.split.first
  end

  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  url "https://packages.edgedb.com/archive/#{plat}/#{download_file_path}?edgedb.latest",
    :using => :nounzip
  version "1.0.0-alpha.7"
  sha256 download_sha256_checksum
  bottle :unneeded

  def install
    bin.install "edgedb.latest" => "edgedb"
  end

  test do
    system "#{bin}/edgedb --version"
  end
end
