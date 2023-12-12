class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "4.1.0-dev.1069"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-4.1.0-dev.1069+7fade1a",
        using: :nounzip
      sha256 "a512a76b131bc2d8311666e5c35f8d72852ccee8bf93e4b41ce8baffb14876d6"

      def install
        bin.install "edgedb-cli-4.1.0-dev.1069+7fade1a" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-4.1.0-dev.1069+177e986",
        using: :nounzip
      sha256 "e94351549faa624932578c7006a1bf3e4e9fd3e097f29e1cdf1e0124a6767d1b"

      def install
        bin.install "edgedb-cli-4.1.0-dev.1069+177e986" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-4.1.0-dev.1069+5013a54",
        using: :nounzip
      sha256 "16cf942c231c5390018f7467c3d866d6fd91d3eec3c82cddf0f1f6586022d852"

      def install
        bin.install "edgedb-cli-4.1.0-dev.1069+5013a54" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-4.1.0-dev.1069+f9c9415",
        using: :nounzip
      sha256 "36c9e98815d0533411d7a92dc7cb16380d8d65a59ea2889805d8c1938f7ad0f0"

      def install
        bin.install "edgedb-cli-4.1.0-dev.1069+f9c9415" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
