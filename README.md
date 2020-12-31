# README

![Travis](https://travis-ci.org/jose-izquierdo/api_camillion.svg?branch=master)

API for a company’s internal news feed.

(1) User model:
- A standard user model should be created
- It’s not required to create an authentication process, bur rather a login simulation for admin and standard user roles.

(2) User story #1: Post a news item
- We need to create an endpoint for the frontend, so the user will be able to create news items.
- A news item has 2 fields: Title and Content. Both are text.
- Only users with admin permission are able to create news (use the login simulation here)

(3) User story #2: Get news items
- We need to create an endpoint for showing news items to users.
- This endpoint should return all the news items that have been created.
- Only logged in users should be able to retrieve information from this endpoint
- (note: focus here on quality, try to think about a standard for how data can be serialized and returned etc)

##### Prerequisites

The setups steps expect following tools installed on the system.

- Git
- Ruby [2.7.0]
- Rails [6.0.3]
- Postgresql

##### 1. Check out the repository

```bash
git clone https://github.com/jose-izquierdo/api_camillion.git
```

##### 2. Install gems and dependencies

```bash
bundle install
```

##### 3. Database creation, migrations, and seed. 

Modify database.yml with your local credentials if neccessary.

```bash
bundle exec rails db:create db:migrate db:seed
```

##### 4. Run server. 

```bash
bundle exec rails s
```

##### 5. Run specs. 

```bash
bundle exec rspec spec
```

# API DOC

##### 1. Generate documentation

```bash
yardoc
```

##### 2. Run yard server

```bash
yard server
```

##### 3. Go your localhost

[visit the link](http://localhost:8808)


