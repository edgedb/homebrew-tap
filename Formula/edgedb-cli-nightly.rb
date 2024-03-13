class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "4.3.0-dev.1108"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-4.3.0-dev.1108+deed0a2",
        using: :nounzip
      sha256 "82044c044b3679c7847ce1fdd912cad3b6d446afadfb8911581209e98a0e3033"

      def install
        bin.install "edgedb-cli-4.3.0-dev.1108+deed0a2" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-4.3.0-dev.1108+55dbc56",
        using: :nounzip
      sha256 "464c9136000dfec61826ff0f072a68685c92135154062c294ef8f091aea7fadb"

      def install
        bin.install "edgedb-cli-4.3.0-dev.1108+55dbc56" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-4.3.0-dev.1108+34a6f23",
        using: :nounzip
      sha256 "fd796c1ba2aae3801adc6eb91fad0427e81e2adf7967fcac7ddb8d4d8544de67"

      def install
        bin.install "edgedb-cli-4.3.0-dev.1108+34a6f23" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-4.3.0-dev.1108+87ab61b",
        using: :nounzip
      sha256 "c642ba96982127c1f79abd3108c87dc1e999ba0cc59259f5d63effbc273da83c"

      def install
        bin.install "edgedb-cli-4.3.0-dev.1108+87ab61b" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
