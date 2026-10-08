class Digest < Formula
  desc "Terminal dashboard for your day-to-day work"
  homepage "https://github.com/AnudeepChPaul/digest"
  url "https://github.com/AnudeepChPaul/digest/archive/refs/tags/v1.2.5.tar.gz"
  sha256 "d4fb3da3cb2b7b41f9bc969f22ff1a5a2cb7c52a72938ca5425da1188066f9d6"
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
