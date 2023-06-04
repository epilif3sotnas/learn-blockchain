# std
import
  std/[
    times,
    random
  ]

# internal
import
  blockchain/[
    blocks,
    miner,
    validator
  ]


proc main() =
  var blockchain = newSeq[Block]()

  let miner = newMiner(4)
  let validator = newValidator()

  var previousHash = "Genesis"
  for idx in countup(1, 100):
    if blockchain.len() > 0:
      previousHash = blockchain[blockchain.len() - 1].getHash()

    var blockA = newBlock("Block " & $idx & " " & $rand(getTime().toUnix().int()), previousHash, getTime().toUnix())

    blockA = miner.mineBlock(blockA)

    blockchain.add(blockA)

  for element in blockchain:
    echo "\n\n=========================================="
    echo "Hash: " & element.getHash()
    echo "Previous Hash: " & element.getPreviousHash()
    echo "Data: " & element.getData()
    echo "Timestamp: " & $element.getTimestamp()
    echo "Nonce: " & $element.getNonce()
    echo "=========================================="


  echo "\nBlockchain validation: " & $validator.isBlockchainValid(blockchain)

when isMainModule:
  main()