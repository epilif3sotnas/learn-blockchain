# internal
import
    blockchain/[
        blocks
    ]


type
    Validator* = ref object


proc newValidator*(): Validator =
    return Validator()

proc isBlockchainValid*(self: Validator, blockchain: seq[Block]): bool =
    for