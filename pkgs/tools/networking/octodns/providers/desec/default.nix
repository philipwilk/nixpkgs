{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  octodns,
  pytestCheckHook,
  pythonOlder,
  requests,
  requests-mock,
  setuptools,
}:
buildPythonPackage rec {
  pname = "octodns-desec";
  version = "0-unstable-2024-10-5";
  pyproject = true;

  disabled = pythonOlder "3.10";

  src = fetchFromGitHub {
    owner = "TilCreator";
    repo = "octodns-desec";
    rev = "ae3a1cd4f675e3bf937fc428adf3dc7127c8b9e5";
    hash = "sha256-n8xpsQni4YdR29FbYVIhLUrz44KXzSh4uocQwqPgL20=";
  };

  build-system = [
    setuptools
  ];

  dependencies = [
    octodns
    requests
  ];

  pythonImportsCheck = ["octodns_desec"];

  nativeCheckInputs = [
    pytestCheckHook
    requests-mock
  ];

  meta = with lib; {
    description = "deSEC DNS provider for octoDNS";
    homepage = "https://github.com/TilCreator/octodns-desec"; # TODO
    changelog = "https://github.com/TilCreator/octodns-desec/blob/${src.rev}/CHANGELOG.md"; # TODO
    license = licenses.mit;
    maintainers = []; # TODO
  };
}
