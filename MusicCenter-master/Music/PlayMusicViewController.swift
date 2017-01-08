//
//  PlayMusicViewController.swift
//  Music
//
//  Created by Jordan Sejean  on 28/11/2016.
//  Copyright © 2016 Brezeler. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class PlayMusicViewController: UIViewController {
    
    var player : AVAudioPlayer! = nil
    var music: Music!
    @IBOutlet weak var MusicImage: UIImageView!
    
    @IBOutlet weak var nameMusic: UILabel!
    
    @IBOutlet weak var nameSinger: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameMusic.text = music.song
        self.nameSinger.text = music.singer
        let urlWebService = "http://musicThomas.nine-baguettes.fr/api/Music/song/" + music.id
        let url = URL(string: urlWebService)
        let urlWBKImage = "http://musicThomas.nine-baguettes.fr/api/Music/image/" + music.id
        
        
        self.loadImageFromUrl(url: urlWBKImage, view: MusicImage)
        
        downloadFileFromURL(url!)
    }
    func Musicplayer(_ url:URL) {
        do {
            self.player = try AVAudioPlayer(contentsOf: url)
            player.prepareToPlay()
            player.play()
        } catch let error as NSError {
            
            print(error.localizedDescription)
        } catch {
            print("AVAudioPlayer init failed")
        }
        
    }
    @IBAction func stopClick(_ sender: AnyObject) {
        player.stop()
        player.currentTime = 0.0
    }
    
    
    @IBAction func playClick(_ sender: AnyObject) {
        player.play()
    }
    
    @IBAction func pauseClick(_ sender: AnyObject) {
        player.pause()
    }
    
    
    
    func downloadFileFromURL(_ url:URL){
        var downloadTask:URLSessionDownloadTask
        downloadTask = URLSession.shared.downloadTask(with: url, completionHandler: { (URL, response, error) -> Void in
            self.Musicplayer(URL!)
        })
        
        downloadTask.resume()
        
    }
    
    func loadImageFromUrl(url: String, view: UIImageView){
        
        // Create Url from string
        let url = NSURL(string: url)!
        
        // Download task:
        // - sharedSession = global NSURLCache, NSHTTPCookieStorage and NSURLCredentialStorage objects.
        let task = URLSession.shared.dataTask(with: url as URL) { (responseData, responseUrl, error) -> Void in
            // if responseData is not null...
            if let data = responseData{
                
                // execute in UI thread
                DispatchQueue.main.async{
                    view.image = UIImage(data: data)
                }
            }
        }
        
        // Run task
        task.resume()
    }
    
    
}
