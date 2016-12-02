//
//  MusicViewControler.swift
//  Music
//
//  Created by Jordan Sejean  on 28/11/2016.
//  Copyright © 2016 Brezeler. All rights reserved.
//

import Foundation
import UIKit


class MusicViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var MusicList: UITableView!
    var music :[Music] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.MusicList.dataSource = self
        self.MusicList.delegate = self
        self.MusicList.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.getMusic()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.music.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = self.MusicList.dequeueReusableCell(withIdentifier: "cell")! as UITableViewCell
        
        let music = self.music[indexPath.row];
        cell.textLabel?.text = music.singer + "-" + music.song
        cell.textLabel?.textColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        cell.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let playMusicViewController : PlayMusicViewController = PlayMusicViewController()
        playMusicViewController.music = self.music[indexPath.row];
        navigationController?.pushViewController(playMusicViewController, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete) {
        }
    }
    func getMusic()->Void{
        
        let musicWebServices : MusicWB = MusicWB()
        musicWebServices.getAllMusics(){
            (result: [Music]) in
            self.music = result
            self.refreshTableView()
        }    }
    func refreshTableView(){
        DispatchQueue.main.async(execute: {
            self.MusicList.reloadData()
        })
    }
    
    



}
