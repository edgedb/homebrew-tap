class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "5.2.0-dev.1155"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-5.2.0-dev.1155+989ee09",
        using: :nounzip
      sha256 "7c646b533304c718c24c4749cc461a2f6366ac1d002e7fef2f855e1ea1fe1bb5"

      def install
        bin.install "edgedb-cli-5.2.0-dev.1155+989ee09" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-5.2.0-dev.1155+989ee09",
        using: :nounzip
      sha256 "f1df411ff8ba513cc37934798c54fe4fc084a1cb5bbc853147c0d8ef358ef2d0"

      def install
        bin.install "edgedb-cli-5.2.0-dev.1155+989ee09" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-5.2.0-dev.1155+f1aeb6f",
        using: :nounzip
      sha256 "9204605ca3e2ae973b366f8a322657cd7838c9c7405423fcc0bf1711b6b11b84"

      def install
        bin.install "edgedb-cli-5.2.0-dev.1155+f1aeb6f" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-5.2.0-dev.1155+03c12f1",
        using: :nounzip
      sha256 "e10f49d1b022e0d5b5f70b7e962ed650bc006c03da51f523c318a59780ac447f"

      def install
        bin.install "edgedb-cli-5.2.0-dev.1155+03c12f1" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
