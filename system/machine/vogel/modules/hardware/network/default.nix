_:

{
  networking = {
    hostId = "3988cd3f";

    nameservers = [
      "8.8.8.8"
      "8.8.4.4"
    ];

    firewall = {
      enable = true;

      allowedTCPPorts = [
        8384
        22000
        2257
        6371
        3000
        8896
        8888
        8889
        8554
        1935
        25565
        2049
        80
        2244
      ];

      allowedUDPPorts = [
        22000
        21027
        3000
        8896
        8888
        8889
        8000
        8001
        8189
        8890
        25565
        80
        2244
      ];
    };
  };
}
