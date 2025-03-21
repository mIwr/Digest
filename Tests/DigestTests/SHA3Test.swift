//
//  SHA3Test.swift
//  SwiftDigestTests
//
//  Created by Leif Ibsen on 05/10/2023.
//

import XCTest
@testable import Digest

final class SHA3Test: XCTestCase {

    // Test vectors from http://www.di-mgt.com.au/sha_testvectors.html

    func test1_224() throws {
        let md = MessageDigest(.SHA3_224)
        md.update(Util.s1)
        XCTAssertEqual(Base64.bytes2hex(md.digest()), "6b4e03423667dbb73b6e15454f0eb1abd4597f9a1b078e3f5b5a6bc7")
        md.update(Util.s2)
        XCTAssertEqual(Base64.bytes2hex(md.digest()), "e642824c3f8cf24ad09234ee7d3c766fc9a3a5168d0c94ad73b46fdf")
        md.update(Util.s3)
        XCTAssertEqual(Base64.bytes2hex(md.digest()), "8a24108b154ada21c9fd5574494479ba5c7e7ab76ef264ead0fcce33")
        md.update(Util.s4)
        XCTAssertEqual(Base64.bytes2hex(md.digest()), "543e6868e1666c1a643630df77367ae5a62a85070a51c14cbf665cbc")
        md.update(Util.s5)
        XCTAssertEqual(Base64.bytes2hex(md.digest()), "d69335b93325192e516a912e6d19a15cb51c6ed5c15243e7a7fd653c")
    }

    func test1_256() throws {
        let md = MessageDigest(.SHA3_256)
        md.update(Util.s1)
        XCTAssertEqual(Base64.bytes2hex(md.digest()), "a7ffc6f8bf1ed76651c14756a061d662f580ff4de43b49fa82d80a4b80f8434a")
        md.update(Util.s2)
        XCTAssertEqual(Base64.bytes2hex(md.digest()), "3a985da74fe225b2045c172d6bd390bd855f086e3e9d525b46bfe24511431532")
        md.update(Util.s3)
        XCTAssertEqual(Base64.bytes2hex(md.digest()), "41c0dba2a9d6240849100376a8235e2c82e1b9998a999e21db32dd97496d3376")
        md.update(Util.s4)
        XCTAssertEqual(Base64.bytes2hex(md.digest()), "916f6061fe879741ca6469b43971dfdb28b1a32dc36cb3254e812be27aad1d18")
        md.update(Util.s5)
        XCTAssertEqual(Base64.bytes2hex(md.digest()), "5c8875ae474a3634ba4fd55ec85bffd661f32aca75c6d699d0cdcb6c115891c1")
    }

    func test1_384() throws {
        let md = MessageDigest(.SHA3_384)
        md.update(Util.s1)
        XCTAssertEqual(Base64.bytes2hex(md.digest()), "0c63a75b845e4f7d01107d852e4c2485c51a50aaaa94fc61995e71bbee983a2ac3713831264adb47fb6bd1e058d5f004")
        md.update(Util.s2)
        XCTAssertEqual(Base64.bytes2hex(md.digest()), "ec01498288516fc926459f58e2c6ad8df9b473cb0fc08c2596da7cf0e49be4b298d88cea927ac7f539f1edf228376d25")
        md.update(Util.s3)
        XCTAssertEqual(Base64.bytes2hex(md.digest()), "991c665755eb3a4b6bbdfb75c78a492e8c56a22c5c4d7e429bfdbc32b9d4ad5aa04a1f076e62fea19eef51acd0657c22")
        md.update(Util.s4)
        XCTAssertEqual(Base64.bytes2hex(md.digest()), "79407d3b5916b59c3e30b09822974791c313fb9ecc849e406f23592d04f625dc8c709b98b43b3852b337216179aa7fc7")
        md.update(Util.s5)
        XCTAssertEqual(Base64.bytes2hex(md.digest()), "eee9e24d78c1855337983451df97c8ad9eedf256c6334f8e948d252d5e0e76847aa0774ddb90a842190d2c558b4b8340")
    }

