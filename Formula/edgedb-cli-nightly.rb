class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "3.0.0-dev.925"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-3.0.0-dev.925+f9a86e4?edgedb.nightly",
        using: :nounzip
      sha256 "813ba0d8176bf4ec06723874c469f1c812e3b79b154eb17ac65ddca987e81de9"
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-3.0.0-dev.925+ace26d4?edgedb.nightly",
        using: :nounzip
      sha256 "f3a031fe9224ff0a967bb9f82798e744ca6eebfb160e86777fd65a0ae3417686"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-3.0.0-dev.925+cb79a54?edgedb.nightly",
        using: :nounzip
      sha256 "38e4b2f35b1dd249970c9c7b80ce1cfc203a00a13cfcd69fef394a5070806b33"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-3.0.0-dev.925+b9ac412?edgedb.nightly",
        using: :nounzip
      sha256 "360080a04888f95fad2238c56b7355c95a0ec7b6ccba117fbfc507ff19f958c4"
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
