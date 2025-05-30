//
//  HKDFTest.swift
//  
//
//  Created by Leif Ibsen on 30/11/2023.
//

import XCTest
@testable import Digest

final class HKDFTest: XCTestCase {

    // Test vectors from Wycheproof

    struct test1Struct {
        let kind: MessageDigest.Kind
        let ikm: Bytes
        let salt: Bytes
        let info: Bytes
        let size: Int
        let okm: Bytes

        init(kind: MessageDigest.Kind, ikm: String, salt: String, info: String, size: Int, okm: String) {
            self.kind = kind
            self.ikm = Base64.hex2bytes(ikm)!
            self.salt = Base64.hex2bytes(salt)!
            self.info = Base64.hex2bytes(info)!
            self.size = size
            self.okm = Base64.hex2bytes(okm)!
        }
    }
    
    let tests1: [test1Struct] = [
        test1Struct(
            kind: .SHA1,
            ikm: "0b0b0b0b0b0b0b0b0b0b0b",
            salt: "000102030405060708090a0b0c",
            info: "f0f1f2f3f4f5f6f7f8f9",
            size: 42,
            okm: "085a01ea1b10f36933068b56efa5ad81a4f14b822f5b091568a9cdd4f155fda2c22e422478d305f3f896"
        ),
        test1Struct(
            kind: .SHA1,
            ikm: "0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b",
            salt: "",
            info: "",
            size: 42,
            okm: "0ac1af7002b3d761d1e55298da9d0506b9ae52057220a306e07b6b87e8df21d0ea00033de03984d34918"
        ),
        test1Struct(
            kind: .SHA1,
            ikm: "5b01b2da3166f217cdd68de8af60078f",
            salt: "",
            info: "6884cfa7ffe8f27bf4ebc6e46a7e01488c79243a",
            size: 64,
            okm: "1535a41d6e8a94c5bd51b7447bbd9c2b8fa00ba05b92e7ab0da7d1fec7d348ee7d50a4bdbbde173dd6eeff83aba9e8b822823b339a76811d62771336f4e08f3d"
        ),

        test1Struct(
            kind: .SHA2_256,
            ikm: "0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b",
            salt: "000102030405060708090a0b0c",
            info: "f0f1f2f3f4f5f6f7f8f9",
            size: 42,
            okm: "3cb25f25faacd57a90434f64d0362f2a2d2d0a90cf1a5a4c5db02d56ecc4c5bf34007208d5b887185865"
        ),
        test1Struct(
            kind: .SHA2_256,
            ikm: "0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b",
            salt: "",
            info: "",
            size: 42,
            okm: "8da4e775a563c18f715f802a063c5a31b8a11f5c5ee1879ec3454e5f3c738d2d9d201395faa4b61a96c8"
        ),
        test1Struct(
            kind: .SHA2_256,
            ikm: "2d43e54bf0c94c9cbff4300f4aa69ab8",
            salt: "",
            info: "d674da3bb47d5c7e38b501e5251d9348af601c44",
            size: 20,
            okm: "3d36966f29c0561b4e50f9325c7c98292b6d28bc"
        ),

        test1Struct(
            kind: .SHA2_384,
            ikm: "60ab7f45b0ad534683b3a6c020d4f775",
            salt: "",
            info: "",
            size: 20,
            okm: "3f8b0e4a7b2bff01a26a18f1e07c0218897a324e"
        ),
        test1Struct(
            kind: .SHA2_384,
            ikm: "2d43e54bf0c94c9cbff4300f4aa69ab8",
            salt: "",
            info: "d674da3bb47d5c7e38b501e5251d9348af601c44",
            size: 20,
            okm: "658e6132e5279439568a617274fc788dccc2bacf"
        ),
        test1Struct(
            kind: .SHA2_384,
            ikm: "5b01b2da3166f217cdd68de8af60078f",
            salt: "",
            info: "6884cfa7ffe8f27bf4ebc6e46a7e01488c79243a",
            size: 64,
            okm: "7bf6c7c72fa9bf184f9a2e13077a0e1afb9d976a5574fb7ec819d8bafb9b10f962e6fa8bc6a844ee0b609eee34aaaa025065a7e3a7fe4678a005640f7dc286c2"
        ),

        test1Struct(
            kind: .SHA2_512,
            ikm: "60ab7f45b0ad534683b3a6c020d4f775",
            salt: "",
            info: "",
            size: 20,
            okm: "2109bd244744acae2b8caa9e70f57596ad680212"
        ),
        test1Struct(
            kind: .SHA2_512,
            ikm: "2d43e54bf0c94c9cbff4300f4aa69ab8",
            salt: "",
            info: "d674da3bb47d5c7e38b501e5251d9348af601c44",
            size: 20,
            okm: "ccd42097a730e47cd2908a834f9d81a3239f4b91"
        ),
        test1Struct(
            kind: .SHA2_512,
            ikm: "5b01b2da3166f217cdd68de8af60078f",
            salt: "",
            info: "6884cfa7ffe8f27bf4ebc6e46a7e01488c79243a",
            size: 64,
            okm: "01e10d4c477c906d4f67105e4a8054bd2e9479d726166893fcf77b5df431ad007c0ae42847d3706a770a5e468783c9519804be63a404112dcd4ecea952952b73"
        ),

    ]

