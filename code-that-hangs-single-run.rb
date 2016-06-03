require 'neo4j-core'


def test_with_tx

  begin
    tx = Neo4j::Transaction.new

    Neo4j::Session.query("MATCH (n) DETACH DELETE n")
    Neo4j::Session.query("CREATE (tsn:TSN)\nSET tsn = { value: 'prop1', val2: 2 }\nWITH tsn\nCALL ga.timetree.single({time: timestamp(), resolution: 'Millisecond', create: true})\nYIELD instant as instant\nCREATE (tsn)-[:HAS_EVENT]->(instant)")

  rescue Exception => exp
    puts exp.message
    tx.failure
  ensure
    tx.close
  end
end

Neo4j::Session.open(:server_db)
test_with_tx

