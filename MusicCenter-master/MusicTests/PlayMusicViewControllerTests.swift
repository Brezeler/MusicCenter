//
//  PlayMusicViewControllerTests.swift
//  Music
//
//  Created by Thomas on 08/01/17.
//  Copyright © 2017 Brezeler. All rights reserved.
//

import XCTest
@testable import Music


class PlayMusicViewControllerTests: XCTestCase {
    
    
    func testDownloadFileFromURL() {
        let urlWebService = "http://musicThomas.nine-baguettes.fr/api/Music/song/5872aa0420d86843fc70e299"
        let url: URL = URL(string: urlWebService)!
        
        let mwb: PlayMusicViewController = PlayMusicViewController()
        mwb.downloadFileFromURL(url)
        XCTAssert(mwb.player != nil)
        
    }
    
    
    func testLoadImageFromUrl() {
        var MusicImage: UIImageView!

        let urlWebService = "http://musicThomas.nine-baguettes.fr/api/Music/image/5872aa0420d86843fc70e299"
        let mwb: PlayMusicViewController = PlayMusicViewController()
        mwb.loadImageFromUrl(url: urlWebService, view: MusicImage)
        XCTAssert(MusicImage != nil)
    }
    
    
}
