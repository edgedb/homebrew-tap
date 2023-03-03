class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "3.0.0-dev.922"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-3.0.0-dev.922+5cf1368?edgedb.nightly",
        using: :nounzip
      sha256 "dc848bae4c110b89db24f6d330753b85defdf63dfe7f81093306ab363ef3422e"
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-3.0.0-dev.922+5dccb7c?edgedb.nightly",
        using: :nounzip
      sha256 "3b030068274d39363f585b78db245ce2920c90938537061ed62772ac3cd72544"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-3.0.0-dev.922+47c1e6f?edgedb.nightly",
        using: :nounzip
      sha256 "0cdc64c98381d29b5cf7dd728906e7b82a56f504e29108a04378a9dd67243172"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-3.0.0-dev.922+5cf1368?edgedb.nightly",
        using: :nounzip
      sha256 "975dedeb06f8b9dce70d714534b4a840f23d38e9bf8f222e929388a678258537"
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
