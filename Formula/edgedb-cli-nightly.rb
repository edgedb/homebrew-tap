class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "6.2.0-dev.1233"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-6.2.0-dev.1233+c47b5cd",
        using: :nounzip
      sha256 "74336bf1cb3907a3a7cccf148a46d3eab1c1ccc8f966595957c362f7679c8445"

      def install
        bin.install "edgedb-cli-6.2.0-dev.1233+c47b5cd" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-6.2.0-dev.1233+c47b5cd",
        using: :nounzip
      sha256 "25a0bdd52246defcc8549e3ae4abc9a370a66364eb34ff671d7e4bec2a9bf60a"

      def install
        bin.install "edgedb-cli-6.2.0-dev.1233+c47b5cd" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-6.2.0-dev.1233+2957734",
        using: :nounzip
      sha256 "ba55ce31f66e11840c669d4eaa6633375270c80c62e74de849e4e68966261904"

      def install
        bin.install "edgedb-cli-6.2.0-dev.1233+2957734" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-6.2.0-dev.1233+323d223",
        using: :nounzip
      sha256 "7ca3e01d3015b9fdb2bca8f0c681635eb80fb45b3fd3599bee7f15e609da1327"

      def install
        bin.install "edgedb-cli-6.2.0-dev.1233+323d223" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
