class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "2.1.0-dev.860"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-2.1.0-dev.860+36c5ff2?edgedb.nightly",
        using: :nounzip
      sha256 "7f17544e0e06b62f7f3048412376742018e447459dbfddb954e9418be9e0881e"
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-2.1.0-dev.860+36c5ff2?edgedb.nightly",
        using: :nounzip
      sha256 "969851a9249ed64a22fe4c811f74514f3489120ad65e441a1336567aa7cd1ed0"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-2.1.0-dev.860+ab278d9?edgedb.nightly",
        using: :nounzip
      sha256 "e5dc8df5984746dad491140bc5a46adc025a0745d01dbdce65219fc3bb918433"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-2.1.0-dev.860+4515fd0?edgedb.nightly",
        using: :nounzip
      sha256 "b6a9b39d5bab4ffaf324822260f656247981d9e92f4d41440683948fd6870431"
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
