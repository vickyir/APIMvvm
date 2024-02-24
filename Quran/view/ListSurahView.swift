//
//  ListSurahView.swift
//  Quran
//
//  Created by Vicky Irwanto on 24/02/24.
//

import SwiftUI

struct ListSurahView: View {
    @StateObject var quranViewModel = QuranViewModel()
    var body: some View {
        NavigationView{
            ZStack{
                if quranViewModel.isLoading {
                    ProgressView("Loading...")
                }else{
                    List(quranViewModel.surahData.reversed(), id: \.nomor){ surah in
                        if surah.nomor >= 78{
                            NavigationLink(destination: ContentView(url: "\(surah.audio)", id: surah.nomor), label: {
                                VStack{
                                    Text("\(surah.nama_latin)")
                                }
                                .onAppear{
                                    print(surah.nomor)
                                }
                            })
                        }
                       
                    }
                }
            }
        }
        .task {
            await quranViewModel.didFetchSurahData()
            
        }
        
       
        
    }
}

#Preview {
    ListSurahView()
}
