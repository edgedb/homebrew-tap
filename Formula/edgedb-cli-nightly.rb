class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "4.3.0-dev.1133"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-4.3.0-dev.1133+60cd5d1",
        using: :nounzip
      sha256 "b43749daceec31c7026581d8bd099598eeb9aedbed101183c3aa1fb20dade9e0"

      def install
        bin.install "edgedb-cli-4.3.0-dev.1133+60cd5d1" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-4.3.0-dev.1133+3b630a8",
        using: :nounzip
      sha256 "3d996cb67871a77bb4026329c73f601396833382885896b5b089c58386598238"

      def install
        bin.install "edgedb-cli-4.3.0-dev.1133+3b630a8" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-4.3.0-dev.1133+15accf8",
        using: :nounzip
      sha256 "a47a95e385affd3fd24a6738305e5e27cd0bc6a4bdb5fbb30303d8325bc4d59b"

      def install
        bin.install "edgedb-cli-4.3.0-dev.1133+15accf8" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-4.3.0-dev.1133+a1a1976",
        using: :nounzip
      sha256 "5abda7a342f23ecf71802367603f12ae95a7dcb8e9f15469bdfe7e28cc87f934"

      def install
        bin.install "edgedb-cli-4.3.0-dev.1133+a1a1976" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
