//
//  VideoDetailView.swift
//  VideosApp
//
//  Created by Otoole on 22/03/2022.
//

import SwiftUI
import AVKit


struct VideoDetailView: View {
    
    @EnvironmentObject var model:VideoModel
    let videoRatio: CGFloat = 1080 / 1920
    
    
    var body: some View {
        if model.currentVideo != nil{
            let currentvideo = model.currentVideo
            let url = URL(string: currentvideo!.url)!
            VStack{
                
                Text("\(currentvideo?.title ?? "")")
                
                //video player
                GeometryReader { geo in
                    VStack(alignment: .leading) {
                        VideoPlayer(player: AVPlayer(url: url))
                            .frame(height: geo.size.width * videoRatio)
                    }
                }
                
                if model.hasNextVideo() {
                    Button {
                        //go to next video
                        model.nextVideo()
                        
                    } label: {
                        //show next button
                        
                        ZStack{
                            Rectangle()
                                .foregroundColor(.green)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                                .frame(height: 48)
                            
                            Text("Next video: \(model.videos[model.currentVideoIndex + 1].title)")
                                .bold()
                                .foregroundColor(.white)
                        }
                    }
                }
                else
                {
                    Button {
                        //go to home page
                        model.currentVideoSelected = nil
                        
                    } label: {
                        //show next button
                        
                        ZStack{
                            Rectangle()
                                .foregroundColor(.green)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                                .frame(height: 48)
                            
                            Text("Complete")
                                .bold()
                                .foregroundColor(.white)
                        }
                    }
                }

            }
        }
        else
        {
            ProgressView()
        }
    }
}

//struct VideoDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        let video = VideoModel().beginVideo(video_id: 1)
//
//        VideoDetailView()
//    }
//}
