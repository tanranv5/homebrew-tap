class Wechattweak < Formula
  desc "A command-line tool for tweaking WeChat"
  homepage "https://github.com/tanranv5/WeChatTweak"
  url "https://github.com/tanranv5/WeChatTweak/releases/download/v270098/wechattweak-v270098-macos-universal.tar.gz"
  sha256 "fd90fa9934359948bede37b6077e62ae0554a931d0bfd574fb19386077656c99"
  license "AGPL-3.0"
  version "270098"

  def install
    bin.install "wechattweak"
    # 撤回提示运行时组件（wechattweak patch --tip 需要）。
    # 装到 libexec；wechattweak 会沿 Cellar 定位到 <keg>/libexec。
    libexec.install "libwxrevoketip.dylib", "add_load_dylib.py"
  end

  test do
    assert_match "A command-line tool for tweaking WeChat", shell_output("#{bin}/wechattweak --help")
  end
end
