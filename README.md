# Благодарности

[refilter](https://github.com/1andrevich/Re-filter-lists?tab=readme-ov-file)  
[zkeen-domains](https://github.com/jameszeroX/zkeen-domains)  
[zkeen-ip](https://github.com/jameszeroX/zkeen-ip)  
[sb-rule](https://github.com/legiz-ru/sb-rule-sets)
 и другие

# ghost - легкий список содержит базовые данные

#1 singbox (ghost/ghost-ipsum)

- https://github.com/Vancltkin/ghost/releases/latest/download/ghost.srs
- https://github.com/Vancltkin/ghost/releases/latest/download/ghost-ip-discord.srs

Зеркала 
  
- https://raw.githubusercontent.com/Vancltkin/ghost/main/ghost.srs
- https://github.com/Vancltkin/ghost/releases/latest/download/ghost-ip-discord.srs


#2 xray (ghost/ghost-ipsum)

- https://github.com/Vancltkin/ghost/releases/latest/download/ghost.dat
- https://github.com/Vancltkin/ghost/releases/latest/download/ghost-ipsum.dat

Зеркала 
  
- https://raw.githubusercontent.com/Vancltkin/ghost/main/ghost.dat
- https://raw.githubusercontent.com/Vancltkin/ghost/main/ghost-ipsum.dat




# phantom - огромный список содержит много всего и возможно много лишнего

#1 singbox (phantom-domain/phantom-ipsum)

- https://github.com/Vancltkin/ghost/releases/latest/download/phantom-domain.srs
- https://github.com/Vancltkin/ghost/releases/latest/download/phantom-ipsum.srs

Зеркала 

- https://raw.githubusercontent.com/Vancltkin/ghost/main/phantom-domain.srs
- https://raw.githubusercontent.com/Vancltkin/ghost/main/phantom-ipsum.srs




#2 xray (phantom-domain/phantom-ipsum)

- https://github.com/Vancltkin/ghost/releases/latest/download/phantom-domain.dat
- https://github.com/Vancltkin/ghost/releases/latest/download/phantom-ipsum.dat

Зеркала 

- https://raw.githubusercontent.com/Vancltkin/ghost/main/phantom-domain.dat
- https://raw.githubusercontent.com/Vancltkin/ghost/main/phantom-ipsum.dat




# specter-ads-small - маленький список с рекламой

- https://github.com/Vancltkin/ghost/releases/latest/download/specter-ads-small.dat

Зеркало

- https://raw.githubusercontent.com/Vancltkin/ghost/main/specter-ads-small.dat




# other settings (utils)

- 1

wget -O /usr/share/xray/ghost.dat https://github.com/Vancltkin/ghost/releases/latest/download/ghost.dat

wget -O /usr/share/xray/ghost-ipsum.dat https://github.com/Vancltkin/ghost/releases/latest/download/ghost-ipsum.dat

или

wget -O /usr/share/xray/phantom-domain.dat https://github.com/Vancltkin/ghost/releases/latest/download/phantom-domain.dat

wget -O /usr/share/xray/phantom-ipsum.dat https://github.com/Vancltkin/ghost/releases/latest/download/phantom-ipsum.dat

- 2

crontab -e

0 5 * * * wget -O /usr/share/xray/ghost.dat https://github.com/Vancltkin/ghost/releases/latest/download/ghost.dat

0 5 * * * wget -O /usr/share/xray/ghost-ipsum.dat https://github.com/Vancltkin/ghost/releases/latest/download/ghost-ipsum.dat

или

0 5 * * * wget -O /usr/share/xray/phantom-domain.dat https://github.com/Vancltkin/ghost/releases/latest/download/phantom-domain.dat

0 5 * * * wget -O /usr/share/xray/phantom-ipsum.dat https://github.com/Vancltkin/ghost/releases/latest/download/phantom-ipsum.dat

- 3

ip(ext:"ghost-ipsum.dat:discord") && network(udp) && port(50000-50030) -> proxy

domain(ext:"ghost.dat:bypass")->direct

domain(ext:"ghost.dat:domains")->proxy

domain(ext:"ghost.dat:other")->proxy

domain(ext:"ghost.dat:politic")->proxy

domain(ext:"ghost.dat:youtube")->proxy

ip(ext:"ghost-ipsum.dat:amazon")->proxy

ip(ext:"ghost-ipsum.dat:cloudflare")->proxy

ip(ext:"ghost-ipsum.dat:digitalocean")->proxy

ip(ext:"ghost-ipsum.dat:google")->proxy

ip(ext:"ghost-ipsum.dat:hetzner")->proxy

ip(ext:"ghost-ipsum.dat:meta")->proxy

ip(ext:"ghost-ipsum.dat:telegram")->proxy

или

domain(ext:"phantom-ipsum.dat:refilter")->proxy

domain(ext:"phantom-domain.dat:refilter")->proxy

[openwrt](https://habr.com/ru/articles/773696/)

