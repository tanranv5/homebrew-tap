class Wechattweak < Formula
  desc "A command-line tool for tweaking WeChat"
  homepage "https://github.com/tanranv5/WeChatTweak"
  url "https://github.com/tanranv5/WeChatTweak/releases/download/v36559.1/wechattweak-v36559.1-macos-universal.tar.gz"
  sha256 "f602077b6e0a6714f3bb46f0948cae600ef7afb48d0cef801c2166c6d86c4082"
  license "AGPL-3.0"
  version "36559.1"

  def install
    bin.install "wechattweak"
  end

  test do
    assert_match "A command-line tool for tweaking WeChat", shell_output("#{bin}/wechattweak --help")
  end
end
