class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "5.1.0-dev.1149"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-5.1.0-dev.1149+f04edd4",
        using: :nounzip
      sha256 "7fde1809c31a48c68c8c1687de69104b0aaf2e620dac74f0d05a03751a9e4836"

      def install
        bin.install "edgedb-cli-5.1.0-dev.1149+f04edd4" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-5.1.0-dev.1149+f04edd4",
        using: :nounzip
      sha256 "7eb0328f18017cefc296f98aa849f861c4a2139ca7e09d4b7b917c7215375af5"

      def install
        bin.install "edgedb-cli-5.1.0-dev.1149+f04edd4" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-5.1.0-dev.1149+18b6b5f",
        using: :nounzip
      sha256 "55b1b967986ff79b54b7c57b6820048221ef0948760a03f8bccc650f760a0274"

      def install
        bin.install "edgedb-cli-5.1.0-dev.1149+18b6b5f" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-5.1.0-dev.1149+691a90f",
        using: :nounzip
      sha256 "1b00b938cb15846800b38ba8af873c4c9dae26f97052edcee6529fe3d822bf59"

      def install
        bin.install "edgedb-cli-5.1.0-dev.1149+691a90f" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
