//
//  PlaylistMasterViewController.swift
//  AlgoRhythm
//
//  Created by Nirav Chitkara on 11/16/15.
//  Copyright © 2015 Chitter Org. All rights reserved.
//

import UIKit

class PlaylistMasterViewController: UIViewController {
    
    //empty array to store our Playlist Image Views
    var playlistArray = [UIImageView]()
    
    //reference to ImageViews in Master Controller
    @IBOutlet weak var playlistImageView: UIImageView!
    @IBOutlet weak var playlistImageView1: UIImageView!
    @IBOutlet weak var playlistImageView2: UIImageView!
    @IBOutlet weak var playlistImageView3: UIImageView!
    @IBOutlet weak var playlistImageView4: UIImageView!
    @IBOutlet weak var playlistImageView5: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //add playlist image views to the array
        //because UIImageView is a visual element, it may or may not be created when we declare properties above so we append
        //elements to the array in the viewDidLoad method so we know that they're created otherwise we might be adding "nils"
        //to the array
        
        //add our PlaylistImageView to our array
        playlistArray += [playlistImageView, playlistImageView1, playlistImageView2, playlistImageView3, playlistImageView4, playlistImageView5]
        
        //go through each element in array and use index of element to set up the right PlaylistImageView
        for index in 0..<playlistArray.count{
            //sets the image for the image view based on the playlist
            let playlist = Playlist(index: index)
            let playlistIV = playlistArray[index]
            playlistIV.image = playlist.icon
            playlistIV.backgroundColor = playlist.backgroundColor
        }
        
        
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showPlaylistDetailSegue" //make sure segue is one we want
        {
            //get the view that is associated with where the touch gesture occured and condtionally cast it as an UIImageView
            if let playlistImageView = sender!.view as? UIImageView{
                //get the index of that UIImageView in the playlistArray
                if let index = playlistArray.indexOf(playlistImageView) {
                    //destinationViewController returns AnyObject so optionally downcast it to a PlaylistDetailViewController
                    if let playlistDetailVC = segue.destinationViewController as? PlaylistDetailViewController
                    {
                        //pass the playlist at the index we found from the touch gesture view as the playlist in the Detail VC
                        //AVOIDED hardcoding the index value
                        playlistDetailVC.playlist = Playlist(index: index)
                        
                    }
                }
            }
            
            
            
        }
    }
    
    
    
    
    
    
    
    //Tap gesture that is the Segue
    @IBAction func showPlaylistDetail(sender: UITapGestureRecognizer) {
        //Seguing to the Detail View
        performSegueWithIdentifier("showPlaylistDetailSegue", sender: sender)
    }
    
    
    /*
    //Old, extra code
    //Changing title of button after view loads
    //Buttons have different states under Enum UIControlState
    //.Normal = default state
    //.Highlighted, .Disabled, .Selected
    //aButton.setTitle("Press Me!", forState: .Normal)
    
    
    /*//artistVC.artistLabel?.text = "Pressed" --> Can't do this since the label is a UI element so not accessible before the view has loaded!!
    //need to use a go-between of labelText
    artistVC.labelText = "Pressed"
    */

    */
}


