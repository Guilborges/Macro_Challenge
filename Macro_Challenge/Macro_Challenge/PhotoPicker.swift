//
//  ImagePicker.swift
//  Macro_Challenge
//
//  Created by Victor Levenetz Mariano on 24/05/23.
//


import SwiftUI
import PhotosUI

class ImagePicker: ObservableObject{
    
    @Published var image: UIImage?
    @Published var imageSelection: PhotosPickerItem?{
        
        didSet {
            if let imageSelection {
                Task {
                    try await loadTransferable(from: imageSelection)
                }
            }
        }
    }
    
    @MainActor   func loadTransferable(from imageSelection: PhotosPickerItem?) async throws{
        do{
            if let data = try await imageSelection?.loadTransferable(type: Data.self){
                if let image = UIImage(data: data){
                    self.image = image
                }
         
            }
        } catch {
            print(error.localizedDescription)
            image = nil
        }
    }
}
