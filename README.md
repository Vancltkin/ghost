# Благодарности

[refilter](https://github.com/1andrevich/Re-filter-lists?tab=readme-ov-file)  
[zkeen-domains](https://github.com/jameszeroX/zkeen-domains)  
[sb-rule](https://github.com/legiz-ru/sb-rule-sets)

# ghost

#1 Вариант

https://github.com/Vancltkin/ghost/releases/latest/download/ghost.srs

--------------
https://github.com/Vancltkin/ghost/releases/latest/download/ghost.dat

crontab -e

0 5 * * * wget -O /usr/share/xray/ghost.dat https://github.com/Vancltkin/ghost/releases/latest/download/ghost.dat
---------------

#2 Вариант

https://raw.githubusercontent.com/Vancltkin/ghost/main/ghost.srs

https://raw.githubusercontent.com/Vancltkin/ghost/main/ghost.dat


# phantom (domain/ipsum)

#1 Вариант

https://github.com/Vancltkin/ghost/releases/latest/download/phantom-domain.srs
https://github.com/Vancltkin/ghost/releases/latest/download/phantom-ipsum.srs

https://github.com/Vancltkin/ghost/releases/latest/download/phantom-domain.dat
https://github.com/Vancltkin/ghost/releases/latest/download/phantom-ipsum.dat


crontab -e

0 5 * * * wget -O /usr/share/xray/phantom-domain.dat https://github.com/Vancltkin/ghost/releases/latest/download/phantom-domain.dat
0 5 * * * wget -O /usr/share/xray/phantom-ipsum.dat https://github.com/Vancltkin/ghost/releases/latest/download/phantom-ipsum.dat


#2 Вариант

https://raw.githubusercontent.com/Vancltkin/ghost/main/phantom-domain.srs
https://raw.githubusercontent.com/Vancltkin/ghost/main/phantom-ipsum.srs

https://raw.githubusercontent.com/Vancltkin/ghost/main/phantom-domain.dat
https://raw.githubusercontent.com/Vancltkin/ghost/main/phantom-ipsum.dat
