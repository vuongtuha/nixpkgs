{ lib
, python3Packages
, fetchFromGitHub
, installShellFiles
}:

python3Packages.buildPythonApplication rec {
  pname = "pyradio";
  version = "0.9.0";

  src = fetchFromGitHub {
    owner = "coderholic";
    repo = pname;
    rev = "refs/tags/${version}";
    hash = "sha256-8Kr+DRbkTKvhetIIs4htOHlIXGLpoe+T+0yxjm/JcWk=";
  };

  nativeBuildInputs = [
    installShellFiles
  ];

  propagatedBuildInputs = with python3Packages; [
    requests
    psutil
    dnspython
  ];

  checkPhase = ''
    $out/bin/pyradio --help
  '';

  postInstall = ''
    installManPage *.1
  '';

  meta = with lib; {
    homepage = "http://www.coderholic.com/pyradio/";
    description = "Curses based internet radio player";
    changelog = "https://github.com/coderholic/pyradio/releases/tag/${version}";
    license = licenses.mit;
    maintainers = with maintainers; [ contrun ];
  };
}
