# std
import
  std/[
    times
  ]

# internal
import
  blockchain/blocks


proc main() =
  let blockA = newBlock("Transaction", "Genesis", getTime().toUnix())
  echo "Hash: " & blockA.getHash()
  echo "Previous Hash: " & blockA.getPreviousHash()
  echo "Data: " & blockA.getData()
  echo "Timestamp: " & $blockA.getTimestamp()
  echo "Nonce: " & $blockA.getNonce()

when isMainModule:
  main()