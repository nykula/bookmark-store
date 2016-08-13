# bookmark-store

Store your bookmarks in Git.

### Installation

Download from GitHub:
```sh
curl https://raw.githubusercontent.com/makepost/bookmark-store/master/src/like.sh > ~/.local/bin/like
```

Make executable:
```sh
chmod +x ~/.local/bin/like
```

### Usage

Create repository:
```sh
ssh example.com git init --bare bookmark-store
```

Initialize local clone:
```sh
like init example.com:bookmark-store
```

Add bookmark:
```sh
like https://www.passwordstore.org/
```

List bookmarks:
```sh
like
```

Remove bookmark:
```sh
like rm https://www.passwordstore.org/
```

Push to origin:
```sh
like push
```

Pull from origin:
```sh
like pull
```

### License

MIT
