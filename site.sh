#!/bin/bash

# update Linux packages repository (обновляем репозиторий пакетов в Linux)
apt update

# Nginx installation (устанавливаем веб-сервер nginx)
apt install -y nginx

# replacing default Nginx index page (заменяем стандартную веб-страницу nginx своей)
cat <<EOF > /var/www/html/index.nginx-debian.html
<!DOCTYPE html>
<html>
<head>
<title>Setup Nginx title</title>
</head>

<body>
<h1>Setup Nginx page content</h1>
</body>

</html>
EOF

# enabling and starting Nginx service (добавляем в автозапуск и сразу запускаем сервис nginx)
systemctl enable --now nginx

# check Nginx port 80 exposing (проверяем что nginx запустился и публикует веб-страницы на 80 порту)
netstat -tulpn | grep 80

# browse Nginx page (открываем нашу самодельную веб-страницу)
curl http://localhost
