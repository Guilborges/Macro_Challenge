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
                    PhotosPicker( selection: $imagePicker.imageSelection){
                        image
                                .resizable()
                                .frame(width: 82, height: 70)
                                .padding()
                            }
                } else  {
                        PhotosPicker( selection: $imagePicker.imageSelection){
                        Image(systemName: "photo")
                                .resizable()
                                .frame(width: 82, height: 70)
                                .padding()
                        } .foregroundColor(.gray)
                }
            }
            .padding()
        }
    }
}

struct Content_Previews: PreviewProvider {
    static var previews: some View{
        SingleImagePicker()
    }
}


