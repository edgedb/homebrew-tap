class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "6.2.0-dev.1234"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-6.2.0-dev.1234+a1013ca",
        using: :nounzip
      sha256 "f98b9ac3dc2d1c1e9a39a4e25e10ec7539421b7026bcba80363ab351f0cafae2"

      def install
        bin.install "edgedb-cli-6.2.0-dev.1234+a1013ca" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-6.2.0-dev.1234+a1013ca",
        using: :nounzip
      sha256 "a74b29047df45a871fd5d22f1941e1299782549a0f320c856c57fa0f7c7057cf"

      def install
        bin.install "edgedb-cli-6.2.0-dev.1234+a1013ca" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-6.2.0-dev.1234+08bf72f",
        using: :nounzip
      sha256 "ffea5664b5c4b603ca7c2eb1334524b1ce86e21d96247ca71f6963e9e549d9b7"

      def install
        bin.install "edgedb-cli-6.2.0-dev.1234+08bf72f" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-6.2.0-dev.1234+c977293",
        using: :nounzip
      sha256 "50d86bdd9a0fe3cfb9e2b853d74acc3b318a710d4546258d9e088ec6e897defd"

      def install
        bin.install "edgedb-cli-6.2.0-dev.1234+c977293" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
