class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "2.3.0-dev.895"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-2.3.0-dev.895+15bfea9?edgedb.nightly",
        using: :nounzip
      sha256 "2d2afc29575b6cabd1d5fccf0ef632a4c0fce1c5c5f4c98a4f16a89d7cfc4cb2"
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-2.3.0-dev.895+15bfea9?edgedb.nightly",
        using: :nounzip
      sha256 "2bda31159d7640e7a215881041952f652341185a7322f54b38bb1500512e72c2"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-2.3.0-dev.895+0b1a8ea?edgedb.nightly",
        using: :nounzip
      sha256 "b2f6751ccf4351242801dc3af04e09695f1975d6125ea4f990f5f944fea77d81"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-2.3.0-dev.895+00b16d4?edgedb.nightly",
        using: :nounzip
      sha256 "9eed2513c6765d78383ae08c7f72b03872e3b27c24ae7bdbf40dafbf313b1654"
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
