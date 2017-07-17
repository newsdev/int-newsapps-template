# INT NewsApps Template
We don't start new projects that often. But when we do, we have some opinions about how to set up your app.

Currently, INT NewsApps supports:
* Flask + Peewee ORM + PostgreSQL
* Django + PostgreSQL

It's likely that your app has special needs that aren't addressed by our template. But, in the words of Brian Boyer, we're trying to solve 80% of your problems so you can focus on the 20% that makes your app unique.

## Step 0: Set up your computer

* We use Python3 (3.6.x) to develop locally. You can install it with Homebrew.
```bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install python3
```

* We install virtualenv and virtualenvwrapper.
```bash
sudo pip3 install virtualenv virtualenvwrapper
```

* We set up some environment variables that are common. You can use bash (`~/.bash_profile`) or zsh (`~/.zshrc`).
```bash
export VIRTUALENV_PYTHON=/usr/local/bin/python3
export VIRTUALENVWRAPPER_PYTHON=$VIRTUALENV_PYTHON

export WORKON_HOME=$HOME/.v
source /usr/local/bin/virtualenvwrapper.sh

export LDFLAGS="-L/usr/local/opt/openssl/lib"
export CPPFLAGS="-I/usr/local/opt/openssl/include"
export PKG_CONFIG_PATH="/usr/local/opt/openssl/lib/pkgconfig"

export EDITOR=nano

eval $(ssh-agent) > /dev/null
ssh-add -K ~/.ssh/*.pem
ssh-add -K ~/.ssh/*rsa

export DJANGO_SETTINGS_MODULE=config.dev.settings
```


## Step 1: Start up your application
```bash

```

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
