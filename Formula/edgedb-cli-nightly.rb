class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "3.3.0-dev.1019"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-3.3.0-dev.1019+d4f02b3",
        using: :nounzip
      sha256 "b204037040cae0ba6bec0def1728e9c4fd8ad4f2465b660e354dfad322cd0e63"

      def install
        bin.install "edgedb-cli-3.3.0-dev.1019+d4f02b3" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-3.3.0-dev.1019+7b14a43",
        using: :nounzip
      sha256 "5f6b641be73aac2a92a9b2ac1e2b4c1e3550daa0e60e296bd08a356e6e3b35d4"

      def install
        bin.install "edgedb-cli-3.3.0-dev.1019+7b14a43" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-3.3.0-dev.1019+0cfcd51",
        using: :nounzip
      sha256 "1d881eab76fd5d2af473439342c36c9be39180094056ae5bdd7519236d595fc2"

      def install
        bin.install "edgedb-cli-3.3.0-dev.1019+0cfcd51" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-3.3.0-dev.1019+becf649",
        using: :nounzip
      sha256 "eaf04fa6e2e4a3d5f64dff82883f69870ac3c265fa09fac539ac47e3d58d23e7"

      def install
        bin.install "edgedb-cli-3.3.0-dev.1019+becf649" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
