class EdgedbCli < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "5.5.1"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin/edgedb-cli-5.5.1+cc9315a",
        using: :nounzip
      sha256 "5f7a7b4fcb28b057b2dd69528ed7d863db5e9c72e90a9ad6df0186fa791ad900"

      def install
        bin.install "edgedb-cli-5.5.1+cc9315a" => "edgedb"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin/edgedb-cli-5.5.1+cc9315a",
        using: :nounzip
      sha256 "4ff5784f7baf59dfd3b4d72c3614295fd328faa9292029cfc4bbd85bd25e5761"

      def install
        bin.install "edgedb-cli-5.5.1+cc9315a" => "edgedb"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl/edgedb-cli-5.5.1+537d4ef",
        using: :nounzip
      sha256 "a29d852f4039de38e4e9a80551c1ac17271e85f895cce2035a5f936aa7c064cf"

      def install
        bin.install "edgedb-cli-5.5.1+537d4ef" => "edgedb"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl/edgedb-cli-5.5.1+cc9315a",
        using: :nounzip
      sha256 "6c395e392722dd33bdcd8ac04b4ba2091698600ed3b2144e3c52787f634ce559"

      def install
        bin.install "edgedb-cli-5.5.1+cc9315a" => "edgedb"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb", "--version"
  end
end
