class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "4.1.0-dev.1068"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-4.1.0-dev.1068+f388266",
        using: :nounzip
      sha256 "6ae41729b65b64c0086b2627d95e1aaef9e7f3cc1f8fa93712934e5d7d1ff253"

      def install
        bin.install "edgedb-cli-4.1.0-dev.1068+f388266" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-4.1.0-dev.1068+6e671db",
        using: :nounzip
      sha256 "194cabcd3a2aa0c79b1b9c34ee71c008828f699fa29a519d60b20ec6817a4b8b"

      def install
        bin.install "edgedb-cli-4.1.0-dev.1068+6e671db" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-4.1.0-dev.1068+28cf99b",
        using: :nounzip
      sha256 "84a538a3bccce51e9b56a48a030c6353cee9954a744bdc5ec0ba0aa6861fb8db"

      def install
        bin.install "edgedb-cli-4.1.0-dev.1068+28cf99b" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-4.1.0-dev.1068+ceb0919",
        using: :nounzip
      sha256 "5fd0df554973c083128f41d98a028019ba3d658e811c3422e3e42276a8fb982e"

      def install
        bin.install "edgedb-cli-4.1.0-dev.1068+ceb0919" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
