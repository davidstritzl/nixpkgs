{ lib, fetchFromGitHub, buildPythonPackage, isPy3k,
isodate, lxml, xmlsec, freezegun }:

buildPythonPackage rec {
  pname = "python3-saml";
  version = "1.12.0";
  disabled = !isPy3k;

  src = fetchFromGitHub {
    owner = "onelogin";
    repo = "python3-saml";
    rev = "v${version}";
    sha256 = "sha256-VPUsjuo4FIes8ti0tkR0kT3J3RdUt1wtl4QEahVsc2c=";
  };

  propagatedBuildInputs = [
    isodate lxml xmlsec
  ];

  checkInputs = [ freezegun ];
  pythonImportsCheck = [ "onelogin.saml2" ];

  meta = with lib; {
    description = "OneLogin's SAML Python Toolkit for Python 3";
    homepage = "https://github.com/onelogin/python3-saml";
    license = licenses.mit;
    maintainers = with maintainers; [ zhaofengli ];
  };
}
