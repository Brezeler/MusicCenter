//
//  Music.swift
//  Music
//
//  Created by Jordan Sejean  on 28/11/2016.
//  Copyright © 2016 Brezeler. All rights reserved.
//
import Foundation
open class Music : NSObject{
    
    var singer : String
    var song: String
    var id: String

    
    init(singer : String, song: String, id: String){
        self.singer = singer
        self.song = song
        self.id = id
    }
    
}

