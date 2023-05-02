class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "3.0.0-dev.970"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-3.0.0-dev.970+b2d8d43?edgedb.nightly",
        using: :nounzip
      sha256 "28f6733c7e18bde850b66e76395cfb1f05f5f54798b996553a58a88191f67bac"
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-3.0.0-dev.970+2e771f3?edgedb.nightly",
        using: :nounzip
      sha256 "6ef8e5d4107733cfff75641bbf0d9703cc594406889cf5cda7defe0c62043d59"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-3.0.0-dev.970+9679cd3?edgedb.nightly",
        using: :nounzip
      sha256 "ff0bb305ae97fea18cea54251f4ec375cb1d31a26048e1afb728a41f57b19cdc"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-3.0.0-dev.970+5993d4d?edgedb.nightly",
        using: :nounzip
      sha256 "748c62b7f8240e63125937f26cce476f3d323c4b8d3d1a8ba2b7bce833142eec"
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
