# std
import
    std/[
        enumerate,
        strutils
    ]

# internal
import
    blockchain/[
        blocks
    ]


type
    Validator* = ref object


proc newValidator*(): Validator =
    return Validator()

proc isBlockchainValid*(self: Validator, blockchain: seq[Block]): string =
    for idx, element in enumerate(blockchain):
        if idx == 0:
            continue

        if not element.getHash().startsWith("0000"):
            return "Not Valid"
        
        if element.getPreviousHash() != blockchain[idx-1].getHash():
            return "Not Valid"

    return "Valid"