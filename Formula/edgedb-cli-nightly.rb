class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "2.2.0-dev.869"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-2.2.0-dev.869+d28c4f4?edgedb.nightly",
        using: :nounzip
      sha256 "aaaece232784b9b58b6b1076a45353c35763cc5dc3fa7ffbf83c1d6cf9354f5b"
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-2.2.0-dev.869+769b625?edgedb.nightly",
        using: :nounzip
      sha256 "e4eda0de376f7dbff9b5b4c717a988db0fafaee74c3110258e9be6e00add77e4"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-2.2.0-dev.869+c133454?edgedb.nightly",
        using: :nounzip
      sha256 "bf9e843f3a8eeabc6ef50aff83737cb023b1f79cefd93ede5134f3489a141466"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-2.2.0-dev.869+4f8cd78?edgedb.nightly",
        using: :nounzip
      sha256 "a0b64bb77d5fcfce9987bd0898a97425292c9d4df56ad8a69394a29d2a895c89"
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
