//
//  Model.swift
//  Quran
//
//  Created by Vicky Irwanto on 24/02/24.
//

import Foundation


struct ModelSurah: Decodable {
    let nomor: Int
    let nama: String
    let nama_latin: String
    let audio: String
}

struct DetailSurah: Decodable {
    let nama_latin: String
    let jumlah_ayat: Int
    let ayat: [ayat]
}

struct ayat: Decodable{
    let id: Int
    let surah: Int
    let nomor: Int
    let ar: String
    let tr: String
    let idn: String
}


