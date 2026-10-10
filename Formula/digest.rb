class Digest < Formula
  desc "Terminal dashboard for your day-to-day work"
  homepage "https://github.com/AnudeepChPaul/digest"
  url "https://github.com/AnudeepChPaul/digest/archive/refs/tags/v0.0.152.tar.gz"
  sha256 "a39c8055d651da22d4b3ed4e76ff0afa843947758ae146bc8693c7ea436c3979"
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
