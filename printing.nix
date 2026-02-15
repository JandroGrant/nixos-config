{pkgs, ...}: 
{
  services.printing = {
    enable = true;
    dirvers = with pkgs; [
      cups-filters
      cups-browsed
    ];
  };
}
