#!/bin/bash

# Цвета для выделения текста
YELLOW="\033[1;33m"
GREEN="\033[1;32m"
RED="\033[1;31m"
BLUE="\033[1;34m"
RESET="\033[0m"

# Функция для отображения заголовков
print_header() {
    echo -e "${YELLOW}=== $1 ===${RESET}"
}

# Функция для успешных сообщений
print_success() {
    echo -e "${GREEN}[✔] $1${RESET}"
}

# Функция для ошибок
print_error() {
    echo -e "${RED}[✘] $1${RESET}"
}

# Функция для обычных сообщений
print_info() {
    echo -e "${BLUE}[ℹ] $1${RESET}"
}

# Устанавливаем публичный ключ v2rayA
print_header "Установка публичного ключа v2rayA"
wget https://downloads.sourceforge.net/project/v2raya/openwrt/v2raya.pub -O /etc/opkg/keys/94cc2a834fb0aa03
echo "src/gz v2raya https://downloads.sourceforge.net/project/v2raya/openwrt/$(. /etc/openwrt_release && echo "$DISTRIB_ARCH")" | tee -a "/etc/opkg/customfeeds.conf"

# Обновляем список пакетов
print_header "Обновление списка пакетов"
opkg update

# Устанавливаем необходимые пакеты и v2raya
print_header "Установка необходимых пакетов"
opkg install v2raya xray-core kmod-nft-tproxy iptables-nft
opkg install luci-app-v2raya

# Запускаем v2RayA
print_header "Запуск v2RayA"
uci set v2raya.config.enabled='1'
uci commit v2raya
/etc/init.d/v2raya enable
/etc/init.d/v2raya start

# Скачиваем списки правил Re:filter
print_header "Скачивание списков правил - phantom и ghost"
wget -O /usr/share/xray/ghost-ipsum.dat https://github.com/Vancltkin/ghost/releases/latest/download/ghost-ipsum.dat
wget -O /usr/share/xray/ghost.dat https://github.com/Vancltkin/ghost/releases/latest/download/ghost.dat
wget -O /usr/share/xray/phantom-ipsum.dat https://github.com/Vancltkin/ghost/releases/latest/download/phantom-ipsum.dat
wget -O /usr/share/xray/phantom-domain.dat https://github.com/Vancltkin/ghost/releases/latest/download/phantom-domain.dat

# Устанавливаем планировщик для обновления правил
print_header "Установка планировщика обновлений для обновления phantom и ghost"
{
    echo "0 5 * * * wget -O /usr/share/xray/ghost-ipsum.dat https://github.com/Vancltkin/ghost/releases/latest/download/ghost-ipsum.dat"
    echo "0 5 * * * wget -O /usr/share/xray/ghost.dat https://github.com/Vancltkin/ghost/releases/latest/download/ghost.dat"
    echo "0 5 * * * wget -O /usr/share/xray/phantom-ipsum.dat https://github.com/Vancltkin/ghost/releases/latest/download/phantom-ipsum.dat"
    echo "0 5 * * * wget -O /usr/share/xray/phantom-domain.dat https://github.com/Vancltkin/ghost/releases/latest/download/phantom-domain.dat"
} | crontab -

# Информативное сообщение
print_header "Инструкции по настройке v2RayA"
echo -e ""
echo -e "${BLUE}Перейдите в панель управления v2rayA вашего роутера, например:${RESET}"
echo -e "${GREEN}http://192.168.1.1:2017${RESET}"

echo -e "${BLUE}Настроим следующие параметры:${RESET}"
echo -e ""
echo -e "${YELLOW}1. Transparent Proxy / System Proxy: On : Traffic Splitting Mode is the same as the Rule Port${RESET}"
echo -e "${YELLOW}2. Traffic Splitting Mode: RoutingA${RESET}"
echo -e "${YELLOW}3. Transparent Proxy / System Proxy Implementation: tproxy${RESET}"
echo -e "${YELLOW}4. Prevent DNS Spoofing: Advanced Setting, введите нужные вам DNS серверы${RESET}"
echo -e "${YELLOW}5. DNS серверы: Google, Cloudflare и т. д.${RESET}"
echo -e "${YELLOW}6. Special Mode: Off${RESET}"
echo -e "${YELLOW}7. TCPFastOpen: Keep Default${RESET}"
echo -e "${YELLOW}8. Multiplex: Off (можно включить при наличии ресурсов роутера)${RESET}"
echo -e "${YELLOW}9. Automatically Update Subscriptions: Off (по умолчанию), настройте при использовании подписок${RESET}"

