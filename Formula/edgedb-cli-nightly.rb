class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "3.2.0-dev.1003"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-3.2.0-dev.1003+00a954a",
        using: :nounzip
      sha256 "060e9fc5dde29f32738b881e912a5afda85b932a3eb52a6afc602ee49cc95b6e"

      def install
        bin.install "edgedb-cli-3.2.0-dev.1003+00a954a" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-3.2.0-dev.1003+14d1619",
        using: :nounzip
      sha256 "1f7f9fcfa3d84a5d1143c3ba061519e01b1318ee3b5447e3f76de6a423e0316d"

      def install
        bin.install "edgedb-cli-3.2.0-dev.1003+14d1619" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-3.2.0-dev.1003+29876ae",
        using: :nounzip
      sha256 "d1bbb6e5f08152b2ca4f549fd5356a2bef6ba303f2c0ebc2f2b0d9a4c27e327d"

      def install
        bin.install "edgedb-cli-3.2.0-dev.1003+29876ae" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-3.2.0-dev.1003+4a01837",
        using: :nounzip
      sha256 "d0f6366b5b7abc84c2a451c728502a035e9593e8a064d770cd7c87bc16d64099"

      def install
        bin.install "edgedb-cli-3.2.0-dev.1003+4a01837" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
