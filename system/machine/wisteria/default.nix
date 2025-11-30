{
  self,
  allDirs,
  ...
}:

let
  modules = "${self}/system/machine/wisteria";
in
{
  imports = allDirs modules;
}
