class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "6.2.0-dev.1255"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-6.2.0-dev.1255+33edad8",
        using: :nounzip
      sha256 "0a41f1cc13c9addc5b8a41ab1d7341c5e550b483f53fea2eea6e34486f4c160c"

      def install
        bin.install "edgedb-cli-6.2.0-dev.1255+33edad8" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-6.2.0-dev.1255+33edad8",
        using: :nounzip
      sha256 "5151641c2efec8df0054ef52e1408ae350369e53b62a93324e4d0892d2062695"

      def install
        bin.install "edgedb-cli-6.2.0-dev.1255+33edad8" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-6.2.0-dev.1255+23fa0ec",
        using: :nounzip
      sha256 "0359a502307d49bebd018e5eaeef2127f05bc0bc4050c3c7568df80f299f25cb"

      def install
        bin.install "edgedb-cli-6.2.0-dev.1255+23fa0ec" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-6.2.0-dev.1255+9419d6b",
        using: :nounzip
      sha256 "0a9fcf382d6bee6d9cef998594cbb8336ce364673b4ed53d252ea260bfa55e6e"

      def install
        bin.install "edgedb-cli-6.2.0-dev.1255+9419d6b" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
