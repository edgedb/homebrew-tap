class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "3.0.0-dev.941"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-3.0.0-dev.941+18195db?edgedb.nightly",
        using: :nounzip
      sha256 "d61f94756f28ea0f610d6f10f3f7bf7fb1b321d3bc6180146366ba7c910f8eec"
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-3.0.0-dev.941+05520c8?edgedb.nightly",
        using: :nounzip
      sha256 "45d27961c22b0f4d59ebc7adbc40c581a24f38dc3df83c2bcc88719d629b4051"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-3.0.0-dev.941+1365e9a?edgedb.nightly",
        using: :nounzip
      sha256 "6646cd5e32b5897621e7fd38e190732028c979e7b617feb9ddb742143c41574d"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-3.0.0-dev.941+19b3a8f?edgedb.nightly",
        using: :nounzip
      sha256 "30f861dfa16e1c5adabad62da03f47d3be4a61cbeea043765f2f3ca398d8181d"
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
