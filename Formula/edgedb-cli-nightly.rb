class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "5.2.0-dev.1157"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-5.2.0-dev.1157+1300cce",
        using: :nounzip
      sha256 "2561fec9d1e431a56de280dd2c1f6b7cdc2a2f633c2e2897d318ff6c301a6189"

      def install
        bin.install "edgedb-cli-5.2.0-dev.1157+1300cce" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-5.2.0-dev.1157+3ae1b9e",
        using: :nounzip
      sha256 "55d6a9244324c79089bee5dbf5761b0bcc852726128ec8c7d1caeb446d40d70e"

      def install
        bin.install "edgedb-cli-5.2.0-dev.1157+3ae1b9e" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-5.2.0-dev.1157+1393197",
        using: :nounzip
      sha256 "543d34efff62e697fac9feeaac73b5768459b93050b2f453a79e6883186f3e7f"

      def install
        bin.install "edgedb-cli-5.2.0-dev.1157+1393197" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-5.2.0-dev.1157+ae32377",
        using: :nounzip
      sha256 "8fc050cccfe367ddd10c22477399c101144e1fec50db0d157af4090e7c3f03b6"

      def install
        bin.install "edgedb-cli-5.2.0-dev.1157+ae32377" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
