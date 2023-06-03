# std
import
    std/strutils

# external
import
    nimcrypto


type
    Block* = ref object
        hash: string
        previousHash: string
        data: string
        timestamp: uint32
        nonce: uint64


proc calculateHash(blockContent: openArray[string]): string =
    return $sha256.digest(join(blockContent))

proc newBlock*(data: string, previousHash: string, timestamp: uint32): Block =
    return Block(
        data: data,
        previousHash: previousHash,
        timestamp: timestamp,
        hash: calculateHash(@[data, previousHash, intToStr(cast[int](timestamp))])
    )

proc getHash*(self: Block): string =
    return self.hash