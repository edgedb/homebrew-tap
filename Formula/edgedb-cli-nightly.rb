class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "4.0.0-dev.1044"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-4.0.0-dev.1044+580e437",
        using: :nounzip
      sha256 "6576a6accbc875a1132ade7f7d0f6824565167833b76e5e31970c577cc80e091"

      def install
        bin.install "edgedb-cli-4.0.0-dev.1044+580e437" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-4.0.0-dev.1044+f035537",
        using: :nounzip
      sha256 "cde0700066d0449ec4b5b6b1752b1ff17fe7dc0a63ad2441a7c6ecf48e0c4b2d"

      def install
        bin.install "edgedb-cli-4.0.0-dev.1044+f035537" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-4.0.0-dev.1044+b73c7f4",
        using: :nounzip
      sha256 "853378f3f7e52444a0627ce18a0b74657a2077f147be6cb1a0b2453134762d28"

      def install
        bin.install "edgedb-cli-4.0.0-dev.1044+b73c7f4" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-4.0.0-dev.1044+0c4c8e0",
        using: :nounzip
      sha256 "49f42f741093d37f884069b62d50cb40613e8c6f8d22f854daae6903f192db86"

      def install
        bin.install "edgedb-cli-4.0.0-dev.1044+0c4c8e0" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
