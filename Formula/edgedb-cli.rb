class EdgedbCli < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "5.2.3"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin/edgedb-cli-5.2.3+4559649",
        using: :nounzip
      sha256 "0a4aca3e35ebd6bfbf7cdc96457f3f6c84233e9e3ae90b3783c70d8ce054ea03"

      def install
        bin.install "edgedb-cli-5.2.3+4559649" => "edgedb"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin/edgedb-cli-5.2.3+4559649",
        using: :nounzip
      sha256 "34269cf80ef15e880b984af346d1f53d140965da8f6144bb99dca1ae064f7d49"

      def install
        bin.install "edgedb-cli-5.2.3+4559649" => "edgedb"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl/edgedb-cli-5.2.3+8d5e5aa",
        using: :nounzip
      sha256 "84ea3f02c5856ae5e3ae3f2349d572a41173a525ab550250c21aed188d1c68c8"

      def install
        bin.install "edgedb-cli-5.2.3+8d5e5aa" => "edgedb"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl/edgedb-cli-5.2.3+4559649",
        using: :nounzip
      sha256 "dbdb400ac23cb041ac554a4e982a10e5e1c921cbab6b80278a9403b5499607d1"

      def install
        bin.install "edgedb-cli-5.2.3+4559649" => "edgedb"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb", "--version"
  end
end
