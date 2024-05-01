class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "5.2.0-dev.1153"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-5.2.0-dev.1153+93311cf",
        using: :nounzip
      sha256 "5854f98657fcdb3bc20ad679c8e998695a300233f2a18c3c93d8a870983ab8bb"

      def install
        bin.install "edgedb-cli-5.2.0-dev.1153+93311cf" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-5.2.0-dev.1153+93311cf",
        using: :nounzip
      sha256 "4abff25758f87b5c4561087591a18531a33bcdafd3e225fb17143007158c9a73"

      def install
        bin.install "edgedb-cli-5.2.0-dev.1153+93311cf" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-5.2.0-dev.1153+1c6c21d",
        using: :nounzip
      sha256 "ee0e89ed1e393cc52646c20ba0a3900ac95e3600e9e50d3a5db0348ade272fef"

      def install
        bin.install "edgedb-cli-5.2.0-dev.1153+1c6c21d" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-5.2.0-dev.1153+bf9a744",
        using: :nounzip
      sha256 "23a48607b2b3ad88cdcb17daa42da4e4b8ba7488bf233622f482b4f3d82cdba6"

      def install
        bin.install "edgedb-cli-5.2.0-dev.1153+bf9a744" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
