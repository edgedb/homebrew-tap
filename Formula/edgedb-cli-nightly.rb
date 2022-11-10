class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "2.2.0-dev.870"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-2.2.0-dev.870+f3e859b?edgedb.nightly",
        using: :nounzip
      sha256 "16664e0ac1f01f81f56d68c7716d84be3d8e6845ee8b064e82e65705f769ac26"
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-2.2.0-dev.870+f3e859b?edgedb.nightly",
        using: :nounzip
      sha256 "3c6cfa0b9bdbca5e59b1d75de8ceec5a31804af21b920ddf03ecd53f0157271e"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-2.2.0-dev.870+770f07e?edgedb.nightly",
        using: :nounzip
      sha256 "9458749b8442f0b5a48ecbe6394151f9152c05958d6efd073896e76c4a8ec9c1"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-2.2.0-dev.870+1727c91?edgedb.nightly",
        using: :nounzip
      sha256 "80b609e96b284bbcf67d22995ed995562b5815fc0d3b0697434c18d044e1e243"
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
