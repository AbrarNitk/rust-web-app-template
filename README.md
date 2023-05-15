# Rust Web Service Template


## Rust Setup

### Install Rust

- https://www.rust-lang.org/tools/install

```shell
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```


## Zsh Setup

### Install `zsh`

### Autoenv Setup

- https://github.com/Tarrasch/zsh-autoenv

```shell
git clone https://github.com/Tarrasch/zsh-autoenv ~/.dotfiles/lib/zsh-autoenv
echo 'source ~/.dotfiles/lib/zsh-autoenv/autoenv.zsh' >> ~/.zshrc
```


## Django Setup

### Install `pip`

### Create `virtualenv`

```shell
python3 -m venv .env
source ./.env/bin/activate
```

### Install `python` Dependencies

```shell
pip install -r requirements.txt
```

### Create Project

We don't need to run this command everytime as we have to create only first time
and it is already done

```shell
django-admin startproject proj
mv proj dj
```


## Install Postgres


## Install `Redis`


## Diesel Setup

### Install Diesel CLI

If above `zsh` setup is not done

```shell
cargo install diesel_cli --no-default-features --features "postgres"
```

If above `zsh` is done so run below command

```shell
install_diesel
```

### Diesel Schema

If above `zsh` setup is not done
```shell
diesel print-schema only-tables --database-url=$DATABASE_URL > $PROJDIR/service/db/src/schema.rs
```

If above `zsh` is done so run below command

```shell
diesel_schema
```
