class Wechattweak < Formula
  desc "A command-line tool for tweaking WeChat"
  homepage "https://github.com/tanranv5/WeChatTweak"
  url "https://github.com/tanranv5/WeChatTweak/releases/download/v270100/wechattweak-v270100-macos-universal.tar.gz"
  sha256 "fb0f1964c40544ac1ac3ada684cd5f33ef31c2bfb7acdae9d7bf52cb13d4ca69"
  license "AGPL-3.0"
  version "270100"
  # 微信版本号仍是 270100，只改了 CLI 的输出文案 → 必须递增 revision，否则已装用户不会 brew upgrade。
  # revision 1：重复 patch 时不再显示像报错的 "⚠️ expected 不匹配"，改为"已是补丁状态 → 跳过（正常）"；
  #             vmaddr/fileoff 等调试行改为仅在 WXRT_DEBUG=1 时输出。
  revision 1
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
