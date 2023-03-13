class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "3.0.0-dev.932"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-3.0.0-dev.932+bb446aa?edgedb.nightly",
        using: :nounzip
      sha256 "32fe3eb9dea7408f73f13368926ba71eb7190ac673bd5bf68d4f5f6b56b9c07f"
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-3.0.0-dev.932+1384c68?edgedb.nightly",
        using: :nounzip
      sha256 "c54c46bb231026fe4fb8c27f1a91ef70e344959ccb64ffe399825dc6eaeb1198"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-3.0.0-dev.932+fb8f0d6?edgedb.nightly",
        using: :nounzip
      sha256 "2554c77179d37474ee7b10ccb9643e192e04fcba9d18260b3bc8186f14eba7b4"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-3.0.0-dev.932+11a41e9?edgedb.nightly",
        using: :nounzip
      sha256 "2a7e93c195fb0d574fad643f9df8a1a0f5fb00a4ff02c70be9a2ffcaa4e61ac7"
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
