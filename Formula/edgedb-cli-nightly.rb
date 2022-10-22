class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "2.1.0-dev.858"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-2.1.0-dev.858+ff162a6?edgedb.nightly",
        using: :nounzip
      sha256 "e7d2e296ae39ff57a9170fd8eaee33e7c603d8375b5a0c08952ed9aa11402a0c"
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-2.1.0-dev.858+5c519e0?edgedb.nightly",
        using: :nounzip
      sha256 "d20089fce59efc8c0a0bd8503f5f3e69bc01b592ffccfe5efb8a7fb9a6239d93"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-2.1.0-dev.858+d620ee1?edgedb.nightly",
        using: :nounzip
      sha256 "c75d4a119c70337d1656e7ab668f06fc99b579cce42635eab10c0a91140aa42f"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-2.1.0-dev.858+713c63d?edgedb.nightly",
        using: :nounzip
      sha256 "07d3b8ccaae85c5ffc0a96d5d3d1c617e2c74822304f1912fe460db72511a677"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  def install
    bin.install "edgedb.nightly" => "edgedb-nightly"
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
