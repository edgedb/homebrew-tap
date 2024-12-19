class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "6.2.0-dev.1232"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-6.2.0-dev.1232+0792276",
        using: :nounzip
      sha256 "54af783c89e942052794623ac85279a7c0e9ebe23dd26ec722ac2b55f8d3fb37"

      def install
        bin.install "edgedb-cli-6.2.0-dev.1232+0792276" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-6.2.0-dev.1232+05bd7a1",
        using: :nounzip
      sha256 "56b86f0a20f84191dea1494f2483a7aa1ab3a29e58f004d4218802258cd9fd04"

      def install
        bin.install "edgedb-cli-6.2.0-dev.1232+05bd7a1" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-6.2.0-dev.1232+5d9f9ef",
        using: :nounzip
      sha256 "abe343ca47a0df0419ef1583ed30be1731bcf891b07b8c2cfcd54b3d3ebbc42c"

      def install
        bin.install "edgedb-cli-6.2.0-dev.1232+5d9f9ef" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-6.2.0-dev.1232+e1eee9f",
        using: :nounzip
      sha256 "f892597360119ca2d9901d6750c50f8b9a491516de8b088616493956e6cdb609"

      def install
        bin.install "edgedb-cli-6.2.0-dev.1232+e1eee9f" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
