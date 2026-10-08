class Digest < Formula
  desc "Terminal dashboard for your day-to-day work"
  homepage "https://github.com/AnudeepChPaul/digest"
  url "https://github.com/AnudeepChPaul/digest/archive/refs/tags/v1.1.56.tar.gz"
  sha256 "bc997b59ee51173e31d28a70fbd78db493a5cc499b69080d7728f9cb28422d88"
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
