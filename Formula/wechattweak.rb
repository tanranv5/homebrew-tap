class Wechattweak < Formula
  desc "A command-line tool for tweaking WeChat"
  homepage "https://github.com/tanranv5/WeChatTweak"
  url "https://github.com/tanranv5/WeChatTweak/releases/download/v270098/wechattweak-v270098-macos-universal.tar.gz"
  sha256 "575fa1f4691453c42cafbf08576e5c7e97362a22302034161c1cf5b0c2069e7f"
  license "AGPL-3.0"
  version "270098"
  # 微信版本号没变、只是包内容更新（新增 restore / --block-update）。
  # 不加 revision 的话 brew 认为版本相同不会升级，已装用户拿不到新 CLI。
  revision 1

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
