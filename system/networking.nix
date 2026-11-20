{ ... }:

{
  networking = {
    hostName = "ghost";
    networkmanager.enable = true;

    wg-quick.interfaces.proton = {
      configFile = "/etc/wireguard/proton.conf";
      autostart = true;
    };

    nftables = {
      enable = true;

      tables.vpn-killswitch = {
        family = "inet";
        content = ''
          chain output {
            type filter hook output priority 0; policy drop;

            # Loopback
            oifname "lo" accept

            # VPN tunnel
            oifname "proton" accept

            # WireGuard transport
            meta mark 0xca6c accept

            # DHCP
            udp sport 68 udp dport 67 accept
            udp sport 546 udp dport 547 accept
          }
        '';
      };
    };
  };
}
