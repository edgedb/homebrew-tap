class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "2.1.0-dev.851"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-2.1.0-dev.851+35d72fa?edgedb.nightly",
        using: :nounzip
      sha256 "f321333b0172db5c9ec7e08f2c437b23d20a12f4ece6f4c70792d428ab3601b3"
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-2.1.0-dev.851+31cd7f3?edgedb.nightly",
        using: :nounzip
      sha256 "26011674ad0ac176735b2372aabdfc51b5168877c0f38f579b2d1a587306974c"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-2.1.0-dev.851+1ad8ec3?edgedb.nightly",
        using: :nounzip
      sha256 "574064f31d62f755ba823ffd59ebeb1e36f9d798094bdfbcfb8afb635e7ff361"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-2.1.0-dev.851+31cd7f3?edgedb.nightly",
        using: :nounzip
      sha256 "9b36c8fe2ee16e72d582f2c32c2ebec2b27de6affab875fa6aeb9cc3b18c2492"
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
