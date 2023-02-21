class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "3.0.0-dev.913"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-3.0.0-dev.913+3ed516f?edgedb.nightly",
        using: :nounzip
      sha256 "4b43678380bb89b9df02959e460ef7f0521c7be6c64b5ba654f9b2ef7a03027a"
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-3.0.0-dev.913+494242f?edgedb.nightly",
        using: :nounzip
      sha256 "951d4f254cde9a2b593f388e3db3ffa2c7996ff077e584e9b8a98cd3b26802c2"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-3.0.0-dev.913+6dfe7e9?edgedb.nightly",
        using: :nounzip
      sha256 "47f56385954f3bd974bb2b14ccc8f50b2f6a3133068e4c3301def729a4092ebb"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-3.0.0-dev.913+7ae9445?edgedb.nightly",
        using: :nounzip
      sha256 "536aff4bf5d19878c4c6710168952a6484b7164442ddec25be69a4af5998dd75"
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
