# Bionexo

A simple api to list UBSs, made for a job application

## Installing

Install rails and add all dependencies with bundle.

Initialize database

```
rails db:setup
```

Import UBSs from a download csv(you can update the UBS csv in the root folder)


```
bundle exec rails import:ubs
```

## Api

After executing the server with:

```
rails s
```

You can access the api using the following address
(http://localhost:3000/api/v1/ubss)
or
(http://localhost:3000/api/v1/find_ubs)

There is also a search options with the following params
|Name|Example|Description|
|--|--|--|
|query|-23.604936,-46.692999|Latitude and longitude separated with ,
|page|2|Actual page in listing
|per_page|15|The number of items listing(Default:10)

## Running tests

Run unit tests using this command:

```
rspec
```
