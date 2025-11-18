_:

{
  services.undervolt = {
    enable = true;
    tempBat = 85;
    tempAc = 98;
    coreOffset = -138;
    gpuOffset = -130;
    p1.limit = 40;
    p2.limit = 30;
    p1.window = 9;
    p2.window = 15;
  };
}
