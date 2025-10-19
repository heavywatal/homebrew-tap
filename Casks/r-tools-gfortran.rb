cask "r-tools-gfortran" do
  version "14.2"
  sha256 "ec462d465f093eeee0623d2b5d327bd1038313b985034b766462957e36d7aadd"

  url "https://mac.r-project.org/tools/gfortran-#{version}-universal.pkg"
  name "GNU Fortran for R"
  desc "Fortran compiler provided by the R Project"
  homepage "https://mac.r-project.org/tools/"

  livecheck do
    url :homepage
    regex(/href=.*?gfortran[._-](\d+(?:\.\d+)*)([._-]universal)?\.pkg/i)
  end

  pkg "gfortran-#{version}-universal.pkg"

  uninstall pkgutil: "org.r-project.universal.gfortran"
end
