//
//  PlaylistDetailViewController.swift
//  AlgoRhythm
//
//  Created by Nirav Chitkara on 11/16/15.
//  Copyright © 2015 Chitter Org. All rights reserved.
//

import UIKit

class PlaylistDetailViewController: UIViewController {

    
    @IBOutlet weak var playlistImageCover: UIImageView!
    @IBOutlet weak var playlistTitle: UILabel!
    @IBOutlet weak var playlistDescription: UILabel!
    var playlist : Playlist? //don't initialize until we know what playlist instance to pass
    
    //Artist Labels
    @IBOutlet weak var artistNumber0: UILabel!
    @IBOutlet weak var artistNumber1: UILabel!
    @IBOutlet weak var artistNumber2: UILabel!
    @IBOutlet weak var artistNumber3: UILabel!
    @IBOutlet weak var artistNumber4: UILabel!
    @IBOutlet weak var artistNumber5: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if playlist != nil {
            playlistImageCover.image = playlist!.largeIcon
            playlistImageCover.backgroundColor = playlist!.backgroundColor
            playlistTitle.text = playlist!.title
            playlistDescription.text = playlist!.description
            
            artistNumber0.text = playlist!.artists[0]
            artistNumber1.text = playlist!.artists[1]
            artistNumber2.text = playlist!.artists[2]
            artistNumber3.text = playlist!.artists[3]
            artistNumber4.text = playlist!.artists[4]
            artistNumber5.text = playlist!.artists[5]
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    //Old, extra code
    //var labelText: String = "" //initialize a label text
    //artistLabel.text = playlist.title

}
