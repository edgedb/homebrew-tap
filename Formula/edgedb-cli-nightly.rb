class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "4.2.0-dev.1082"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-4.2.0-dev.1082+6c2650f",
        using: :nounzip
      sha256 "286dcd61b07cfbc4f010c60268b96a6b59216f1ea6ddb78129040b8b4c5b3a52"

      def install
        bin.install "edgedb-cli-4.2.0-dev.1082+6c2650f" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-4.2.0-dev.1082+7ea5dd0",
        using: :nounzip
      sha256 "b5342653259125addea59e31104caa1cb277a3361de9de2bca6e09f1bebf0e29"

      def install
        bin.install "edgedb-cli-4.2.0-dev.1082+7ea5dd0" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-4.2.0-dev.1082+e53733b",
        using: :nounzip
      sha256 "7464c462dc1d942661fdf02269a636cb2be0346090a137664ab2f49aff831ef0"

      def install
        bin.install "edgedb-cli-4.2.0-dev.1082+e53733b" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-4.2.0-dev.1082+6c2650f",
        using: :nounzip
      sha256 "292eb1e3f69598937f227cba405f812000f0bbe31ec7f3dfed7f153bce2f9e65"

      def install
        bin.install "edgedb-cli-4.2.0-dev.1082+6c2650f" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
