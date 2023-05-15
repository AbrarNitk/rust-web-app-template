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
