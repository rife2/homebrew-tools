class Rife2Bld < Formula
  desc "Open-source build tool for the RIFE2 Java web framework"
  homepage "https://rife2.com"
  url "https://repo1.maven.org/maven2/com/uwyn/rife2/rife2/1.5.1/rife2-1.5.1-bld.zip"
  sha256 "685ac9f983479648992f67ad3e2207e07f00fb0ae38102056e5d0d3c69b05679"
  license "Apache-2.0"

  depends_on "openjdk"

  def install
    rm_f Dir["bin/*.bat"]
    libexec.install %w[bin lib]
    env = Language::Java.overridable_java_home_env("19")
    (bin/"bld").write_env_script libexec/"bin/bld", env
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bld help")
  end
end
