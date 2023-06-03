# std
import
    std/[
        strutils
    ]

# external
import
    nimcrypto


type
    Block* = ref object
        hash: string
        previousHash: string
        data: string
        timestamp: int64
        nonce: uint64


proc calculateHash(blockContent: openArray[string]): string =
    return $sha256.digest(join(blockContent))

proc newBlock*(data: string, previousHash: string, timestamp: int64): Block =
    return Block(
        data: data,
        previousHash: previousHash,
        timestamp: timestamp,
        nonce: 0,
        hash: calculateHash(@[data, previousHash, intToStr(cast[int](timestamp)), intToStr(0)])
    )

proc getHash*(self: Block): string =
    return self.hash

proc setHash*(self: Block) =
    self.hash = calculateHash(@[self.data, self.previousHash, intToStr(cast[int](self.timestamp))])

proc getPreviousHash*(self: Block): string =
    return self.previousHash

proc setPreviousHash*(self: Block, previousHash: string) =
    self.previousHash = previousHash

proc getData*(self: Block): string =
    return self.data

proc setData*(self: Block, data: string) =
    self.data = data

proc getTimestamp*(self: Block): int64 =
    return self.timestamp

proc setTimestamp*(self: Block, timestamp: int64) =
    self.timestamp = timestamp

proc getNonce*(self: Block): uint64 =
    return self.nonce

proc setNonce*(self: Block, nonce: uint64) =
    self.nonce = nonce