    func test1_512() throws {
        let md = MessageDigest(.SHA3_512)
        md.update(Util.s1)
        XCTAssertEqual(Base64.bytes2hex(md.digest()), "a69f73cca23a9ac5c8b567dc185a756e97c982164fe25859e0d1dcc1475c80a615b2123af1f5f94c11e3e9402c3ac558f500199d95b6d3e301758586281dcd26")
        md.update(Util.s2)
        XCTAssertEqual(Base64.bytes2hex(md.digest()), "b751850b1a57168a5693cd924b6b096e08f621827444f70d884f5d0240d2712e10e116e9192af3c91a7ec57647e3934057340b4cf408d5a56592f8274eec53f0")
        md.update(Util.s3)
        XCTAssertEqual(Base64.bytes2hex(md.digest()), "04a371e84ecfb5b8b77cb48610fca8182dd457ce6f326a0fd3d7ec2f1e91636dee691fbe0c985302ba1b0d8dc78c086346b533b49c030d99a27daf1139d6e75e")
        md.update(Util.s4)
        XCTAssertEqual(Base64.bytes2hex(md.digest()), "afebb2ef542e6579c50cad06d2e578f9f8dd6881d7dc824d26360feebf18a4fa73e3261122948efcfd492e74e82e2189ed0fb440d187f382270cb455f21dd185")
        md.update(Util.s5)
        XCTAssertEqual(Base64.bytes2hex(md.digest()), "3c3a876da14034ab60627c077bb98f7e120a2a5370212dffb3385a18d4f38859ed311d0a9d5141ce9cc5c66ee689b266a8aa18ace8282a0e0db596c90b0a7b87")
    }

    // NIST CAVP test vectors

    struct testStruct {
        let seed: Bytes
        let output: Bytes

        init(seed: String, output: String) {
            self.seed = Base64.hex2bytes(seed)!
            self.output = Base64.hex2bytes(output)!
        }
    }

