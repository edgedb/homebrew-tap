class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "3.0.0-dev.930"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-3.0.0-dev.930+1bae26b?edgedb.nightly",
        using: :nounzip
      sha256 "18acac8eb29c149a7dc8a4b7d5e317a701144091880d4f45a41247d142afd8b3"
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-3.0.0-dev.930+6bb3206?edgedb.nightly",
        using: :nounzip
      sha256 "63f6454b9376dcc710db9c276d423e5202eccc9b1edcf51c17738a7f623a2585"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-3.0.0-dev.930+a08ea4f?edgedb.nightly",
        using: :nounzip
      sha256 "c374b1d4d6d36c28ef5af0a9d2744846fd93f3e471dd5906941cf6dff58a7066"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-3.0.0-dev.930+2bd7a3e?edgedb.nightly",
        using: :nounzip
      sha256 "02ea91b7ae222c4fe23b1676bf844b56d562ec8b272b83b36e27b760ff079862"
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
