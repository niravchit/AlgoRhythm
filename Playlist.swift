//
//  Playlist.swift
//  AlgoRhythm
//
//  Created by Nirav Chitkara on 11/18/15.
//  Copyright © 2015 Chitter Org. All rights reserved.
//

import Foundation
import UIKit

//Struct with our playlists data model
struct Playlist {
    
    //want stored properties for what makes a playlist
    //Note: Not constant properties ("let") since we're not initializing them right now
    //We're not initializing them yet so use the "!" operator when declaring them
    //Since we're hardcoding library we KNOW its a string so not using conditional optionals that can return nil
    
    var title: String!
    var description: String!
    var icon: UIImage!
    var largeIcon: UIImage!
    var artists: [String] = [] //array of artists
    var backgroundColor: UIColor = UIColor.clearColor() //default is clear
    
    //Want to every instance of a struct should grab values from playlist we specify
    //Need an initializer with an argument called "index", which will allow us to reference the right indexed dictionary
    //in MusicLibrary
    //NOTE: if information was retrieved from the web we wouldn't know the index number or dictionary keys so this is a 
    //special case
    
    init(index: Int) {
        let musicLib = MusicLibrary().library //instance of MusicLibrary struct; don't forget ()
        
        self.title = musicLib[index]["title"] as! String  //musicLib[index]["title"] returns AnyObject so conditional downcast to String in case its key value is nil
        self.description = musicLib[index]["description"] as! String
        
        let iconName = musicLib[index]["icon"] as! String
        self.icon = UIImage(named: iconName) //iconName is a forced String so no need to unwrap
        
        let largeIcon = musicLib[index]["largeIcon"] as! String
        self.largeIcon = UIImage(named: largeIcon)
        
        self.artists += musicLib[index]["artists"] as! [String] //add "artists" value array to current artists array but need to force unwrap for this one
        
        let colorDictionary = musicLib[index]["backgroundColor"] as! [String:CGFloat]
        self.backgroundColor = rgbColorFromDictionary(colorDictionary)
        
        
        /*
        //Can keep them as so too without forcing them as Strings!, instead do String? but then you need to conditionally
        //unwrap them instead of a force unwrap
        //Use this when we're unsure of what will be returned (i.e. String or nil)
        //In this project we know what will be returned
        var title: String?
        var description: String?
        var icon: UIImage?
        var largeIcon: UIImage?
        var artists: [String] = [] //array of artists
        var backgroundColor: UIColor = UIColor.clearColor() //default is clear
        
        //Want to every instance of a struct should grab values from playlist we specify
        //Need an initializer with an argument called "index", which will allow us to reference the right indexed dictionary
        //in MusicLibrary
        //NOTE: if information was retrieved from the web we wouldn't know the index number or dictionary keys so this is a
        //special case
        
        init(index: Int) {
        let musicLib = MusicLibrary().library //instance of MusicLibrary struct; don't forget ()
        
        self.title = musicLib[index]["title"] as? String  //musicLib[index]["title"] returns AnyObject so conditional downcast to String in case its key value is nil
        self.description = musicLib[index]["description"] as? String
        
        let iconName = musicLib[index]["icon"] as? String
        self.icon = UIImage(named: iconName!) //iconName is an optional String so need to force unwrap
        
        let largeIcon = musicLib[index]["largeIcon"] as? String
        self.largeIcon = UIImage(named: largeIcon!)
        
        self.artists += musicLib[index]["artists"] as! [String] //add "artists" value array to current artists array but need to force unwrap for this one
        */
        
    }
    
    //Helper function that will return a UIColor from a dictionary with CGFloat values
    func rgbColorFromDictionary(colorDictionary: [String:CGFloat]) -> UIColor {
        let redColor: CGFloat = colorDictionary["red"] as CGFloat!
        let blueColor: CGFloat = colorDictionary["blue"] as CGFloat!
        let greenColor: CGFloat = colorDictionary["green"] as CGFloat!
        let alphaColor: CGFloat = colorDictionary["alpha"] as CGFloat!
        
        //divide numbers by 255 (max value) since UIColor accepts values between 0.0 and 1.0
        return UIColor(red: redColor/255.0, green: greenColor/255.0, blue: blueColor/255.0, alpha: alphaColor)
        
        
        
        
    }
    
    
}