    struct test2Struct {
        let kind: MessageDigest.Kind
        let ikm: Bytes
        let info: Bytes
        let size: Int
        let okm: Bytes

        init(kind: MessageDigest.Kind, ikm: String, info: String, size: Int, okm: String) {
            self.kind = kind
            self.ikm = Base64.hex2bytes(ikm)!
            self.info = Base64.hex2bytes(info)!
            self.size = size
            self.okm = Base64.hex2bytes(okm)!
        }
    }

    // Test vectors generated by running CryptoKit's x963DerivedSymmetricKey method on different data

    let tests2: [test2Struct] = [
        test2Struct(
            kind: .SHA2_256,
            ikm: "52e9b5dfeddf4b0383e0d24da6b19f30d6e8225aadb2fab3b3561e6aee0dd6c7",
            info: "",
            size: 0,
            okm: ""
        ),
        test2Struct(
            kind: .SHA2_256,
            ikm: "1e0d514e3f01c458f472bc2aa365b2a7726260c2e791fb9f0a66eab7b383f6a9",
            info: "0102030405",
            size: 20,
            okm: "5c91c528c2b174c445f491a97b8ed13cc39f2a6f"
        ),
        test2Struct(
            kind: .SHA2_256,
            ikm: "13cd01142d46cc427b75c407b4726e8a5e51de30f3a3e0cad991bbe58ad30fea",
            info: "01020304050102030405",
            size: 40,
            okm: "e258aa39dbf547470e49ea2538e252024dc2733242faf4c6ae2f57a96608c05ba9586119200b7d2c"
        ),

        test2Struct(
            kind: .SHA2_384,
            ikm: "dd2da0938f9a53c158a258af506fb8a7d9bcea98d4140eae0e28c1fa43e20a3a8dcc88b4fe61b2694b19706c3b8b5325",
            info: "",
            size: 0,
            okm: ""
        ),
        test2Struct(
            kind: .SHA2_384,
            ikm: "94e5d0d026b27ef66894cd059134f5967707c287a5da59d2ef9bdfb8be67a137dcc37f13f9f1c706670f8dc6f29f92c8",
            info: "0102030405",
            size: 20,
            okm: "b737e7406467bc9956301a636be00a94bbd26a12"
        ),
        test2Struct(
            kind: .SHA2_384,
            ikm: "198eda3dcf5b9bf4c5de6886a0b74bd4d3ccb857a804f0b0782e74cca229dfa82ee27e0d3c7b8a8f33e2e17679ff7921",
            info: "01020304050102030405",
            size: 40,
            okm: "f1ec6c9b83157dbc2549181f167a9a83135111a5ef360429b2c5ec73e403674c2294b94356742e75"
        ),

        test2Struct(
            kind: .SHA2_512,
            ikm: "0182bd0b8d982d78cded5dbad71e976c1a45962fc34d63c7858b0001665b49160d7b76d693f377ba8c5421d28867162a474ff53f68036aff8519fb5a5917138e6147",
            info: "",
            size: 0,
            okm: ""
        ),
        test2Struct(
            kind: .SHA2_512,
            ikm: "01e3e9f0755e3a413617546af11ee0e20d55b9cdfb511a5321d9bc455100dd2b719aee9b28cb66610376cd7982c23fb3c368564f8c0261f12d3d8e02030f66371c9d",
            info: "0102030405",
            size: 20,
            okm: "5905e2d8311ab22482ce3f9136f189feb1a8fd00"
        ),
        test2Struct(
            kind: .SHA2_512,
            ikm: "010dfaca57437b40a833df70ee86821c6829c73a2e9ec56131c608baf194bf1c36188c1e10baf9246241d09fb412a50a77dc2244bc973a7f2451799116c7b172a017",
            info: "01020304050102030405",
            size: 40,
            okm: "e45d3c6bae9a26108b21ae101f650195ba537cc31a25c846bb3b611686714c0f274e9647fb6306da"
        ),

    ]

    func testHKDF() throws {
        for t in tests1 {
            let okm = KDF.HKDF(t.kind, t.ikm, t.size, t.info, t.salt)
            XCTAssertEqual(okm, t.okm)
        }
    }

    func testX963KDF() throws {
        for t in tests2 {
            let okm = KDF.X963KDF(t.kind, t.ikm, t.size, t.info)
            XCTAssertEqual(okm, t.okm)
        }

    }

}
