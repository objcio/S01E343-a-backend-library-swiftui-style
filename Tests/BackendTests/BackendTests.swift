import XCTest
import Backend

struct Profile: Rule {
    var id: UUID
    var rules: some Rule {
        "User Profile \(id)"
    }
}

struct Users: Rule {
    var rules: some Rule {
//        PathReader { comp in
//            if let id = UUID(uuidString: comp) {
//                Profile(id: id)
//            } else {
//                "Not found"
//            }
//        }
        "User Index"
    }
}

struct Root: Rule {
    var rules: some Rule {
        Users().path("users")
        "Index"
    }
}

final class BackendTests: XCTestCase {
    func testUsers() throws {
        XCTAssertEqual(Users().run(), Response(body: "User Index".toData))
    }
}
