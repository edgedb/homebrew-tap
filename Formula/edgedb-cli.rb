class EdgedbCli < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "4.0.2"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin/edgedb-cli-4.0.2+500be79",
        using: :nounzip
      sha256 "362b4f8ed73e72d03f0ccca9d65e435a96473ca55313c0cec5d119777a0d56f4"

      def install
        bin.install "edgedb-cli-4.0.2+500be79" => "edgedb"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin/edgedb-cli-4.0.2+da2788e",
        using: :nounzip
      sha256 "ffb6a3490b6087706ab2376ead18c224c1d98207787ee6bb665edb33769f6330"

      def install
        bin.install "edgedb-cli-4.0.2+da2788e" => "edgedb"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl/edgedb-cli-4.0.2+6d63edc",
        using: :nounzip
      sha256 "4a3bd777bfd7c987cfdc3de88123f11257a20d1be09e6ed00acf152c25ed0e23"

      def install
        bin.install "edgedb-cli-4.0.2+6d63edc" => "edgedb"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl/edgedb-cli-4.0.2+be1da73",
        using: :nounzip
      sha256 "c7759a78298b10064178cddb31cfe2ef005513efd36b706ad2eae5fdd08bd2a0"

      def install
        bin.install "edgedb-cli-4.0.2+be1da73" => "edgedb"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb", "--version"
  end
end