echo -e "${BLUE}Теперь перейдите в раздел 'Traffic Splitting Mode of Rule Port: RoutingA - Configure' и вставьте следующие строки :${RESET}"
echo -e ""
echo -e "${YELLOW}#Final -> direct/proxy${RESET}"
echo -e "${YELLOW}default: direct${RESET}"
echo -e ""
echo -e "${YELLOW}#Torrent${RESET}"
echo -e "${YELLOW}protocol(bittorrent) -> direct${RESET}"
echo -e ""
echo -e "${YELLOW}#Block ads${RESET}"
echo -e "${YELLOW}domain(geosite:category-ads) -> block${RESET}"
echo -e ""
echo -e "${YELLOW}#Custom rules${RESET}"
echo -e ""
echo -e "${YELLOW}#VPS${RESET}"
echo -e "${YELLOW}domain(2ip.io) -> block${RESET}"
echo -e ""
echo -e "${YELLOW}#Phantom${RESET}"
echo -e "${YELLOW}ip(ext:\"phantom-ipsum.dat:refilter\")->proxy${RESET}"
echo -e "${YELLOW}domain(ext:\"phantom-domain.dat:refilter\")->proxy${RESET}"
echo -e ""
echo -e ""
echo -e ""
echo -e "${YELLOW}или${RESET}"
echo -e ""
echo -e "${YELLOW}#Final -> direct/proxy${RESET}"
echo -e "${YELLOW}default: direct${RESET}"
echo -e ""
echo -e "${YELLOW}#Torrent${RESET}"
echo -e "${YELLOW}protocol(bittorrent) -> direct${RESET}"
echo -e ""
echo -e "${YELLOW}#Block ads${RESET}"
echo -e "${YELLOW}domain(geosite:category-ads) -> block${RESET}"
echo -e ""
echo -e "${YELLOW}#Custom rules${RESET}"
echo -e ""
echo -e "${YELLOW}#VPS${RESET}"
echo -e "${YELLOW}domain(2ip.io) -> block${RESET}"
echo -e ""
echo -e "${YELLOW}#Ghost${RESET}"
echo -e "${YELLOW}ip(ext:\"ghost-ipsum.dat:discord\") && network(udp) && port(50000-50030) -> proxy${RESET}"
echo -e "${YELLOW}domain(ext:\"ghost.dat:bypass\") -> direct${RESET}"
echo -e "${YELLOW}domain(ext:\"ghost.dat:domains\") -> proxy${RESET}"
echo -e "${YELLOW}domain(ext:\"ghost.dat:other\") -> proxy${RESET}"
echo -e "${YELLOW}domain(ext:\"ghost.dat:politic\") -> proxy${RESET}"
echo -e "${YELLOW}domain(ext:\"ghost.dat:youtube\") -> proxy${RESET}"
echo -e "${YELLOW}ip(ext:\"ghost-ipsum.dat:amazon\") -> proxy${RESET}"
echo -e "${YELLOW}ip(ext:\"ghost-ipsum.dat:cloudflare\") -> proxy${RESET}"
echo -e "${YELLOW}ip(ext:\"ghost-ipsum.dat:digitalocean\") -> proxy${RESET}"
echo -e "${YELLOW}ip(ext:\"ghost-ipsum.dat:google\") -> proxy${RESET}"
echo -e "${YELLOW}ip(ext:\"ghost-ipsum.dat:hetzner\") -> proxy${RESET}"
echo -e "${YELLOW}ip(ext:\"ghost-ipsum.dat:meta\") -> proxy${RESET}"
echo -e "${YELLOW}ip(ext:\"ghost-ipsum.dat:telegram\") -> proxy${RESET}"

