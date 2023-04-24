class Bld < Formula
  desc "Open-source build tool for the RIFE2 Java web framework"
  homepage "https://rife2.com"
  url "https://repo.rife2.com/releases/com/uwyn/rife2/rife2/1.6.1/rife2-1.6.1-bld.zip"
  sha256 "2ce8b1b5db3798c20fcf5c822da96a7ecb573f1e899b259262299b34b6e49259"
  license "Apache-2.0"

  depends_on "openjdk"

  def install
    rm_f Dir["bin/*.bat"]
    libexec.install %w[bin lib]
    env = Language::Java.overridable_java_home_env("17")
    (bin/"bld").write_env_script libexec/"bin/bld", env
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bld help")
  end
end
