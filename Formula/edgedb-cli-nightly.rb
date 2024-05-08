class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "5.2.0-dev.1154"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-5.2.0-dev.1154+6b89bf4",
        using: :nounzip
      sha256 "73c213fd9f26789c4b27a2b38095935de991bc547b73e3048f44062ca0759940"

      def install
        bin.install "edgedb-cli-5.2.0-dev.1154+6b89bf4" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-5.2.0-dev.1154+6b89bf4",
        using: :nounzip
      sha256 "9778ae3506de5fbff4941b4689f5d83f69bb6aef08b8760669d4ff336a1eb524"

      def install
        bin.install "edgedb-cli-5.2.0-dev.1154+6b89bf4" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-5.2.0-dev.1154+4db029b",
        using: :nounzip
      sha256 "e7b4f6103292d278816dc85b37ad966eae9712330e283ddf37cfd9326c3f0852"

      def install
        bin.install "edgedb-cli-5.2.0-dev.1154+4db029b" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-5.2.0-dev.1154+12673bd",
        using: :nounzip
      sha256 "b6f48e8e26af20349286259313ade9fd5a22c97b64ea3512bdc754ddda796af7"

      def install
        bin.install "edgedb-cli-5.2.0-dev.1154+12673bd" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
