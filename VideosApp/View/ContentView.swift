//
//  ContentView.swift
//  VideosApp
//
//  Created by Otoole on 22/03/2022.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var model:VideoModel
    
    var body: some View {
        
        VStack{
            
            //MARK: Search bar here
            
            //MARK: Listview
            NavigationView
            {
                List(model.videos){
                    video in
                    
                    NavigationLink(
                        destination: VideoDetailView().onAppear(perform: {
                            model.beginVideo(video_id: video.id)
                        }),
                        tag: video.id, selection: $model.currentVideoSelected)
                    {
                        Text("\(video.title)")
                    }

                    
                }
                .navigationBarTitle("All Videos")
                .onChange(of: model.currentVideoSelected, perform: {
                    ChangedValue in
                        if ChangedValue == nil{
                            model.currentVideo = nil
                        }
                    })
            }
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(VideoModel())
    }
}
