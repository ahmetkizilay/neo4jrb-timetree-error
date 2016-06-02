# transaction error

### preparation

1. Download graphaware timetree and copy into the plugins folder

```
http://products.graphaware.com/download/framework-server-community/latest
http://products.graphaware.com/download/timetree/latest

```

2. install gems

```
bundle install

```

3. run the code
```
ruby ./code-that-works.rb
ruby ./code-that-hangs.rb
```


### Error

GraphAware timetree stored procedures cause Neo4j to hang when called inside a transaction.

```
too many connection resets (due to Net::ReadTimeout - Net::ReadTimeout) after 6 requests on 15153260, last used 60.046284859 seconds ago
```