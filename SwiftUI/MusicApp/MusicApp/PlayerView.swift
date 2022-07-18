//
//  PlayerView.swift
//  MusicApp
//
//  Created by Truong Tommy on 6/9/22.
//

import Foundation
import SwiftUI
import Firebase
import AVFoundation
import FirebaseStorage

struct PlayerView: View {
    @State  var album : Album
    @State  var song : Song
    
    @State var player = AVPlayer()
    
    @State  var isPlaying : Bool = false
    
    var body: some View {
        ZStack{
            Image(album.image)
                .resizable()
                .edgesIgnoringSafeArea(.all)
            Blur(style: .dark)
                .edgesIgnoringSafeArea(.all)
            VStack{
                Spacer()
                AlbumArt(album: album,isWithText: false)
                Text(song.name)
                    .font(.title)
                    .fontWeight(.light)
                    .foregroundColor(.white)
                
                Spacer()
                
                ZStack{
                    Color.white.cornerRadius(20).shadow(radius: 20)
                    
                    HStack{

                    Button(action: self.prevSong , label: {
                        Image(systemName: "arrow.left.circle")
                            .resizable()
                    })
                    .frame(width: 50, height: 50, alignment: .center)
                    .foregroundColor(.black).opacity(0.2)
                    
                    
                    Button(action: self.playPause , label: {
                        Image(systemName: isPlaying ? "pause.circle.fill" : "play.circle.fill")
                            .resizable()
                    })
                    .padding()
                    .frame(width: 90, height: 90, alignment: .center)
                    
                    Button(action: self.nextSong , label: {
                        Image(systemName: "arrow.right.circle")
                            .resizable()
                    })
                    .frame(width: 50, height: 50, alignment: .center)
                    .foregroundColor(.black).opacity(0.2)
                    }
   
                }
                .edgesIgnoringSafeArea(.bottom)
                .frame(height: 200, alignment: .center)
                
            }
        }
        .onAppear() {
            self.playSong()
            
        }
    }
    
    func playSong(){
        let storage = Storage.storage().reference(forURL: self.song.file)
        storage.downloadURL { url, error in
            if error == nil {
                do {
                    try AVAudioSession.sharedInstance().setCategory(.playback)
                } catch  {
                    
                }
                
                player = AVPlayer(playerItem: AVPlayerItem(url: url!))
                player.play()
            }
            else {
                print(error)
            }
        }
    }
    
    func playPause(){
        self.isPlaying.toggle()
        if isPlaying != true {
            player.pause()
        }else {
            player.play()
        }
        
    }
    func nextSong(){
        if let currentIndex = album.songs.firstIndex(of: song) {
            if currentIndex == album.songs.count-1 {
                song = album.songs[0]
            }else {
            player.pause()
            song = album.songs[currentIndex + 1]
            self.playSong()
            }
        }
    }
    func prevSong(){
        if let currentIndex = album.songs.firstIndex(of: song) {
            if currentIndex == 0 {
                
            }else {
            player.pause()
            song = album.songs[currentIndex - 1]
            self.playSong()
            }
        }
    }
}
