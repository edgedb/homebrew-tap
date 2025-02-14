class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "6.2.0-dev.1263"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-6.2.0-dev.1263+e9e255e",
        using: :nounzip
      sha256 "e1ea58d3e1d0e6f97ba0014750d9ec67b09d629084af05922d8028ec59d0a776"

      def install
        bin.install "edgedb-cli-6.2.0-dev.1263+e9e255e" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-6.2.0-dev.1263+e9e255e",
        using: :nounzip
      sha256 "0243c5a33b653c8a6d5b6394b9ab641d12285b600071df042952a1e56cecab64"

      def install
        bin.install "edgedb-cli-6.2.0-dev.1263+e9e255e" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-6.2.0-dev.1263+c94186e",
        using: :nounzip
      sha256 "e286c931d0fca49f7f389b569ecebafaff4a0067362dc5c86b3330915c09d011"

      def install
        bin.install "edgedb-cli-6.2.0-dev.1263+c94186e" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-6.2.0-dev.1263+d24c0c3",
        using: :nounzip
      sha256 "f6ed47d90eac635c2e9ae932426ec40bffc6d00a17cae6ca6632accdf87a3f4e"

      def install
        bin.install "edgedb-cli-6.2.0-dev.1263+d24c0c3" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
