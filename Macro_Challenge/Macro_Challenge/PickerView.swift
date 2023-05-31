//
//  PickerView.swift
//  Macro_Challenge
//
//  Created by Victor Levenetz Mariano on 29/05/23.
//

import Foundation
import SwiftUI
import PhotosUI

struct SingleImagePicker: View {
    
    @StateObject var imagePicker = ImagePicker()

    
    var body: some View {
        NavigationStack{
            VStack{
                if let image = imagePicker.image {
                    image
                        .resizable()
                        .scaledToFit()
                } else  {
                   // let cameraPhoto = cameraPicker.sourceType
                        
                    Text("clicke")
                }
            }
            .padding()
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing){
                    PhotosPicker(selection: $imagePicker.imageSelection){
                        Image(systemName: "photo")
                            .imageScale(.large)
                    }
                }
            }
        }
    }
}


