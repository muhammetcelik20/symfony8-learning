#!/bin/bash
echo "🚀 Symfony 8 klasör yapısı kuruluyor..."

mkdir -p src/Controller src/Entity src/Repository src/Service
mkdir -p templates/home templates/shared
mkdir -p config/packages config/routes
mkdir -p public/assets public
mkdir -p translations
mkdir -p var/cache var/log

cat > templates/base.html.twig <<EOL
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>{% block title %}Symfony 8 App{% endblock %}</title>
</head>
<body>
{% block body %}{% endblock %}
</body>
</html>
EOL

cat > templates/home/index.html.twig <<EOL
{% extends 'base.html.twig' %}

{% block title %}Home{% endblock %}

{% block body %}
<h1>Welcome to Symfony 8!</h1>
{% endblock %}
EOL

cat > src/Controller/HomeController.php <<EOL
<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class HomeController extends AbstractController
{
    #[Route('/', name: 'home')]
    public function index(): Response
    {
        return \$this->render('home/index.html.twig');
    }
}
EOL

cat > .gitignore <<EOL
/vendor/
/var/
/.env.local
EOL

echo "✅ Symfony 8 başlangıç klasör yapısı hazır!"