    let testsSHA3_224: [testStruct] = [
        testStruct(
            seed: "",
            output: "6b4e03423667dbb73b6e15454f0eb1abd4597f9a1b078e3f5b5a6bc7"
        ),
        testStruct(
            seed: "01",
            output: "488286d9d32716e5881ea1ee51f36d3660d70f0db03b3f612ce9eda4"
        ),
        testStruct(
            seed: "d148ce6d",
            output: "0b521dac1efe292e20dfb585c8bff481899df72d59983315958391ba"
        ),
        testStruct(
            seed: "e4ea2c16366b80d6",
            output: "7dd1a8e3ffe8c99cc547a69af14bd63b15ac26bd3d36b8a99513e89e"
        ),
        testStruct(
            seed: "f50086b4dc7bca0baec0076a878dd89571d52e47855b",
            output: "e39aa96fad581961bda032ed33dce36defde958baf9bae5dc558cf89"
        ),
        testStruct(
            seed: "ddf48f4cdc856c448326092dcf6bfc4ebcf4b36fc2e516eba0956807588b6e827b",
            output: "6cd83ba70e1bd387d603ab14c9fdcbf9862d2ebf0987215f011abee8"
        ),
        testStruct(
            seed: "0f170afafcefdfa8b0de328dab30b4e44d98d6aea2bc39557ff4658fce4fbf8526d8b5359f173c14e4da7cf88935c9369fc7d607863f25",
            output: "fe7e59028c7855c37ae3dc5ee324864cfee6b8bccc2c3b5a410b65d9"
        ),
        testStruct(
            seed: "ecd9e95f7c5efc8336f80fe67e113657b31482bafc22dc5b45073482846cdc48414d2ea855ae75d9f28a0bdbe30dbe511503788e578f20f25e20bb770ca1d787f2f02911139275dbeaa5ae1aaf155f40d7134915dac34d0938358dc8be97cf1005a922bf3d71c331282f41c86993e0ccff",
            output: "6950ad0f91398b39965b1859ea918c531212face1e51d4d390f094e1"
        ),
        testStruct(
            seed: "31c82d71785b7ca6b651cb6c8c9ad5e2aceb0b0633c088d33aa247ada7a594ff4936c023251319820a9b19fc6c48de8a6f7ada214176ccdaadaeef51ed43714ac0c8269bbd497e46e78bb5e58196494b2471b1680e2d4c6dbd249831bd83a4d3be06c8a2e903933974aa05ee748bfe6ef359f7a143edf0d4918da916bd6f15e26a790cff514b40a5da7f72e1ed2fe63a05b8149587bea05653718cc8980eadbfeca85b7c9c286dd040936585938be7f98219700c83a9443c2856a80ff46852b26d1b1edf72a30203cf6c44a10fa6eaf1920173cedfb5c4cf3ac665b37a86ed02155bbbf17dc2e786af9478fe0889d86c5bfa85a242eb0854b1482b7bd16f67f80bef9c7a628f05a107936a64273a97b0088b0e515451f916b5656230a12ba6dc78",
            output: "aab23c9e7fb9d7dacefdfd0b1ae85ab1374abff7c4e3f7556ecae412"
        ),
        testStruct(
            seed: "b7174dd7242f30f5bcd81cb23c6f52617ff1290845b0f8b4344b36101cdce0367f731bc551c41b34fc1c4366a79a8e7eb89b2df4977672e9b56aecb7ced4d4cd6ba5a7baaa14158741901a4ac1f96bf8180f137b5a2b5e04c12df6a3f2b54c15819639ddb887e696941ce98711f5b078a73623c4153685b05d7c9bfb10e711b6cb2c195602865508fca8f7441ff727a56ef6a5f85001af93933f25e8b0d2eb5951508f4e10772b85821c8daa746596287438e03e94f3a3556a5eda915bdea1a61aebe2ed6bc330b72d60f3e197a8c6a8c2e51dbf67742b9febc1031f9873fd442ee35b5a9ad32c43055d711010297fce5ee3a4a254ec0d191c50e7b9f0f9c5dc952242be250ee7d412f94f5f684f8842521cbd10e0c3126a07f4d088ead8c215578edf4095db28105d1dd4f72681ababa676b0319562023ab49304b30e78bc987d11790971a4b99fedb24900d229aeb160dbc42cfa2fa5332916cc63e4417b0c0f92594041d0602aca9ef6a1f5ae5afd8a32422a9793c3fb706670c0f59cc61a13f8c80e8ec7e659fdcb2303167877372b637252f5f7233a916938f1c8ef666a932d0c9bdef013d38d1f184ebdefcd074c559ccd9bc18e9992096c1fe5a324a396186d0ebcb5ae4182841ca9727b2313f4f208c2115bccbf7d2d5371d521c66d25a1358fad7d814ae5e1793cbe8443062b21fe5ae02ba55659bd36101fd0147247b0aa483bb15297bd1d75302872f386f9cac5bd8f9be1032fa05d234b17d857042d165eedb7eacf122259ad39adfc3b67d5a612a611477006c010d3e260d8c76400bffc4bf8119becd76dda779d26cf7c2be981aef7a045e60497486b12dd687012ee48dedc8ea35424f8e06caa38e741b2d6342eb4b429d85439a96e94afe22f49ea6a2dcc2b8e51f144e7a03dfc2ebc53b450aeb04bc5e298401e735016deaa8efd8bc12eae05ec2697169abc3849f7f7cd00b6532dc10fb8f2d103adda04e7ca6dd3206be0af2cac3a95e291b5e3fa84676acf0521c4649d98e7a513c2fbf0e38369d4ec89351969758d00223ba2cbe4cbb6802ef176eb2d798be2ea986ccdc387766518713ebb468f267cd9922e74fd410d52366381ab51dfe3419b22fe8450c12159565f731b2bd287df1d8130fdb91097cc85408aacf210174a8c295a1f7478933a101d7b400184d9b155d1506cfe827b76834f3cf7f6555085267427a515f6f38fad710032aeee4378eb4a35cbb6dde2d8995a3c9347f6b67bd1cd0e1f1d816ae19524a7fa1c58eebe46b48821c86af37b2d273588cb3b70b3f6fab794736220b72ffe1a9f3109010aced7f0771c71d7e6a980cddf6c6ca7b5fbc4c90cffe13c99e5c60129d74ba5e5eb7b16d49a3ab5a1732bac9f10d0820a4af3ed90a945e70f1e4603a1f56402d60567a1402a0cb635f5f07bd0a1b02a39494fca2659d848a24344c90e739d3f6584643ac4b43102299599e27a0654c6ca629f09d9f7e088d9ba89fb78383e851ad03a896620efc005bdec88a627047f46fcad51ae6ba6ce3decdd40e72e8ffb7e51b13530568f1852d4b3165cec087d347e3f4baf9d724355410740643cd8ca187090e72a3e58339642b433a23da7e71c521e9ee3768c0ea922d1",
            output: "b5151a41c59cc98cab7b493dae476f5a2d8b6dd9fd8ff982eca3907f"
        ),
    ]

