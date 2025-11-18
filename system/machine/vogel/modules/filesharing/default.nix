_: {

  services.nfs.server.enable = true;

  services.samba = {
    enable = true;
    openFirewall = true;
    settings = {
      global = {
        "workgroup" = "WORKGROUP";
        "server string" = "smbnix";
        "netbios name" = "smbnix";
        "security" = "user";
        #"use sendfile" = "yes";
        #"max protocol" = "smb2";
        # note: localhost is the ipv6 localhost ::1
        "hosts allow" = "192.168.0. 127.0.0.1 100. localhost";
        "hosts deny" = "0.0.0.0/0";
        "guest account" = "nobody";
        "map to guest" = "bad user";
      };

      "games" = {
        "path" = "/hdds/games";
        "browseable" = "yes";
        "read only" = "no";
        "guest ok" = "no";
        "create mask" = "0644";
        "directory mask" = "0755";
        "force user" = "corg";
        "force group" = "corg";
      };

      "data" = {
        "path" = "/hdds/data";
        "browseable" = "yes";
        "read only" = "no";
        "guest ok" = "no";
        "create mask" = "0644";
        "directory mask" = "0755";
        "force user" = "corg";
        "force group" = "corg";
      };

      "backups" = {
        "path" = "/hdds/backups";
        "browseable" = "yes";
        "read only" = "no";
        "guest ok" = "no";
        "create mask" = "0644";
        "directory mask" = "0755";
        "force user" = "corg";
        "force group" = "corg";
      };

      "torrents" = {
        "path" = "/hdds/torrents";
        "browseable" = "yes";
        "read only" = "no";
        "guest ok" = "yes";
        "create mask" = "0644";
        "directory mask" = "0755";
        "force user" = "corg";
        "force group" = "corg";
      };

      "tm_share" = {
        "path" = "/hdds/backups/tm_share";
        "valid users" = "corg";
        "public" = "no";
        "writeable" = "yes";
        "force user" = "corg";
        "fruit:aapl" = "yes";
        "fruit:time machine" = "yes";
        "vfs objects" = "catia fruit streams_xattr";
      };

      "nginx_skins" = {
        "path" = "/var/nginx/skins";
        "public" = "no";
        "writeable" = "yes";
        "browseable" = "yes";
        "read only" = "no";
        "guest ok" = "yes";
        "force user" = "nginx";
      };
    };
  };

  services.samba-wsdd = {
    enable = true;
    openFirewall = true;
  };
}
