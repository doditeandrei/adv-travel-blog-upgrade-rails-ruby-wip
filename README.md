Travel Blog – Ghid Rapid

Aplicație Rails 6 cu CMS integrat (FaeCMS), Dockerizat complet.

🔧 Cerințe
- Docker ≥ 20.x
- Docker Compose ≥ 1.29.x
(Nu este nevoie de Ruby, Node sau Postgres instalate local)

🚀 Instalare & Pornire
1. Clonează proiectul sau extrage arhiva:

   cd adv-travel-blog

2. Pornește aplicația:

   docker-compose up --build

3. Accesează în browser:
   - http://localhost:3000
   - http://localhost:3000/admin (interfață CMS)

🔁 Reset complet (opțional)
docker-compose down
docker volume rm adv-travel-blog_db-data
docker-compose up --build

🛠 Comenzi utile
- Consolă Rails:
  docker-compose exec web rails console

- Migrare DB:
  docker-compose exec web rails db:migrate

- Seed date:
  docker-compose exec web rails db:seed

⚙️ Variabile .env (opțional)
DATABASE_USER=postgres
DATABASE_PASSWORD=password
RAILS_ENV=development