    let testsSHA3_256: [testStruct] = [
        testStruct(
            seed: "",
            output: "a7ffc6f8bf1ed76651c14756a061d662f580ff4de43b49fa82d80a4b80f8434a"
        ),
        testStruct(
            seed: "e9",
            output: "f0d04dd1e6cfc29a4460d521796852f25d9ef8d28b44ee91ff5b759d72c1e6d6"
        ),
        testStruct(
            seed: "0296f2c40a",
            output: "53a018937221081d09ed0497377e32a1fa724025dfdc1871fa503d545df4b40d"
        ),
        testStruct(
            seed: "4149f41be1d265e668c536b85dde41",
            output: "229a7702448c640f55dafed08a52aa0b1139657ba9fc4c5eb8587e174ecd9b92"
        ),
        testStruct(
            seed: "94464e8fafd82f630e6aab9aa339d981db0a372dc5c1efb177305995ae2dc0",
            output: "ea7952ad759653cd47a18004ac2dbb9cf4a1e7bba8a530cf070570c711a634ea"
        ),
        testStruct(
            seed: "5a72e0e1aec82a6541f04883bb463b0c39c22b59431cfb8bfd332117a1afb5832ce5c76a58fcf6c6cb4e3e6f8e1112de",
            output: "90fc3193552ec71d3315ebbb807913afd4cd2f0833a65e40d011d64de5e66513"
        ),
        testStruct(
            seed: "d65b9f881d1fc7f17d6dd429faca8404e6ce60fba7d89b7fba003c8ef84d8083182979327611fc341291ba80dc70ad3b2f28b6d29b988445e7fdb7c6561f45822ac81dbf677a0b27d961dc6358",
            output: "51cc71b6934afcf28fa49942b76323f36cd6a0aecc5a0e49c10994ddcabdbb80"
        ),
        testStruct(
            seed: "8d93627c0b7cbf61a7fe70e78c2c8ed23b1344b4cfed31bd85980dd37b4690e5b8758f7d6d2269957a39a1ac3451cc196696ae9e9606a04089e13456095a1ce1e593481b3ac84f53f1cb10f789b099f316c948398ad52fa13474bdf486de9b431bd5d57ef9d83a42139a05f112b2bd08",
            output: "344ec86642eabb206b2fd930e4c5dde78aa878577d6c271cb0069d4999495652"
        ),
        testStruct(
            seed: "b1caa396771a09a1db9bc20543e988e359d47c2a616417bbca1b62cb02796a888fc6eeff5c0b5c3d5062fcb4256f6ae1782f492c1cf03610b4a1fb7b814c057878e1190b9835425c7a4a0e182ad1f91535ed2a35033a5d8c670e21c575ff43c194a58a82d4a1a44881dd61f9f8161fc6b998860cbe4975780be93b6f87980bad0a99aa2cb7556b478ca35d1f3746c33e2bb7c47af426641cc7bbb3425e2144820345e1d0ea5b7da2c3236a52906acdc3b4d34e474dd714c0c40bf006a3a1d889a632983814bbc4a14fe5f159aa89249e7c738b3b73666bac2a615a83fd21ae0a1ce7352ade7b278b587158fd2fabb217aa1fe31d0bda53272045598015a8ae4d8cec226fefa58daa05500906c4d85e7567",
            output: "cb5648a1d61c6c5bdacd96f81c9591debc3950dcf658145b8d996570ba881a05"
        ),
        testStruct(
            seed: "c8a2a26587d0126abe9ba8031f37d8a7d18219c41fe639bc7281f32d7c83c376b7d8f9770e080d98d95b320c0f402d57b7ef680da04e42dd5211aacf4426ecca5050ca596312cfae79cee0e8c92e14913cc3c66b24ece86c2bfa99078991faad7b513e94f0b601b7853ddb1eb3c9345f47445a651389d070e482ea5db48d962820257daf1cbe4bb8e5f04a3637d836c8c1bc4d83d6eda5f165f2c2592be268412712ae324ef054bb812f56b8bc25c1d59071c64dd3e00df896924c84575817027861faa5f016c5c74142272daa767e8c9dacee4c732ab08b5fa9ad65a0b74c73fb5a889169f645e50d70e41d689415f7d0b4ec071e9238b5a88110856fc6ae9b9944817e21597d1ccd03b60e60472d1e11d3e9063de24a7b59609b6a2a4ee68238690cf2800614746941c48af9566e07494f0dd236e091e75a8f769e3b179b30c10f5277eec7b3f5c97337189b8b82bc5e717ff27355b2009356caa908e976ae1d7f7a94d36202a8d5e03641aeac0e453a8168ee5a0858ceecfcbf11fb8c1f033201add297a0a89476d2ea8b9a82bda8c3c7ef4f55c3295a4ecb7c607ac73d37eadc13b7a2494ec1928f7a80c8d534efe38a3d9ccb4ccdab9f092a1def6478532c5ad3cd5c259b3812600fa89e6d1e228114795d246cedc9c9fff0d1c1297a5ddfc1169c2efb3800df8dd18a8511214785abcc1bc7eb31bdb2f5f70358dfe860ed5a03ab7e95cc21df5ee7aee68be568d6985e5c1e91408e4432663b1c4e6d613d6dc382b5b900a4fc1b7a9c27a1138c5e2356ab9026c34465006602753daf6ab7427da93c307c901d0bb1ddb21c53bc0493dd8d857161e8ffa51fdecb75568243205aa979c2e7ed2a77b5f8edc34cffb0321a8c653bc381f96ab85a86bf0bb2c9518208d636eac40aa7ad754260a75d4a46362f994c90173b975afb0ee17601311b1c51ba562c1ca7e3c2dd18b90bdebb1858fe876c71b3ad742c4bcba33e7763c750098de856fde8731cb6d698218be9f0a98298630e5b374957d126cf0b1c489c48bab6b50f6fb59ee28be6c3916bbd16514234f80e1ac15d0215852b87f9c6e429eb9f85007bf6ae3de1af0202861fd177c7c4f51af533f956a051815815c6e51e25af20d02893e95442991f1de5f86a4397ae20d9f675657bf9f397267831e94cef4e4d287f759850350ce0898f2e29de3c5c41f4246fe998a8d1359a2bed36ded1e4d6b08682025843700fee8cab56703e342212870acdd53655255b35e414fa53d9810f47a37195f22d72f6e555392023a08adc282c585b2ae62e129efccdc9fe9617eecac12b2ecdabd247a1161a17750740f90ebed3520ceb17676f1fa87259815ff415c2794c5953f689c8d5407dbbd10d1241a986e265cea901af34ec1ded0323ca3290a317208ba865637af4797e65b9cfcad3b931bbf6ac896623e2f4408529172911f1b6a9bcae8279ec7e33452d0cd7b026b46a99cbe8a69cd4d21cdc6d3a84002fab527c4fd18a121526d49890ced3fb89beb384b524015a2e03c049241eb9",
            output: "b8d4b29b086ef6d6f73802b9e7a4f2001e384c8258e7046e6779662fd958517e"
        ),
    ]

