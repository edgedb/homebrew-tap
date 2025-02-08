class EdgedbCli < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "6.1.1"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin/edgedb-cli-6.1.1+437541a",
        using: :nounzip
      sha256 "7ad856e8023595e1d4fc7d0dfbac63939a84dfd2eca2ac043d16bfb8c598bc14"

      def install
        bin.install "edgedb-cli-6.1.1+437541a" => "edgedb"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin/edgedb-cli-6.1.1+437541a",
        using: :nounzip
      sha256 "7983719db2fcea639094fff2ad159d538767dc75f4e774d82a8276e0b26ae02d"

      def install
        bin.install "edgedb-cli-6.1.1+437541a" => "edgedb"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl/edgedb-cli-6.1.1+b8ebf1f",
        using: :nounzip
      sha256 "553c2fc172663a80dff388621db2a1e4008ead35546d82895973ce259f3638f6"

      def install
        bin.install "edgedb-cli-6.1.1+b8ebf1f" => "edgedb"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl/edgedb-cli-6.1.1+8e687e8",
        using: :nounzip
      sha256 "240c36272cb104433eb9352a41ae3bd500e2781e52a0d44e492c7c7427840f34"

      def install
        bin.install "edgedb-cli-6.1.1+8e687e8" => "edgedb"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb", "--version"
  end
end
