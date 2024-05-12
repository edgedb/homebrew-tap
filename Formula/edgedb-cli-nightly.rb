class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "5.2.0-dev.1156"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-5.2.0-dev.1156+736525f",
        using: :nounzip
      sha256 "0cdcc5bb7ffc2cbda18a476489e56e43f3ce8f6189068796ca29b82625381315"

      def install
        bin.install "edgedb-cli-5.2.0-dev.1156+736525f" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-5.2.0-dev.1156+2591e0f",
        using: :nounzip
      sha256 "8dab257469465de43b7bc197e4c719044ecbf53b18936ee276e3dbd094a92823"

      def install
        bin.install "edgedb-cli-5.2.0-dev.1156+2591e0f" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-5.2.0-dev.1156+3156fc9",
        using: :nounzip
      sha256 "e7a2877c6f57d20c0a2c87f78f98dffc9041f927aa4c8bd61cac04f86b07ff92"

      def install
        bin.install "edgedb-cli-5.2.0-dev.1156+3156fc9" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-5.2.0-dev.1156+5cebd63",
        using: :nounzip
      sha256 "64c683577e970430ba3fce3979481ce651139835697d49178fcb008623a3fb62"

      def install
        bin.install "edgedb-cli-5.2.0-dev.1156+5cebd63" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
