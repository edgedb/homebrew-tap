class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "4.2.0-dev.1080"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-4.2.0-dev.1080+da056f9",
        using: :nounzip
      sha256 "cad1cff67d38e4b22774da19feba6a6880d2db46dd05a77739565e4731918e18"

      def install
        bin.install "edgedb-cli-4.2.0-dev.1080+da056f9" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-4.2.0-dev.1080+d470c75",
        using: :nounzip
      sha256 "1346c25fa1a0060bc3aeb0881884626bca5d048b926c4d3c3ff996b2ecd34eb8"

      def install
        bin.install "edgedb-cli-4.2.0-dev.1080+d470c75" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-4.2.0-dev.1080+135d384",
        using: :nounzip
      sha256 "40a904eff254d29001c27a639a36b7ee1939808d6e1df1e03d43bffc835cb9e0"

      def install
        bin.install "edgedb-cli-4.2.0-dev.1080+135d384" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-4.2.0-dev.1080+de71c4a",
        using: :nounzip
      sha256 "fbb6431bf91da689782bf04f8d79215282c31ef61108db50f2f2592cedee6563"

      def install
        bin.install "edgedb-cli-4.2.0-dev.1080+de71c4a" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
