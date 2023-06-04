# std
import
    std/[
        strutils
    ]

# internal
import
    blockchain/[
        blocks
    ]


type
    Miner* = ref object
        prefix: string


proc newMiner*(prefix: uint8): Miner =
    return Miner(prefix: '0'.repeat(prefix))

proc mineBlock*(self: Miner, blockToMine: Block): Block =
    while not blockToMine.getHash().startsWith(self.prefix):
        blockToMine.setNonce(blockToMine.getNonce() + 1)
        blockToMine.setHash()

    return blockToMine