    let testsSHA3_384: [testStruct] = [
        testStruct(
            seed: "",
            output: "0c63a75b845e4f7d01107d852e4c2485c51a50aaaa94fc61995e71bbee983a2ac3713831264adb47fb6bd1e058d5f004"
        ),
        testStruct(
            seed: "80",
            output: "7541384852e10ff10d5fb6a7213a4a6c15ccc86d8bc1068ac04f69277142944f4ee50d91fdc56553db06b2f5039c8ab7"
        ),
        testStruct(
            seed: "11587dcb",
            output: "cb6e6ce4a266d438ddd52867f2e183021be50223c7d57f8fdcaa18093a9d0126607df026c025bff40bc314af43fd8a08"
        ),
        testStruct(
            seed: "65b27f6c5578a4d5d9f6519c554c3097",
            output: "dd734f4987fe1a71455cf9fb1ee8986882c82448827a7880fc90d2043c33b5cbc0ed58b8529e4c6bc3a7288829e0a40d"
        ),
        testStruct(
            seed: "2dc3d789582c1a806c3b491d5972ef8f1733f1f5e02866dc9de2a8029ec0ab608d13",
            output: "05a3903b519cdf679120c7ccb4ef178b58e4502fcd461360988fa06669294851e629d9dd3e77ffb73d24599d5d3edd36"
        ),
        testStruct(
            seed: "77a9f652a003a83d22fb849b73fed7d37830c0dc53f89cea7dbec24e14f37197765206fe0e6672016e4dec4d9ebbe3e1b4423771a5d0a8",
            output: "29c8bb39bb2aad419a00a80216ec71ec5ec9ab54c41927e3e3f2f48f079a5886d7fe89db98c807ab686d2339001d6252"
        ),
        testStruct(
            seed: "00ce225eaea24843406fa42cc8450e66f76ac9f549b8591f7d40942f4833fc734a034c8741c551d57ddafb5d94ceb4b25680f045038306e6bcc53e88386e2b45b80b3ba23dec8c13f8ca01c202ae968c4d0df04cdb38395d2df42a5aff646928",
            output: "81d6e0d96575a9b8ca083ee9ec2ead57ddf72b97d7709086a2f4a749d3f61d16423463487562c7f09aba1b26e8cae47b"
        ),
        testStruct(
            seed: "92c41d34bd249c182ad4e18e3b856770766f1757209675020d4c1cf7b6f7686c8c1472678c7c412514e63eb9f5aee9f5c9d5cb8d8748ab7a5465059d9cbbb8a56211ff32d4aaa23a23c86ead916fe254cc6b2bff7a9553df1551b531f95bb41cbbc4acddbd372921",
            output: "71307eec1355f73e5b726ed9efa1129086af81364e30a291f684dfade693cc4bc3d6ffcb7f3b4012a21976ff9edcab61"
        ),
        testStruct(
            seed: "5fe35923b4e0af7dd24971812a58425519850a506dfa9b0d254795be785786c319a2567cbaa5e35bcf8fe83d943e23fa5169b73adc1fcf8b607084b15e6a013df147e46256e4e803ab75c110f77848136be7d806e8b2f868c16c3a90c14463407038cb7d9285079ef162c6a45cedf9c9f066375c969b5fcbcda37f02aacff4f31cded3767570885426bebd9eca877e44674e9ae2f0c24cdd0e7e1aaf1ff2fe7f80a1c4f5078eb34cd4f06fa94a2d1eab5806ca43fd0f06c60b63d5402b95c70c21ea65a151c5cfaf8262a46be3c722264b",
            output: "3054d249f916a6039b2a9c3ebec1418791a0608a170e6d36486035e5f92635eaba98072a85373cb54e2ae3f982ce132b"
        ),
        testStruct(
            seed: "23cd7e8b7828a0ceed470598e88bde61d1487d471abd71a87c4af3ef83dd81ae4caec8ee8e2cc7c3d7363223188f14f7648cb973f510cba370babb47695d62e12ab1e90cb048e60ff7c3c7b278457451ef28302e61efc00b5e7cd0f98484926b443fa88ee96444ddd5548ef00e954694fa83aa2167429a08cef7faacd938587322c1ce1c3e682a53fa534d82e468d1eb0e05eff40ef19fc1499300087262fb214d9d235db93ce099ed26cd1302a45e7cb216c64e5fe5185f56b8acb756ebc49e4c3d6ffa61c8aed83637d6496e33356f6e1ef8d760044c097ecec45e8db9fb12a7077a9a3ef5dc385eec30cc32fb9eedca854e381b3785e8483d11a820b6e8a5e7650ce659a9b1e0ecafa24556e6e11e4fb38d19986709243c6e5b3a16c8d27d93beec86b9cd76f968e7f55ce0db452984118021de7a22e4e2c76abf77d903c53379e321664a74aa5bfbf1b8dac11336f105eef9f55a1550c3b105dd4bd0c1a35000b95f6906f01c4c555e024b82946f1ff89e49e5ed2d926695f63c9b95553f71ba36eac9eb3576c35c04e13c050dfa955359b8b61db1cf53d903856e1007c21e0f21678ee08ae14878abfeb432c9ffdb7ce7ee71d0e83213e7f560cd291e54df674481c1cc368564111a00bbf10fa77add10941ef01be02d259374bfc8e41c3d2a65de699982899e8f1a90592a2619f9dc9c52c364930429fda76a4cd59f43bfc04d268e2eb6167f5b735697c5577ee0e352cf6a1495c490d6f7e97c3898f0ee92c40238731a538edbedf97caaeafeb859fbb41ae86c48e9174d9a58d9174c5006921a7050f56953784f2211c227c008a65fa8dcc85fb9bc2a6f25e7a0637f6f857e153dad917f569a63785df355ed58314654b79cb53f927625313276c6b0d378519ba87234be20aaefa46826beac3164785fb34cb701f16339663f4186080245d356b887274e380ebc4d3a44a82619a6bc72d8c0ad286459716e18ebecae8656cceb75d4b2562630921cdc335c839a60dc352fe1dfdb70c097eec55a40cae7110405e7421cfe737739b955dd22ea3cf89e4fbf9594439f0071914c78ca86abe0434a17b7af70a64a78cbad28418386d7cb6990c515887881c8fcb72bd1085c2a50620c1cb1d1471318faecfe037700652b2aab5aabd183ac63da0e5d9f788156f4f6ce5a6b4cde39e2f01b46aeee320a853b173a9c4649e70cd157f57affa3cef7ae66572506f4249b5242e88b0fa52fa243dc4f3011519b89899cdbabc549f92131dbfd272a103b0ecb67cbe203e03a4beb037fb1572331a3ace4f77af1fb3f39283533b8debbe8020194d9fbf26b9546db93b46543480f22df38312eab4208093a7de0214a7c933e9cd0f91d03cfa65bba94d596fa479fcecc9f71111da4bc5710baeeab98dba28b452413925e93d754310fca8aa7a8486f1b219f696cabc3ec51f4449bed607eb1a49610a02c3f8ff8e70a7b8970f471cc74c6a37fc3df8690a633ca3c74948f786031d690955c350e8590d0dd7db284ae7d97659b48c76b0ab78068d552fe3da821fa4eaac071335fb2a6b1cdf76ae8dde19bcd0523ebdb242be206adb227f10891fb6035d606f0b3175606a006a5052146dac4047dd33f",
            output: "b6b1090cdb31627388f87c4fbe6253464215b812169a48fc8897d64e7b004742da4891264f0ce2bd2512f48a03c0afc7"
        ),
    ]

