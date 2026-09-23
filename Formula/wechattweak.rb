class Wechattweak < Formula
  desc "A command-line tool for tweaking WeChat"
  homepage "https://github.com/tanranv5/WeChatTweak"
  url "https://github.com/tanranv5/WeChatTweak/releases/download/v270100/wechattweak-v270100-macos-universal.tar.gz"
  sha256 "8a1b225d1d4cd4344afc2154183561ff3be16c03e5351f4dcfb46648ebb8d708"
  license "AGPL-3.0"
  version "270100"
  # 版本号从 270098 升到 270100（支持 WeChat 4.1.15 build 270100）→ 版本本身变化即可触发
  # brew upgrade，所以 revision 归零（不再需要 revision）。
  #
  # 历史 revision：2 = 修重签写坏嵌套 entitlements（小程序打不开）；
  #              3 = 屏蔽自动更新改为默认开启 + 新增 --no-block-update。

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
