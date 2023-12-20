class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "4.1.0-dev.1070"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-4.1.0-dev.1070+acd4979",
        using: :nounzip
      sha256 "718925060e446d7a66ea31e4cb6ca2cd4af010581018cb27ad4bef8076f20274"

      def install
        bin.install "edgedb-cli-4.1.0-dev.1070+acd4979" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-4.1.0-dev.1070+ade225f",
        using: :nounzip
      sha256 "d2d96e1d648951f74f6c9c3d94bf6a7383c3ce9fce0c774552448f7775d728c8"

      def install
        bin.install "edgedb-cli-4.1.0-dev.1070+ade225f" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-4.1.0-dev.1070+9d0472f",
        using: :nounzip
      sha256 "ed9b830607e1bb31ab74f7b7f657f019ae5b85b420b297ebcf87e01a884c3ccb"

      def install
        bin.install "edgedb-cli-4.1.0-dev.1070+9d0472f" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-4.1.0-dev.1070+4e8a653",
        using: :nounzip
      sha256 "a740ee2887b045c231dee2c1c82043aa2c9c7fb0269b9469775862323312d0b7"

      def install
        bin.install "edgedb-cli-4.1.0-dev.1070+4e8a653" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
