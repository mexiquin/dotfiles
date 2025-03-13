{
  lib,
  buildFishPlugin,
  fetchFromGitHub,
}:
buildFishPlugin {
  pname = "nai";
  version = "0-unstable-2023-06-16";

  src = fetchFromGitHub {
    owner = "oh-my-fish";
    repo = "theme-nai";
    rev = "6f4471e9f32b5d89017c83ac2748ae79e5f0c204";
    sha256 = "";
  };

  meta = with lib; {
    description = "A minimalist fish theme which displays git branch and status information.";
    homepage = "https://github.com/oh-my-fish/theme-nai";
    license = licenses.mit;
    maintainers = with maintainers; [ mexiquin ];
  };
}
