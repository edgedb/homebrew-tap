class EdgedbCli < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "3.4.0"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin/edgedb-cli-3.4.0+4d95a2c",
        using: :nounzip
      sha256 "cafc10e02f88c747a1118eab483140a7fd838feb6ecfa1c6697c721a3e13efbf"

      def install
        bin.install "edgedb-cli-3.4.0+4d95a2c" => "edgedb"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin/edgedb-cli-3.4.0+97cad0e",
        using: :nounzip
      sha256 "d5d395f73a58e95f0f487ada3a37d05be6d85dc208ddbabd2e1a6633dc9776ad"

      def install
        bin.install "edgedb-cli-3.4.0+97cad0e" => "edgedb"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl/edgedb-cli-3.4.0+15c5e18",
        using: :nounzip
      sha256 "3390de3f364fc09187bad21e66dd78d5799990c016681f5a7c3d18596b9ee057"

      def install
        bin.install "edgedb-cli-3.4.0+15c5e18" => "edgedb"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl/edgedb-cli-3.4.0+160d07d",
        using: :nounzip
      sha256 "c470fa871f64469a585658768241422faceb19a94f54527b8f05553df673da95"

      def install
        bin.install "edgedb-cli-3.4.0+160d07d" => "edgedb"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb", "--version"
  end
end
