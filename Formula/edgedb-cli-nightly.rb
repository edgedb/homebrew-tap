class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "5.1.0-dev.1147"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-5.1.0-dev.1147+98c9363",
        using: :nounzip
      sha256 "268ea8aec8151d4dbe0b9af9317994a0529246fc6ef3694a7c9081f6986a3cf7"

      def install
        bin.install "edgedb-cli-5.1.0-dev.1147+98c9363" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-5.1.0-dev.1147+98c9363",
        using: :nounzip
      sha256 "39b0ffe2063cb60a6a39498828a8ee90618ed21c9fbd694b76d78eda885e4e00"

      def install
        bin.install "edgedb-cli-5.1.0-dev.1147+98c9363" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-5.1.0-dev.1147+6f00d48",
        using: :nounzip
      sha256 "3ea0168bb27cbe0b04fded6df77e1697e4fcd6eef45d519469426251fdd4b73d"

      def install
        bin.install "edgedb-cli-5.1.0-dev.1147+6f00d48" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-5.1.0-dev.1147+0646d07",
        using: :nounzip
      sha256 "4cc002fc8503163a2df396c2253bfd46be8bbd4aecf69ac40cb5311a1114ca4d"

      def install
        bin.install "edgedb-cli-5.1.0-dev.1147+0646d07" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
