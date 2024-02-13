class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "4.2.0-dev.1082"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-4.2.0-dev.1082+ae196a0",
        using: :nounzip
      sha256 "63d800a8f96b880e4001799170f1fdea63990633aade868a5703a3395c0d60d6"

      def install
        bin.install "edgedb-cli-4.2.0-dev.1082+ae196a0" => "edgedb-nightly"
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
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-4.2.0-dev.1082+fe3dbd8",
        using: :nounzip
      sha256 "48ff2d41b13884d429f49c224c052d586a97fc505bb14c052b0debe6c9d031d0"

      def install
        bin.install "edgedb-cli-4.2.0-dev.1082+fe3dbd8" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
