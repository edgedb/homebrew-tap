class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "3.2.0-dev.999"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-3.2.0-dev.999+82b9c5d",
        using: :nounzip
      sha256 "f3b0213f7f9b168ac9e447d16f7e9a0852f0fd61e963554a6d1cbf2371bd1052"

      def install
        bin.install "edgedb-cli-3.2.0-dev.999+82b9c5d" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-3.2.0-dev.999+6e2d82b",
        using: :nounzip
      sha256 "7c456b15b374aba2b84f82b298cf3899df473db26fe25d38331fdf7ddf6408e7"

      def install
        bin.install "edgedb-cli-3.2.0-dev.999+6e2d82b" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-3.2.0-dev.999+7e4e00d",
        using: :nounzip
      sha256 "200a557e582e2f0df7827f6877145006ad1e6211272d0e4d9558fd1c83db30ba"

      def install
        bin.install "edgedb-cli-3.2.0-dev.999+7e4e00d" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-3.2.0-dev.999+18ea3f5",
        using: :nounzip
      sha256 "c96d07b0d31c25a1b130d1a1b68eec11c129c3f78bb88788fc50442adeaf5da7"

      def install
        bin.install "edgedb-cli-3.2.0-dev.999+18ea3f5" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
