class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "5.3.0-dev.1176"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-5.3.0-dev.1176+9f01f70",
        using: :nounzip
      sha256 "acd351427751c70ec84ed15322bc1a4e3cb2ba03d038f855c27ea8a29381fa30"

      def install
        bin.install "edgedb-cli-5.3.0-dev.1176+9f01f70" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-5.3.0-dev.1176+9f01f70",
        using: :nounzip
      sha256 "1e579d58089ffb6109345c53eb360e3ae47cf6a30d5019efcc759d59ba8849c7"

      def install
        bin.install "edgedb-cli-5.3.0-dev.1176+9f01f70" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-5.3.0-dev.1176+01457cf",
        using: :nounzip
      sha256 "ad307a12e6f6da5f5eba5008921d4080137b46bd62197030c219ffb647ff98ab"

      def install
        bin.install "edgedb-cli-5.3.0-dev.1176+01457cf" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-5.3.0-dev.1176+9f01f70",
        using: :nounzip
      sha256 "54a4cab69a82c6c043ac5d6cba1d34c2cb9813f5de18c73d32133e2db99f8746"

      def install
        bin.install "edgedb-cli-5.3.0-dev.1176+9f01f70" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
