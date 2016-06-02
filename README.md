# transaction error

### preparation

* Install Neo4j 3.0.1 Community Edition

* Download graphaware timetree and copy into the plugins folder

```
http://products.graphaware.com/download/framework-server-community/latest
http://products.graphaware.com/download/timetree/latest

```
* enable graphaware extension in `./conf/neo4j.conf`
```
dbms.unmanaged_extension_classes=com.graphaware.server=/graphaware
```

* install gems (neo4j-core 6.1.4)

```
bundle install

```

* run the code
```
ruby ./code-that-works.rb
ruby ./code-that-hangs.rb
```


### Error

GraphAware timetree stored procedures cause Neo4j to hang when called inside a transaction.

```
too many connection resets (due to Net::ReadTimeout - Net::ReadTimeout) after 6 requests on 15153260, last used 60.046284859 seconds ago
```