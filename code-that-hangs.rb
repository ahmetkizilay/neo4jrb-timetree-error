require 'neo4j-core'


def test_with_tx

  begin
    tx = Neo4j::Transaction.new

    Neo4j::Session.query("MATCH (n) DETACH DELETE n")

    tsn_test = "
    CREATE (tsn:TSN)
    SET tsn = { value: 'prop1', val2: 2 }
    WITH tsn
    CALL ga.timetree.single({time: timestamp(), resolution: 'Millisecond', create: true})
    YIELD instant as instant
    CREATE (tsn)-[:HAS_EVENT]->(instant)
    "

    Neo4j::Session.query(tsn_test)
  rescue Exception => exp
    puts exp.message
    tx.failure
  ensure
    tx.close
  end
end

Neo4j::Session.open(:server_db)

1000.times do |i|
  puts i
  test_with_tx
end

