class EdgedbCli < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "2.3.0"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin/edgedb-cli-2.3.0+c4d9e41?edgedb.release",
        using: :nounzip
      sha256 "d768014feffa4a7d3ea89446ac8744207bdc713e32cb6042604cd7e087c74e93"
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin/edgedb-cli-2.3.0+c4d9e41?edgedb.release",
        using: :nounzip
      sha256 "8dc1baa64ab5aba5a5a2cf787a671b524c2bc048ec04ac5fe4c4aea98d94fffc"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl/edgedb-cli-2.3.0+a8d47a2?edgedb.release",
        using: :nounzip
      sha256 "9cf5b3dcc7f3a5a32e6f6c7f9884707aa3a136ecce82a61fe30b2cd5319f421b"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl/edgedb-cli-2.3.0+51640c8?edgedb.release",
        using: :nounzip
      sha256 "00c17adf51809ef5b90541c82df819b860521a608666a2df7b4234c3ff5bcbb0"
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
