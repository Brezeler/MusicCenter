//
//  MusicWB.swift
//  Music
//
//  Created by Thomas on 08/01/17.
//  Copyright © 2017 Brezeler. All rights reserved.
//

import XCTest
@testable import Music

class MusicWBTests: XCTestCase {
    
    func testGetAllMusics(){
        let mwb : MusicWB = MusicWB()
            mwb.getAllMusics(){
                (result: [Music]) in
                XCTAssert(result != [])
            }
            
        }
    
    
    
    func testJSONToMusicsArray() {
        
        //TODO
        
        var musics : [Music] = []
        let urlPath :String = "http://musicThomas.nine-baguettes.fr/api/Music/"
        let mwb : MusicWB = MusicWB()
        
        
        
        let url: URL = URL(string: urlPath)!
        let session = URLSession.shared
        let task = session.dataTask(with: url, completionHandler: {data, response, error -> Void in
            
            if error != nil {
                // If there is an error in the web request, print it to the console
                print(error!.localizedDescription)
            }
            
            do{
                let jsonResult = try JSONSerialization.jsonObject(with: data!,  options: .allowFragments) as! NSArray
                
                musics = mwb.JSONToMusicsArray(jsonResult)
                XCTAssert(musics != [])
            }
            catch{
                print("error")
            }
        })
        task.resume()
    }
    
    
}
