# RêvesDev - Portfolio & Vitrine

Ce projet est le site vitrine et le portfolio de **RêvesDev** (anciennement DevStudio), développé avec Ruby on Rails 8.

## Technologies
- **Backend:** Ruby on Rails 8.0.4, PostgreSQL
- **Frontend:** Tailwind CSS v4, Hotwire (Turbo & Stimulus)
- **Stockage:** Cloudinary (pour ActiveStorage)
- **Emails:** ActionMailer configuré avec SMTP local

## Configuration Locale

1. Installer les dépendances :
   ```bash
   bundle install
   ```

2. Préparer la base de données :
   ```bash
   rails db:setup
   # ou rails db:create db:migrate db:seed
   ```

3. Lancer le serveur de développement :
   ```bash
   bin/dev
   ```

## Configuration de Production (Render.com)

Le projet est pré-configuré pour être déployé sur **Render.com** en tant que *Web Service* avec un *Database Service* (PostgreSQL).

### Script de Build
Render utilise le fichier `bin/render-build.sh` (défini dans `render.yaml`) pour :
- Installer les gems
- Précompiler les assets (Tailwind)
- Exécuter les migrations de base de données

### Variables d'Environnement Obligatoires
Pour que l'application fonctionne correctement en production, définissez les variables d'environnement suivantes dans l'interface de Render :

- `RAILS_MASTER_KEY` : Clé maître Rails (trouvable dans `config/master.key`)
- `DATABASE_URL` : Fourni automatiquement par Render si vous liez la base de données PostgreSQL.
- `HOST` : Votre nom de domaine en production (ex: `revesdev.fr`).
- `SMTP_USERNAME` : Votre adresse email (ex: gmail) pour l'envoi des formulaires de contact.
- `SMTP_PASSWORD` : Le mot de passe d'application de votre email (sécurisé, pas votre vrai mot de passe).
- `CLOUDINARY_URL` : L'URL de votre compte Cloudinary (format `cloudinary://KEY:SECRET@CLOUD_NAME`) pour le stockage des images du portfolio.

## Tests et Qualité
La suite de tests peut être lancée avec :
```bash
rails test
rails test:system
```

Le code est audité technologiquement via Rubocop (Omaskase Standard) et sécuritairement via Brakeman.
