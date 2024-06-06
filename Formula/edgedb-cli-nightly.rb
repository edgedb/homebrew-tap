class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "5.2.0-dev.1164"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-5.2.0-dev.1164+642623a",
        using: :nounzip
      sha256 "eb8e95a151c54e47428ee0fa6f744529a1504e809eaa15784bc720b0bb7c1da3"

      def install
        bin.install "edgedb-cli-5.2.0-dev.1164+642623a" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-5.2.0-dev.1164+642623a",
        using: :nounzip
      sha256 "317fc3bef35ee37384db05d78bdd89e327eb77119be7b705e4c12c8ecd6ec8f5"

      def install
        bin.install "edgedb-cli-5.2.0-dev.1164+642623a" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-5.2.0-dev.1164+d17f757",
        using: :nounzip
      sha256 "4cf50b6e99701b6535b78bec25c2388b4e211ed4272a509036855c5ef4d1b776"

      def install
        bin.install "edgedb-cli-5.2.0-dev.1164+d17f757" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-5.2.0-dev.1164+642623a",
        using: :nounzip
      sha256 "f693d07a241eb91bf87cf20e394a9cbb5915fe42a4312d24ceb81f4a4524b1b5"

      def install
        bin.install "edgedb-cli-5.2.0-dev.1164+642623a" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
