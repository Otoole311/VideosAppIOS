//
//  Video.swift
//  VideosApp
//
//  Created by Otoole on 22/03/2022.
//

import Foundation

struct Video: Identifiable, Decodable {
    var id:Int
    var title:String
    var url:String
}
