class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "3.0.0-dev.983"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-3.0.0-dev.983+2dd3288",
        using: :nounzip
      sha256 "0c4e5578492942f840f93e9c733ba186485797e7dd6ad475f77589284461dcb3"

      def install
        bin.install "edgedb-cli-3.0.0-dev.983+2dd3288" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-3.0.0-dev.983+0a2b8f0",
        using: :nounzip
      sha256 "1d7a139b218930468606e069c132c3e8d4c413fb46d2fec620cce66767d3fce2"

      def install
        bin.install "edgedb-cli-3.0.0-dev.983+0a2b8f0" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-3.0.0-dev.983+3e5398e",
        using: :nounzip
      sha256 "796d224b9e494d4af75251eb6fd80789b42f50fd7675ca164e6a61aab8ac77f1"

      def install
        bin.install "edgedb-cli-3.0.0-dev.983+3e5398e" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-3.0.0-dev.983+697e48d",
        using: :nounzip
      sha256 "908538cf3cb3621387155f38db2ffa20368f2953e6548ab298a6e44080898f45"

      def install
        bin.install "edgedb-cli-3.0.0-dev.983+697e48d" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
