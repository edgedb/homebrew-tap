class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "4.3.0-dev.1107"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-4.3.0-dev.1107+c7cd952",
        using: :nounzip
      sha256 "23a71e27d9cffb0a94b37e98e9f35e37470eaf0099f7eb6f02560ff965d6d088"

      def install
        bin.install "edgedb-cli-4.3.0-dev.1107+c7cd952" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-4.3.0-dev.1107+dc021bc",
        using: :nounzip
      sha256 "52efefffa5f9368c123752af5c8dc26ad35adb995b5f28c0eacadbbc257b7fd9"

      def install
        bin.install "edgedb-cli-4.3.0-dev.1107+dc021bc" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-4.3.0-dev.1107+0f43181",
        using: :nounzip
      sha256 "d6c503a64607a46a18a3f42b5b453b0c50217874c3a6aeeb5b9e8d99462db4c8"

      def install
        bin.install "edgedb-cli-4.3.0-dev.1107+0f43181" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-4.3.0-dev.1107+6e25a3d",
        using: :nounzip
      sha256 "b8a86d4cac0694bdd9a17a0fb4a8bfe3267a7a05ac0664e322ec2cbb8aa3c373"

      def install
        bin.install "edgedb-cli-4.3.0-dev.1107+6e25a3d" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
