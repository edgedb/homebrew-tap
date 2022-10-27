class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "2.1.0-dev.860"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-2.1.0-dev.860+3f90803?edgedb.nightly",
        using: :nounzip
      sha256 "4d01de7decff8ac528460a4680aa1a497ca737793f0b3c5fa4496e9f90d4adc4"
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-2.1.0-dev.860+fdc04e5?edgedb.nightly",
        using: :nounzip
      sha256 "c9bef06fbeb3a9094e817ab41c9a81906e3d8b1ce47cf9cb008da8f55e20635b"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-2.1.0-dev.860+fdc04e5?edgedb.nightly",
        using: :nounzip
      sha256 "aa43f5409199a5457258df5b2ee6e50525947f566a2e40b072042337ad3d0a3c"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-2.1.0-dev.860+b4b45eb?edgedb.nightly",
        using: :nounzip
      sha256 "55445c6c4ab1fce9d6bf496f24817f020d8b87bdde986da5103d9f4bcde35c54"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  def install
    bin.install "edgedb.nightly" => "edgedb-nightly"
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
