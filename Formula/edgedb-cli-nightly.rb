class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "2.3.0-dev.898"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-2.3.0-dev.898+dff4198?edgedb.nightly",
        using: :nounzip
      sha256 "32fb504f7b3fed0c189a518f0c8f5d818336460763ddb446891fadf51d371678"
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-2.3.0-dev.898+79e3807?edgedb.nightly",
        using: :nounzip
      sha256 "8a816fd45cee309c6e6328865a3ee70ef296ebfcca081fefc8a06b390e72a822"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-2.3.0-dev.898+106e444?edgedb.nightly",
        using: :nounzip
      sha256 "6a1049b9eb0e757730e63dfd1c3b4d409fd9b765ed01fb0bf924eb98399605f2"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-2.3.0-dev.898+ba69a01?edgedb.nightly",
        using: :nounzip
      sha256 "2fca254e427ae3a044906033649eaf4265867d4a1051f371a10fd7dcd5d4aa5a"
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
