import XCTest
@testable import SpinlineEmbed

final class SpinlineEventTests: XCTestCase {
    func testParsesResult() throws {
        let e = try XCTUnwrap(SpinlineEvent(json: #"{"source":"spinline","type":"result","game":"LUDO","won":true,"net":40}"#))
        XCTAssertEqual(e.type, "result")
        XCTAssertEqual(e.game, "LUDO")
        XCTAssertTrue(e.won)
        XCTAssertEqual(e.net, 40)
    }

    func testRejectsOtherSendersAndMalformed() {
        XCTAssertNil(SpinlineEvent(json: #"{"source":"other","type":"result"}"#))
        XCTAssertNil(SpinlineEvent(json: #"{"source":"spinline"}"#))
        XCTAssertNil(SpinlineEvent(json: "not json"))
        XCTAssertNil(SpinlineEvent(body: [1, 2]))
    }

    func testExposesErrorAndResizeFields() throws {
        XCTAssertEqual(try XCTUnwrap(SpinlineEvent(json: #"{"source":"spinline","type":"error","code":"LAUNCH_USED","message":"used"}"#)).code, "LAUNCH_USED")
        XCTAssertEqual(try XCTUnwrap(SpinlineEvent(json: #"{"source":"spinline","type":"resize","height":720}"#)).height, 720)
    }

    func testVersionIsSet() {
        XCTAssertTrue(spinlineSdkVersion.range(of: #"^\d+\.\d+\.\d+"#, options: .regularExpression) != nil)
    }
}
