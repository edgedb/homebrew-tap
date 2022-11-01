class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "2.1.0-dev.861"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-2.1.0-dev.861+4ebd483?edgedb.nightly",
        using: :nounzip
      sha256 "196fd722eef45297dd052569fdad8e2d5c3f9829b7920bf2431d029238f1f249"
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-2.1.0-dev.861+e38b701?edgedb.nightly",
        using: :nounzip
      sha256 "e01b8a84867d49a04f0dd48e6b69ab82936619b44f55ca16349348a32fe28462"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-2.1.0-dev.861+44aea60?edgedb.nightly",
        using: :nounzip
      sha256 "5717ba313bfdfd74560bcd07e312dcf8e69e02c03106b2a006d57fff024b2354"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-2.1.0-dev.861+5f0b632?edgedb.nightly",
        using: :nounzip
      sha256 "aaae2d1368a68f1a0a2b74a0b3eef7fab46cf8742b3b76efc073083d5a78977c"
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
