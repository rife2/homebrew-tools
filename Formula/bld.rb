class Bld < Formula
  desc "Open-source build tool for the RIFE2 Java web framework"
  homepage "https://rife2.com"
  url "https://repo1.maven.org/maven2/com/uwyn/rife2/rife2/1.5.17/rife2-1.5.17-bld.zip"
  sha256 "e8408d37980f618ef37c1c31b92d1f54288384d65c35f6ddfb70f02691f1de37"
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
