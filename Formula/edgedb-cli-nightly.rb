class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "3.0.0-dev.960"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-3.0.0-dev.960+40d95df?edgedb.nightly",
        using: :nounzip
      sha256 "9c262e35af909906b8d724e3329585e283ba4a5ca680ad6ddf328dc5dfac9a56"
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-3.0.0-dev.960+213ae8a?edgedb.nightly",
        using: :nounzip
      sha256 "bf58c6a7f07f9b85ea0ffc73a5d04a405209befe8f4c03f1b045e5407ca9957c"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-3.0.0-dev.960+255a1c9?edgedb.nightly",
        using: :nounzip
      sha256 "c860c4b270e7c1f4846026a2d03566187bb648274b8526d3ce80e53a732475c7"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-3.0.0-dev.960+8f8acb0?edgedb.nightly",
        using: :nounzip
      sha256 "83437d14a9b1d728503805dea01f699594034046f41b3bbefb51086e2ed0313d"
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
