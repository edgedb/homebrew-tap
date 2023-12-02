class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "4.1.0-dev.1067"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-4.1.0-dev.1067+ab23017",
        using: :nounzip
      sha256 "991342685d2e19b9a0c5726ed27a27cc8641fb4e025554e060c10caa396c5574"

      def install
        bin.install "edgedb-cli-4.1.0-dev.1067+ab23017" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-4.1.0-dev.1067+10ab98b",
        using: :nounzip
      sha256 "99e64688b1d70a007dbb5b60a0617be3e37806eff3f873739c3391c50f060464"

      def install
        bin.install "edgedb-cli-4.1.0-dev.1067+10ab98b" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-4.1.0-dev.1067+70fcca1",
        using: :nounzip
      sha256 "04a5e671137af202ba0def54bdc0e42f5a7d7e625df324c105d0b5480d532ef8"

      def install
        bin.install "edgedb-cli-4.1.0-dev.1067+70fcca1" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-4.1.0-dev.1067+e241994",
        using: :nounzip
      sha256 "45e73b1c438f388b5b43c72cca2666bdcbb290fb831a9fb4d39b8004f9a0ff95"

      def install
        bin.install "edgedb-cli-4.1.0-dev.1067+e241994" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
