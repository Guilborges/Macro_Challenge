//
//  ContentView.swift
//  Macro_Challenge
//
//  Created by Guilherme Borges on 22/05/23.
//

import SwiftUI
import PhotosUI

struct ContentView: View {
    var body: some View {
        
     SingleImagePicker()
    }
}


struct SingleImagePicker: View {
    
    @StateObject var imagePicker = ImagePicker()
    @StateObject var cameraPicker = ImagePicker()
    
    var body: some View {
        NavigationStack{
            VStack{
                if let image = imagePicker.image {
                    image
                        .resizable()
                        .scaledToFit()
                } else  {
                    let cameraPhoto = cameraPicker.sourceType
                        
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


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
