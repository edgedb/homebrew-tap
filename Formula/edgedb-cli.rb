class EdgedbCli < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "2.0.5"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin/edgedb-cli-2.0.5+53f9c9b?edgedb.release",
        using: :nounzip
      sha256 "f4391c2f3494f6d622216760718028877255e42130ab467c5fa2bfc7b18513ae"
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin/edgedb-cli-2.0.5+79cc3e1?edgedb.release",
        using: :nounzip
      sha256 "97b8eda26ac2693c10df5c6be6ac8cb077b4102bbfe98c8cbccddf1199203914"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl/edgedb-cli-2.0.5+51050b5?edgedb.release",
        using: :nounzip
      sha256 "01d93ed855d713b07abc86bf0ab6fe9793a4b5a9df8aa0f4aa5cba0c14b1be8f"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl/edgedb-cli-2.0.5+f78cf34?edgedb.release",
        using: :nounzip
      sha256 "bd9c6532e72120c0873268dd926ada5a70c5e7b376a6d687699ca4308479f905"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  def install
    bin.install "edgedb.release" => "edgedb"
  end

  test do
    system "#{bin}/edgedb", "--version"
  end
end
