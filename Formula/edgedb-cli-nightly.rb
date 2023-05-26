class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "3.1.0-dev.998"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-3.1.0-dev.998+d16f478",
        using: :nounzip
      sha256 "c84c8c12acfecb333be6314dffbfad61eca515d2b7ff9b2b48e25403b074e006"

      def install
        bin.install "edgedb-cli-3.1.0-dev.998+d16f478" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-3.1.0-dev.998+11b30a7",
        using: :nounzip
      sha256 "c0a7b1c9e8fa540f26626ebec5a34f86ff64c656e7cca583caa124e767da00a3"

      def install
        bin.install "edgedb-cli-3.1.0-dev.998+11b30a7" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-3.1.0-dev.998+68f8acc",
        using: :nounzip
      sha256 "fd003fc3169973766a56274b32a5ac5af79929b74c423048babdcae596c6adb1"

      def install
        bin.install "edgedb-cli-3.1.0-dev.998+68f8acc" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-3.1.0-dev.998+802981a",
        using: :nounzip
      sha256 "527c40bf56dd29c597fe129e04dc79ce035638b117fc423e1d689189f58702c5"

      def install
        bin.install "edgedb-cli-3.1.0-dev.998+802981a" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
