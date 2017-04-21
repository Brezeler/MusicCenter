//
//  MusicWB.swift
//  Music
//
//  Created by Jordan Sejean  on 28/11/2016.
//  Copyright © 2016 Brezeler. All rights reserved.
//

import Foundation
class MusicWB: NSObject {
    
    func getAllMusics(_ completion: @escaping (_ result: [Music]) -> Void){
        
        var musics : [Music] = []
        let urlPath :String = "http://musicThomas.nine-baguettes.fr/api/Music/"
        
        
        let url: URL = URL(string: urlPath)!
        let session = URLSession.shared
        let task = session.dataTask(with: url, completionHandler: {data, response, error -> Void in
            
            if error != nil {
                // If there is an error in the web request, print it to the console
                print(error!.localizedDescription)
            }
            
            do{
                let jsonResult = try JSONSerialization.jsonObject(with: data!,  options: .allowFragments) as! NSArray
                
                musics = self.JSONToMusicsArray(jsonResult)
                completion(musics)
            }
            catch{
                print("error")
            }
        })
        task.resume()
    }
    func JSONToMusicsArray(_ jsonEvents : NSArray) -> [Music]{
        
        var music : [Music] = []
        
        for object in jsonEvents{
            let singers = (object as AnyObject).object(forKey: "singer") as! String
            let songs = (object as AnyObject).object(forKey: "name") as! String
            let ids = (object as AnyObject).object(forKey: "_id") as! String
            
            let newMusic : Music = Music(singer : singers, song : songs, id : ids)
            music.append(newMusic);
        }
        return music
    }
    
    
    
}
