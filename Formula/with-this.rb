class WithThis < Formula
    desc "With let's you run any shell command with variables, in parallel."
    homepage "https://github.com/amritb/with-this"
    url "https://github.com/amritb/with-this/archive/v0.1-beta.0.tar.gz"
    sha256 "f4cb0802ba1066ac0a19d13b2cd25d829b1f36179196b70a4e32d7317b607cec"
    depends_on "go" => :build
  
    def install
      ENV["GOPATH"] = buildpath
      bin_path = buildpath/"src/github.com/amritb/with-this"
      bin_path.install Dir["*"]
      cd bin_path do
        system "go", "build", "-o", bin/"with", "."
      end
    end
  
    test do
      assert_match "with version v0.1-beta.0", shell_output("#{bin}/with --version 2>&1", 2)
    end
  end
  