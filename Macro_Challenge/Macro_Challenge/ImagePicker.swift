//
//  ImagePicker.swift
//  Macro_Challenge
//
//  Created by Victor Levenetz Mariano on 24/05/23.
//


import SwiftUI
import PhotosUI
import Combine

class ImagePicker: ObservableObject{
   // @Published var sourceType: UIImagePickerController.SourceType = .camera
    @Published var image: Image?
    
//    private var cancellabes = Set<AnyCancellable>()
    
    @Published var imageSelection: PhotosPickerItem?{
        
        didSet {
            if let imageSelection {
                Task {
                    try await loadTransferable(from: imageSelection)
                }
            }
        }
    }

//    init(){
//        addSubscribers()
//    }
    
//    func addSubscribers(){
//        $image
//            .sink { [weak self] (returnedImage) in
//                self?.image = returnedImage
//            }
//            .store(in: &cancellabes)
//    }
    
    func loadTransferable(from imageSelection: PhotosPickerItem?) async throws{
        
        do{
            if let image = try await imageSelection?.loadTransferable(type: Image.self){
                self.image = image
            }
        } catch {
            print(error.localizedDescription)
            image = nil
        }
    }
        
    
    
}