    let testsSHA3_512: [testStruct] = [
        testStruct(
            seed: "",
            output: "a69f73cca23a9ac5c8b567dc185a756e97c982164fe25859e0d1dcc1475c80a615b2123af1f5f94c11e3e9402c3ac558f500199d95b6d3e301758586281dcd26"
        ),
        testStruct(
            seed: "e5",
            output: "150240baf95fb36f8ccb87a19a41767e7aed95125075a2b2dbba6e565e1ce8575f2b042b62e29a04e9440314a821c6224182964d8b557b16a492b3806f4c39c1"
        ),
        testStruct(
            seed: "4775c86b1c",
            output: "ce96da8bcd6bc9d81419f0dd3308e3ef541bc7b030eee1339cf8b3c4e8420cd303180f8da77037c8c1ae375cab81ee475710923b9519adbddedb36db0c199f70"
        ),
        testStruct(
            seed: "133b497b00932773a53ba9bf8e61d59f05f4",
            output: "783964a1cf41d6d210a8d7c81ce6970aa62c9053cb89e15f88053957ecf607f42af08804e76f2fbdbb31809c9eefc60e233d6624367a3b9c30f8ee5f65be56ac"
        ),
        testStruct(
            seed: "4c66ca7a01129eaca1d99a08dd7226a5824b840d06d0059c60e97d291dc4",
            output: "567c46f2f636223bd5ed3dc98c3f7a739b42898e70886f132eac43c2a6fadabe0dd9f1b6bc4a9365e5232295ac1ac34701b0fb181d2f7f07a79d033dd426d5a2"
        ),
        testStruct(
            seed: "a225070c2cb122c3354c74a254fc7b84061cba33005cab88c409fbd3738ff67ce23c41ebef46c7a61610f5b93fa92a5bda9569",
            output: "e815a9a4e4887be014635e97958341e0519314b3a3289e1835121b153b462272b0aca418be96d60e5ab355d3eb463697c0191eb522b60b8463d89f4c3f1bf142"
        ),
        testStruct(
            seed: "881ff70ca34a3e1a0e864fd2615ca2a0e63def254e688c37a20ef6297cb3ae4c76d746b5e3d6bb41bd0d05d7df3eeded74351f4eb0ac801abe6dc10ef9b635055ee1dfbf4144",
            output: "9a10a7ce23c0497fe8783927f833232ae664f1e1b91302266b6ace25a9c253d1ecab1aaaa62f865469480b2145ed0e489ae3f3f9f7e6da27492c81b07e606fb6"
        ),
        testStruct(
            seed: "664ef2e3a7059daf1c58caf52008c5227e85cdcb83b4c59457f02c508d4f4f69f826bd82c0cffc5cb6a97af6e561c6f96970005285e58f21ef6511d26e709889a7e513c434c90a3cf7448f0caeec7114c747b2a0758a3b4503a7cf0c69873ed31d94dbef2b7b2f168830ef7da3322c3d3e10cafb7c2c33c83bbf4c46a31da90cff3bfd4ccc6ed4b310758491eeba603a76",
            output: "e5825ff1a3c070d5a52fbbe711854a440554295ffb7a7969a17908d10163bfbe8f1d52a676e8a0137b56a11cdf0ffbb456bc899fc727d14bd8882232549d914e"
        ),
        testStruct(
            seed: "8237ce9396ccde3a616754414cdf7b5a958c1eb7f25a48c2781b4e0dba220f8c350d7b02ece252b94f5e2e766189c4ac1a8e67f00acacead402316196a9b0a673e24a33f18b7cb6be4a066d33e1c93abd8252feb1c8d9cff134ac0c0861150a463264e316172d0b8e7d6043f2bbf71bf97fa7f9070ca3a21b93853ec55ab67a96db884c2113bea0822a70ea46f9ae5501eb55ec74eaa3179fa96d7842092d9e023844ed96f3c9fc35bbc8ee953d677c636fdd578fd5507719e0c55702fed2eaf4f32b35ec29a7a515bbc8bf61f9baf89a77aeb8bc6f247706c41d398cae5ec80b76abc3a5380001aea500eb31b10160139d5a8e8f1a976dd2dde5ce439a29dba24d370536a14bb87cf201e088e5e3397b3b61477c6a41e22a98af53cc34bc8c55f15d7924e7e32fed4d3c3ddc2ac8eb1dfc438218c08c6a6a8eea888b208f6092dd9f9df49e7ede8bf11051afd23b0b983a81bcc8d00f7d1f2b27cb04c03aeee59c7df23a17775ae5984eda7",
            output: "f08819ec3a9a9806a1f55be4f0e56bce084e66fa271784974bf80e1bed7b2be559ebf5b6396ce52f7db7ef45543965f83064095a70328489178718b491a4100d"
        ),
        testStruct(
            seed: "85ff5f072442756665a41f36cb2c99d3152f3458bfc3fcb5cc759901c33f7311f8b41a490c7ee4b2b70ad84dc582caa75ffcc8ae8cf1b5c3f8f03410f393c81cbcb3399c00d8398d9ef3477fad50d434c0c6a469683178f4fb22ea0f94d498f45b6284aa0738bb1ea1c735758a7efda1bff591325c6b8c6f5f7282a6afe92cc05d2bc5182986b38e48ef6ad764f38e17e5f157b16f873a5dab4ac67c4bbacca94875c2916eaa69041bd1ae4c4499cebdb822be8da96dcae668117c3a702fbfd7a6a744bbdf8c25a9a3d6c97c315707bcc2f18e6f120584311d2e6d8726304f71fe2b133e83152fa46766821033157f3b8bc48efeb338af67520b610c76a5c29fd968f7c3632bce1eefeaa2b052bb8063990487e393ec95af900f20716776618bbec6b8f285b74c3fc4c8f2039732505b761a42c5ba0a7c325da2715d028b745a35ad1d72f3a2ef2e6d6a37b20960374caa6c844d317bad18442c1d784ecc4337c685f0ecb5d2001472363c64b02e7f5ebb641823ff257088ca15ed6b53221548fab6f707d131c6185c96c8c295846eb83369c5ee2cf20daa79c6a6de197334b558a8fb6c51a68b63b2f1a274bf4b4e839ae25256c1c9cba7d8a51378a9a9e6a769c4c3c23c18951cfcaf9321366965e676398805c591f3a76f1bfbe20aaa7446b37019b29b712e6cc337637103c8fc0a51d52fa04034cdd1c79125c4446026b9c015c3e475989c7b8df3da0e2d4e5a17b21e0fd23b99a14e676d5ac460b14329181c8affd2752770e54abf9dbce5c934227cef40bca8b746d718628d658715bd41eb36acbbf0197450a4dcc9b9748f8928579895ce4956e0a0fb05c55bc9e29ec5ec8f9236f1b8ae5869f7372be3f53f4c17d3777664c844497d0b154a5ff3f32c865c5a4e604e478402d9921a1a437e1624668fbee1539b5a053b243b3090e5fc2067ab082521665cd54a808f00c16d0fe71984ada8400d5cfd5e9b3526009cbf24762e6e287934694b12a9907fb735bec6b6fe4ba2d7c1d6cc3c2141288d3ffcf9528a8752a0d932cdf8b7287e6cfdab2a03a7a1b55fe050da9d5f661f7df63c07c3685b89dd7c40c1c54f5ce629ee5f7cca24b6ca2291528f49fcacf119eb06b69170f3b677451990411b369d36306122d12093ca66fd655307a11b87a943e26e834956c2b75d47a334c3bd8cdbea3986e1413e9b744b108ea1f6bcc975295897629c8c93e5ec526166eff99b6045700ec12fc12794a4dca8dda2969fc4c3f199f6109e134919c0319f46f3b30c688d243b9324540d305009844eb1f2e03934dc074e93282a0d1b7da670b2ba287b182f1515",
            output: "6d87f523d51ebfc11fffb33357ed7ff3e4051f58a52d45fba208429ee5b53995e5129d35e3b8d3448a3f56d32dbfdc762a1458569c839a4a1c57b4d69251f565"
        ),
    ]
    
    func doTest(_ mdKind: MessageDigest.Kind, _ tests: [testStruct]) {
        let md = MessageDigest(mdKind)
        for t in tests {
            md.update(t.seed)
            XCTAssertEqual(md.digest(), t.output)
        }
    }

    func test2_224() {
        doTest(.SHA3_224, testsSHA3_224)
    }

    func test2_256() {
        doTest(.SHA3_256, testsSHA3_256)
    }

    func test2_384() {
        doTest(.SHA3_384, testsSHA3_384)
    }

    func test2_512() {
        doTest(.SHA3_512, testsSHA3_512)
    }

}
