class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "2.3.0-dev.902"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-2.3.0-dev.902+fe1f8d5?edgedb.nightly",
        using: :nounzip
      sha256 "024f7f1b3b8ff67cf22f6513753cee2dadba33d3340f24e7bded1443b986044d"
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-2.3.0-dev.902+1bc02ec?edgedb.nightly",
        using: :nounzip
      sha256 "fd4024c8deeb18823ddeb9a61a6ba71672672738a10326ce14061065b7d9dd2a"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-2.3.0-dev.902+f6f7d29?edgedb.nightly",
        using: :nounzip
      sha256 "f090d689d272b4ed324212ceb5bc797cf03b6b307dd358cb97ebc8469df61c88"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-2.3.0-dev.902+1cd8df4?edgedb.nightly",
        using: :nounzip
      sha256 "8bed9e87c6ccdabfe49e54cf1bb27b936a0ae4032fe84add1db87750cfd95db8"
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
