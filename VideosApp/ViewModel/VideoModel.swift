//
//  VideoModel.swift
//  VideosApp
//
//  Created by Otoole on 22/03/2022.
//

import Foundation

class VideoModel: ObservableObject {
    
    @Published var videos = [Video]()
    
    @Published var currentVideo:Video?
    var currentVideoIndex = 0
    
    @Published var currentVideoSelected:Int?
    
    init(){
        //fetch videos from api and populate videos array
        fetchVideos()
    }
    
    //
    func beginVideo(video_id:Int){
        if let index = self.videos.firstIndex(where: {$0.id == video_id}){
            currentVideoIndex = index
        }
        
        currentVideo = videos[currentVideoIndex]
    }
    
    //Go to next video
    func nextVideo(){
        //go to next video
        //currentVideoIndex += 1
        
        if hasNextVideo() {
            currentVideoIndex += 1
            currentVideo = videos[currentVideoIndex]
        }
        else
        {
            currentVideoIndex = 0
            currentVideo = nil
        }
    }
    
    //Check if next video exists
    func hasNextVideo() -> Bool{
        guard currentVideo != nil else{
            return false
        }
        return (currentVideoIndex + 1 < videos.count)
    }
    
    //function to get videos from api
    func fetchVideos(){
        let urlString = "https://otoole311.github.io/learningapp-data/Data.json"
    
        //create a url object
        if let url = URL(string: urlString){
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                //check if there's an error
                guard error == nil else{
                    //there was an error
                    return
                }
                
                //create json decoder
                do{
                    let decoder = JSONDecoder()
                    
                    //decode
                    let videoResult = try decoder.decode([Video].self,from: data!)
                    
                    DispatchQueue.main.async {
                        self.videos += videoResult
                    }
                }
                catch{
                    //couldnt pass json
                    print(error)
                }
            }.resume()
        }
    }
}
