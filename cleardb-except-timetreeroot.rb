require 'neo4j-core'


def test_with_tx
  begin
    tx = Neo4j::Transaction.new

    delete_all_except_timetreeroot = "
      MATCH (n) WHERE NOT ('TimeTreeRoot' IN labels(n))
      DETACH DELETE n
    "
    Neo4j::Session.query(delete_all_except_timetreeroot)

    simple_timetree_query= "
      CREATE (tsn:TSN)
      SET tsn = { value: 'prop1', val2: 2 }
      WITH tsn
      CALL ga.timetree.single({time: timestamp(), resolution: 'Millisecond', create: true})
      YIELD instant as instant
      CREATE (tsn)-[:HAS_EVENT]->(instant)
    "
    Neo4j::Session.query(simple_timetree_query)

  rescue Exception => exp
    puts exp.message
    tx.failure
  ensure
    tx.close
  end
end

Neo4j::Session.open(:server_db)

100.times do |i|
  puts i
  test_with_tx
end

