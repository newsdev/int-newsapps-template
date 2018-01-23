# INT News Apps Template

![screen_shot_of_it_working.png](https://user-images.githubusercontent.com/109988/28286186-5b690a8c-6b05-11e7-80ca-b7f05707bb23.png)

We don't start new projects that often. But when we do, we have some opinions about how to set up your app.

Currently, INT NewsApps supports:
* Flask + Peewee ORM + PostgreSQL
* Django + PostgreSQL

It's likely that your app has special needs that aren't addressed by our template. But, in the words of Brian Boyer, we're trying to solve 80% of your problems so you can focus on the 20% that makes your app unique.

## Step 0: Set up your computer

See our blog post [here](https://open.nytimes.com/set-up-your-mac-like-an-interactive-news-developer-bb8d2c4097e5).

## Step 1: Create up your application
### Django
```bash
./go.sh -t django -n testproject
```

### Flask
```bash
./go.sh -t flask -n testproject
```

In either case, we are assuming your project working directory is `~/src/nyt`. If that's not true, you can also specify a directory using `-d your/directory/here`

## Step 2: Set up persistence (if you need it)
* We use PostgreSQL 9.6.x for persistence. You can install it locally with homebrew.
```bash
brew install postgresql
createuser $USER
createdb $USER
psql -c "alter user $USER with superuser;"
```

## Step 3: Work on your app locally
```
TKTKTKTK
```
## Step 4: Deploy to Meta
```
TKTKTKTK LOL
```
