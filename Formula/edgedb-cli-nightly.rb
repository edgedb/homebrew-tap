class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "3.0.0-dev.979"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-3.0.0-dev.979+44e8134",
        using: :nounzip
      sha256 "a0f3e1b522ea9f1f712f4480f197ca4fa526416573729692535312c883fd3f91"

      def install
        bin.install "edgedb-cli-3.0.0-dev.979+44e8134" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-3.0.0-dev.979+35bf4f4",
        using: :nounzip
      sha256 "fd1ee02df73a8ce60d70b9004d9e24062e3848850df5aa124bd364e4d13dba33"

      def install
        bin.install "edgedb-cli-3.0.0-dev.979+35bf4f4" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-3.0.0-dev.979+131588b",
        using: :nounzip
      sha256 "5e68580281fb7e0a51774aa46441631c1494dddbaabd4d274c7377858b924a19"

      def install
        bin.install "edgedb-cli-3.0.0-dev.979+131588b" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-3.0.0-dev.979+4666c49",
        using: :nounzip
      sha256 "94c69c046b45f0b708eaf30242907f191f0734f1403538b85492f8df1b24ec6a"

      def install
        bin.install "edgedb-cli-3.0.0-dev.979+4666c49" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
