# Hanami DDD

HanamiでDDDやるときに注意するべき、エンティティとリポジトリの使い方のサンプルコードを掲載しています。

## Requirement
* [Docker](https://www.docker.com)
* [Docker-Compose](https://docs.docker.com/compose/)

## How to setup

### Clone From Github

`git clone git@`

### Build Hanami image

`docker-compose build`

### Start Application

`docker-compose up`

### Migrate DB
`docker-compose run hanami bundle exec hanami db migrate` 

## How to experiment

### Dive to hanami console
`docker-compose run hanami bundle exec hanami c`

### Run commands

- Create invalid entity
```
irb(main):001:0> new_book = NewBook.create(id: 1, title: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", author: "hanami")
ArgumentError (titleは20文字までです。)
```

- Create valid entity
```
irb(main):001:0> new_book = NewBook.create(id: 1, title: "hanami-ddd", author: "hanami")
=> #<NewBook:0x0000562c782314a0 @attributes={:id=>1, :title=>"hanami-ddd", :author=>"hanami", :created_...
```

- Store valid entity to DB
```
irb(main):003:0> new_book_repository = NewBookRepository.new
=> #<NewBookRepository relations=[:new_books]>
irb(main):004:0> new_book_repository.store(new_book)
[hanami_ddd] [INFO] [2022-04-24 14:43:49 +0000] (0.009052s) INSERT INTO `new_books` (`id`, `title`, `author`, `created_at`, `updated_at`) VALUES (1, 'hanami-ddd', 'hanami', '2022-04-24 14:41:26', '2022-04-24 14:41:26')
=> 1
```

## How to stop
`docker-compose down`