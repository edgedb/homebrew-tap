class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "2.3.0-dev.902"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-2.3.0-dev.902+04d64ff?edgedb.nightly",
        using: :nounzip
      sha256 "4d457a545ea2ac189e1d7c7ebe9cda31d8706637225da083aa53704f9b8690c2"
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
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-2.3.0-dev.902+663d97f?edgedb.nightly",
        using: :nounzip
      sha256 "428cf475f2115e201507784fc19b4b50510bf9d245659a055759e12341dcbbba"
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
