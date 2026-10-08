class Digest < Formula
  desc "Terminal dashboard for your day-to-day work"
  homepage "https://github.com/AnudeepChPaul/digest"
  url "https://github.com/AnudeepChPaul/digest/archive/refs/tags/v1.2.1.tar.gz"
  sha256 "27702b7e1c5d1e07a262118f09b5ba8076615457c084ed68ad5e9bfed6952f8a"
  license "MIT"
  head "https://github.com/AnudeepChPaul/digest.git", branch: "main"

  depends_on "go" => :build
  depends_on :macos
  depends_on "terminal-notifier"

  def install
    ldflags = "-X github.com/AnudeepChPaul/digest/pkg/tui.appVersion=#{version}"
    system "go", "build", *std_go_args(ldflags:), "./cmd/digest"
  end

  test do
    assert_match "install", shell_output("#{bin}/digest --help 2>&1")
  end
end
