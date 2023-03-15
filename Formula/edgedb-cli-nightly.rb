class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "3.0.0-dev.939"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-3.0.0-dev.939+7d55899?edgedb.nightly",
        using: :nounzip
      sha256 "9ad404c98f0c394675dce53c99dd1c5e94a432ddf1f174f25729098030666bd4"
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-3.0.0-dev.939+bc283f2?edgedb.nightly",
        using: :nounzip
      sha256 "64e6d7ad308aa2a8b000d6cba072da00d3528e22259456ab67cf0680cce6e3ee"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-3.0.0-dev.939+446be2d?edgedb.nightly",
        using: :nounzip
      sha256 "5c976e81fac377d895045853f4053b7c018294f826ec42dcd0e2c03f032f163e"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-3.0.0-dev.939+c14a846?edgedb.nightly",
        using: :nounzip
      sha256 "03079827ef5704865fe4269d4bb47ba16bddc3acadf4645338d478db85e0901d"
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
