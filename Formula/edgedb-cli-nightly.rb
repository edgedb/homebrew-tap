class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "2.3.0-dev.912"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-2.3.0-dev.912+68581de?edgedb.nightly",
        using: :nounzip
      sha256 "86c3a67b8d8b1ce50b00e5b1f6e5dabe08b02e2187684f005774bf618517cae1"
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-2.3.0-dev.912+0049862?edgedb.nightly",
        using: :nounzip
      sha256 "93cca7e8fa931fe2e9641a1f13b758a154a4cb52fc6f50a31e71111b52ddfacc"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-2.3.0-dev.912+356d25b?edgedb.nightly",
        using: :nounzip
      sha256 "902228d7dc42bb750910f53021e0210a33ed864743b3fffd24307d00298fafcb"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-2.3.0-dev.912+596e350?edgedb.nightly",
        using: :nounzip
      sha256 "34053bfdb2ba957c61491ea70a636bafc2c81a49ea6f4f6bf69213af439e9db4"
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
