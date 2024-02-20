class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "4.2.0-dev.1088"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-4.2.0-dev.1088+0d857e0",
        using: :nounzip
      sha256 "ee6769fa118d36b1fd536d3c192ab40f0f7f73b53193860a693bfa64a216616f"

      def install
        bin.install "edgedb-cli-4.2.0-dev.1088+0d857e0" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-4.2.0-dev.1088+e76ff52",
        using: :nounzip
      sha256 "c7fca0aee60e4e65c08a3689fe9747105eaa945ab9d28a51d8c8ba9bbe0cebe3"

      def install
        bin.install "edgedb-cli-4.2.0-dev.1088+e76ff52" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-4.2.0-dev.1088+efea949",
        using: :nounzip
      sha256 "d796218275a227cdf2747f10206b95429517a06ca386abef906dba483253203f"

      def install
        bin.install "edgedb-cli-4.2.0-dev.1088+efea949" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-4.2.0-dev.1088+d131da9",
        using: :nounzip
      sha256 "58b8771e6edac2b0b3f6554873e6b450d83748e8a80558a9e385b131583b751a"

      def install
        bin.install "edgedb-cli-4.2.0-dev.1088+d131da9" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
