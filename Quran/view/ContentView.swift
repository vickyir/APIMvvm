//
//  ContentView.swift
//  Quran
//
//  Created by Vicky Irwanto on 24/02/24.
//

import SwiftUI
import AVFoundation
import AVFAudio

struct ContentView: View {
    
    var url: String
    var id: Int
    @State var song1 = false
    @StateObject private var soundManager = SoundManager()
    @StateObject private var quranViewModel = QuranViewModel()
    
    var body: some View {
        List(quranViewModel.detailSurah?.ayat ?? [], id: \.id){ surah in
            VStack{
                if quranViewModel.detailSurah?.jumlah_ayat ?? 0 >= 20 {
                    if surah.nomor <= 20 {
                        Text("\(surah.ar)")
                    }
                }else{
                    Text("\(surah.ar)")
                }
                
            }
            
        }
       
        Image(systemName: song1 ? "pause.circle.fill": "play.circle.fill")
            .font(.system(size: 25))
            .padding(.trailing)
            .onTapGesture {
                soundManager.playSound(sound: "\(url)")
                song1.toggle()
                
                if song1{
                    soundManager.audioPlayer?.play()
                } else {
                    soundManager.audioPlayer?.pause()
                }
        }
            .task {
                await quranViewModel.didFetchDetailUser(with: id)
            }
    }

}

#Preview {
    ContentView(url: "test", id: 1)
}

class SoundManager : ObservableObject {
    var audioPlayer: AVPlayer?

    func playSound(sound: String){
        if let url = URL(string: sound) {
            self.audioPlayer = AVPlayer(url: url)
        }
    }
}

