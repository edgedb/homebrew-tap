class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "4.1.0-dev.1064"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-4.1.0-dev.1064+26c50b3",
        using: :nounzip
      sha256 "c2d83b4396e1bd3dcc5a65b44f2b0a202fe0e9dc48d0ab1db82deb1fd770d399"

      def install
        bin.install "edgedb-cli-4.1.0-dev.1064+26c50b3" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-4.1.0-dev.1064+c0b1740",
        using: :nounzip
      sha256 "a145cf26303bbc2ef031d4f930073d8205d5cc17d41c080db77beabaf0e44e20"

      def install
        bin.install "edgedb-cli-4.1.0-dev.1064+c0b1740" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-4.1.0-dev.1064+5e0c785",
        using: :nounzip
      sha256 "f895badf8121da7c0b122f33a0767ff21748161669176c41904097dbe9280237"

      def install
        bin.install "edgedb-cli-4.1.0-dev.1064+5e0c785" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-4.1.0-dev.1064+190a209",
        using: :nounzip
      sha256 "02ce75e8d33d04943a1f81c8ec3282b983acf3720b134588b85ca0cbe1ba994d"

      def install
        bin.install "edgedb-cli-4.1.0-dev.1064+190a209" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
