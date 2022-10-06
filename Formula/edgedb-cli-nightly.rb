class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "2.1.0-dev.852"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-2.1.0-dev.852+df18f9d?edgedb.nightly",
        using: :nounzip
      sha256 "a30333ee788fe06a7ff7c2cd6de409e6cf57d85e8357ef01ebfc623acd940e92"
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-2.1.0-dev.852+df18f9d?edgedb.nightly",
        using: :nounzip
      sha256 "56eb3aa6b97c3c5f987d5e1eab0b8126495eb8e2acef497a00c8dcb4dddad89e"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-2.1.0-dev.852+122a357?edgedb.nightly",
        using: :nounzip
      sha256 "dc8eebc735861d0e286f37f6e5c773d0edcbad82bb93136b3d7a1a25ce194917"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-2.1.0-dev.852+7f2f1a8?edgedb.nightly",
        using: :nounzip
      sha256 "0a12e2f95390c7194a621e41fda0f87f349afefe25e44841e7c773481ee4b10f"
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
