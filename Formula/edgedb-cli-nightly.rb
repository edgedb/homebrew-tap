class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "4.2.0-dev.1087"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-4.2.0-dev.1087+b1ae71c",
        using: :nounzip
      sha256 "36c3725648e94328326997caf6772f23371b4ceb505046f6a08504b7d2bf66af"

      def install
        bin.install "edgedb-cli-4.2.0-dev.1087+b1ae71c" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-4.2.0-dev.1087+fb31678",
        using: :nounzip
      sha256 "10e25658e8e63bb1aa87577a9db6386e9b2ec08a2e2930a9a94f4eb6bf43d2ae"

      def install
        bin.install "edgedb-cli-4.2.0-dev.1087+fb31678" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-4.2.0-dev.1087+f1c6536",
        using: :nounzip
      sha256 "bd35565d1900be3007198fcbe65133dac26e2415e810191651ce09707eb69077"

      def install
        bin.install "edgedb-cli-4.2.0-dev.1087+f1c6536" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-4.2.0-dev.1087+6c92090",
        using: :nounzip
      sha256 "2002d7fc056675a176d871cef473e917f8a307f9702478139ab8c810c524e3b3"

      def install
        bin.install "edgedb-cli-4.2.0-dev.1087+6c92090" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
