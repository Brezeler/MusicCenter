//
//  MusicClassTests.swift
//  Music
//
//  Created by Thomas on 07/01/17.
//  Copyright © 2017 Brezeler. All rights reserved.
//

import XCTest
@testable import Music

class MusicClassTests: XCTestCase {
    
    
    func testMusicInit() {
        let m = Music(singer: "Cloclo", song: "le lundi au soleil", id: "testID")
        XCTAssertEqual(m.singer, "Cloclo")
        XCTAssertEqual(m.song, "le lundi au soleil")
        XCTAssertEqual(m.id, "testID")
    }
    
}
