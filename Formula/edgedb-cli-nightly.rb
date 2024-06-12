class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "5.2.0-dev.1166"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-5.2.0-dev.1166+b5e9df3",
        using: :nounzip
      sha256 "ee62bab103e7f0550b72538e37b10085d80894492b5a2acad1b026c72e0968ce"

      def install
        bin.install "edgedb-cli-5.2.0-dev.1166+b5e9df3" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-5.2.0-dev.1166+b5e9df3",
        using: :nounzip
      sha256 "908808c3d70c6b2e88360dc05c9d0e510bc8e7b78a9d4f54869647aac3635e54"

      def install
        bin.install "edgedb-cli-5.2.0-dev.1166+b5e9df3" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-5.2.0-dev.1166+c3d3d27",
        using: :nounzip
      sha256 "517b499736e784d52e9c2f38600bb69ef17d70eeac5645998ef2ae21544cc1d3"

      def install
        bin.install "edgedb-cli-5.2.0-dev.1166+c3d3d27" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-5.2.0-dev.1166+bdfc5ca",
        using: :nounzip
      sha256 "581e75e8b12b9faac3b8572c8fc25cc9a65bfc22291179dd5a8db0c3804edbad"

      def install
        bin.install "edgedb-cli-5.2.0-dev.1166+bdfc5ca" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
