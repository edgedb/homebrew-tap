class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "3.6.0-dev.1035"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-3.6.0-dev.1035+ea85aad",
        using: :nounzip
      sha256 "518b48940549d358d2a9e97a36926df96855b295a1caf4602f6e994837712487"

      def install
        bin.install "edgedb-cli-3.6.0-dev.1035+ea85aad" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-3.6.0-dev.1035+6793e25",
        using: :nounzip
      sha256 "fd5eebf195f60032573a4c249a2b850683ac06f44af8c2105ada541286e49642"

      def install
        bin.install "edgedb-cli-3.6.0-dev.1035+6793e25" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-3.6.0-dev.1035+7efb8a5",
        using: :nounzip
      sha256 "1d6f3f9dfd13851e2fe94149965cad94736d0a9271cb3f26a3a2192e8943db3e"

      def install
        bin.install "edgedb-cli-3.6.0-dev.1035+7efb8a5" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-3.6.0-dev.1035+de6b580",
        using: :nounzip
      sha256 "4d4dc287ddad37e348faeb384270772fcd9af2b22cea57b06e4acaff562ef4f5"

      def install
        bin.install "edgedb-cli-3.6.0-dev.1035+de6b580" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
