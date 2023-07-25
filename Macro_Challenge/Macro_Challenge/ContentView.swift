//
//  ContentView.swift
//  Macro_Challenge
//
//  Created by Guilherme Borges on 22/05/23.
//

import SwiftUI
import PhotosUI

struct ContentView: View {
    
    // variaveis do objeto
    let formatter = NumberFormatter()
    var prod: ProductViewModel
    @State private var purchasedPrice = String()
    @State private var status: ProductStatus = ProductStatus.nullo
    @State private var double: Double = 0.0
    @State var imagepicker1 = Image(systemName: "")
    @StateObject var imagePicker = ImagePicker()
    
    @State private var buttonBoolAcquarid = false
    @State private var buttonBoolMaintenance = false
    @State private var buttonBoolSelling = false
    @State private var buttonBoolSold = false
    @State private var buttonBoolWashing = false

    
    
    //Variaveis das tags
    @Binding var tags: [Tag]
    @State private var text: String = ""
    @State private var name = String()
    
    //Variaveis da tela
    @Environment(\.presentationMode) var presentationMode
    @State private var showAlert = false

    
    
    var body: some View {

        ZStack {
           
                
                GeometryReader { sizeOfView in
                    VStack {
                        
                        VStack(alignment: .leading) {
                            Text("Adicionar")
                                .position(x: 65, y:10)
                                .bold()
                                .font(.system(size: 34, weight: .bold, design: .rounded))
                                .padding(25)
                        }
                        
                        if let image = imagePicker.image {
                            PhotosPicker( selection: $imagePicker.imageSelection){
                                image
                                    .resizable()
                                    .frame(width: 82, height: 80)
                                
                                    .padding()
                            }
                        } else  {
                            PhotosPicker( selection: $imagePicker.imageSelection){
                                Image(systemName: "photo")
                                    .resizable()
                                    .frame(width: 82, height: 70)
                                
                                    .padding()
                            }.foregroundColor(.gray)
                        }
                        VStack {
                            HStack{
                                ScrollView(.vertical, showsIndicators: false) {
                                    
                                    
                                    //Exibindo tags
                                    ForEach(getRows(),id: \.self) { rows in
                                        
                                        HStack(spacing:6){
                                            
                                            ForEach(rows) { row in
                                                // Row view...
                                                RowView(tag: row)
                                                
                                            }
                                        }
                                    }.padding(10)
                                    
                                }
                            }.frame(width: sizeOfView.size.width * 0.9, height: sizeOfView.size.height * 0.3
                            ).background(
                                RoundedRectangle(cornerRadius: 10).strokeBorder(Color.purple)
                            )
                            
                            VStack {
                                Section(header: Text("Informe a(s) Tag(s) da peça")){
                                    TextField("Adicione uma tag", text: $text, onCommit: addTag ).padding(.leading).background(
                                        Color(.lightGray)
                                            .cornerRadius(10).frame(height: 50)
                                    ).padding(10)
                                    
                                }
                                Section(header: Text("Informe o preço pago").padding(10)){
                                    TextField("0.00", text: $purchasedPrice).padding(.leading).keyboardType(.decimalPad).background(
                                        
                                        Color(.lightGray)
                                            .cornerRadius(10).frame(height: 50)
                                        
                                    ).padding(10)
                                }
                            }
                        }
                        .padding(10)
                        VStack{
                            HStack {
                                VStack {
                                    Button {
                                        buttonBoolAcquarid = true
                                        
                                        status = ProductStatus.acquarid
                                        
                                        buttonBoolSold = false
                                        buttonBoolSelling = false
                                        buttonBoolWashing = false
                                        buttonBoolMaintenance = false
                                    } label: {
                                        HStack {
                                            if buttonBoolAcquarid == true{
                                                Image("onAcquaridIcon")
                                            }
                                            else{
                                                Image("acquaridIcon")
                                            }
                                            
                                        }
                                    }
                                }
                                VStack{
                                    Button {
                                        buttonBoolWashing = true
                                        status = ProductStatus.washing
                                        buttonBoolSold = false
                                        buttonBoolSelling = false
                                        buttonBoolAcquarid = false
                                        buttonBoolMaintenance = false
                                    } label: {
                                        if buttonBoolWashing == true{
                                            Image("onWashingIcon")
                                        }
                                        else{
                                            Image("washingIcon")
                                        }
                                        
                                        
                                    }
                                }
                                VStack {
                                    Button {
                                        buttonBoolMaintenance = true
                                        status = ProductStatus.maintenance
                                        buttonBoolSold = false
                                        buttonBoolSelling = false
                                        buttonBoolAcquarid = false
                                        
                                        buttonBoolWashing = false
                                        
                                    } label: {
                                        if buttonBoolMaintenance == true{
                                            Image("onMaintenanceIcon")
                                        }
                                        else{
                                            Image("maintenanceIcon")
                                        }
                                        
                                    }
                                }
                                
                                VStack {
                                    Button {
                                        buttonBoolSelling = true
                                        status = ProductStatus.selling
                                        buttonBoolSold = false
                                        buttonBoolAcquarid = false
                                        buttonBoolMaintenance = false
                                        buttonBoolWashing = false
                                    } label: {
                                        if buttonBoolSelling == true{
                                            Image("onSellingIcon")
                                        }
                                        else{
                                            Image("sellingIcon")
                                            
                                        }
                                    }
                                }
                                VStack {
                                    Button {
                                        buttonBoolSelling = false
                                        buttonBoolAcquarid = false
                                        buttonBoolMaintenance = false
                                        buttonBoolWashing = false
                                        buttonBoolSold = true
                                        
                                        status = ProductStatus.sold
                                        
                                        
                                    } label: {
                                        if buttonBoolSold == true {
                                            Image( "onSoldIcon")
                                        }
                                        else{
                                            Image( "soldIcon")
                                            
                                        }
                                        //Text("Vendido")
                                    }
                                }
                            }
                        }
                        
                        
                        HStack {
                            Button {
                                
                                if (purchasedPrice == "" || tags.isEmpty || imagePicker.image == nil || status == ProductStatus.nullo){
                                    showAlert = true
                                    print("nao deu")
                                }else {
                                    prod.addProduct(tags: tags, purchasedPrice: prod.convertStringToDouble(text: purchasedPrice), status: status, acessory: true,image: imagePicker.image ?? imagepicker1)
                                    print(prod)
                                    resetScreenObject()
                                    self.presentationMode.wrappedValue.dismiss()
                                }
                                
                                
                            } label: {
                                Image("checkIcon")
                                    .frame(width: 82, height: 70)
                                
                                
                            }.alert(isPresented: $showAlert) {
                                Alert(
                                    title: Text("Campos Insuficientes"),
                                    message: Text("Preencha todos os campos \n de adição da peça!")
                                )
                            }.padding(10)
                            Button {
                                
                                if (purchasedPrice == "" || tags.isEmpty || imagePicker.image == nil){
                                    showAlert = true
                                    print("nao deu")
                                }else {
                                    prod.addProduct(tags: tags, purchasedPrice: prod.convertStringToDouble(text: purchasedPrice), status: status, acessory: true,image: imagePicker.image ?? imagepicker1)
                                    print(prod)
                                    resetScreenObject()
                                    
                                }
                                
                                
                            } label: {
                                Image(systemName: "plus")
                                    .frame(width: 82, height: 70)
                                
                                
                            }.alert(isPresented: $showAlert) {
                                Alert(
                                    title: Text("Campos Insuficientes"),
                                    message: Text("Preencha todos os campos \n de adição da peça!")
                                )
                            }.padding(10)
                            
                        }
                        
                    }
                }.onChange(of: tags) { newValue in
                    //Obtendo novo valor inserido...
                    guard let last = tags.last else{
                        return
                    }
                    //Obtendo o tamanho do texto...
                    let font = UIFont.systemFont(ofSize: 16)
                    
                    let atributes = [NSAttributedString.Key.font: font]
                    
                    let size = (last.name as NSString).size(withAttributes: atributes)
                    
                    
                    //atualizando tamanho...
                    tags[getIndex(tag: last)].size = size.width * 2
                }
                // Animacao...
                .animation(.easeInOut, value: tags)
            }
            
            .background(Color(.white))
            
        
    }
    @ViewBuilder
    func RowView(tag: Tag) ->some View{
        Text(tag.name)
        //aplicando o mesmo tamanho de fonte..
        //senão o tamanho irá variar...
            .font(.system(size: 16))
        // add capsula...
            .padding(.horizontal,14)
            .padding(.vertical,8)
            .background(
                
                Capsule()
                    .fill(Color(.gray))
            )
            .foregroundColor(Color(.black))
            .lineLimit(1)
        //Deletar...
            .contentShape(Capsule())
            .contextMenu{
                Button("Deletar"){
                    //Deletando
                    tags.remove(at: getIndex(tag: tag))
                }
            }
    }
    
    func getIndex(tag: Tag) -> Int{
        
        let index = tags.firstIndex { currentTag in
            return tag.id == currentTag.id
        } ?? 0
        
        return index
    }
    
    func getRows() -> [[Tag]]{
        
        var rows: [[Tag]] = []
        var currentRow: [Tag] = []
        
        //calculando a largura do texto...
        var totalWidth: CGFloat = 0
        // Para segurança extra 10
        let screenWidth: CGFloat = UIScreen.main.bounds.width - 90
        
        tags.forEach{ tag in
            
            //atualizando a largura total...
            
            //adicionando o tamanho da cápsula na largura total com espaçamento...
            //14 + 14 + 6 + 6
            // extra 6 para segurança...
            totalWidth += (tag.size + 40)
            
            //verificando se a largura total é maior que o tamanho
            if totalWidth > screenWidth{
                //adicionando linha em linhas...
                //limpando os dados...
                // verificando string longa...
                totalWidth = (!currentRow.isEmpty || rows.isEmpty ? (tag.size + 40) : 0)
                
                rows.append(currentRow)
                currentRow.removeAll()
                currentRow.append(tag)
            }else{
                currentRow.append(tag)
            }
        }
        
        //Verificação segura...
        // se tiver algum valor, sostringir em linhas...
        if !currentRow.isEmpty{
            rows.append(currentRow)
            currentRow.removeAll()
        }
        return rows
    }
    func addTag() {
        // Verificar se o texto não está vazio e não é uma tag duplicada
        guard !text.isEmpty, !tags.contains(where: { $0.name == text }) else {
            return
        }
        
        // Adicionar tag
        tags.append(Tag(name: text))
        
        // Limpar o TextField
        text = ""
    }
    
    func resetScreenObject (){
        tags.removeAll()
        text = ""
        purchasedPrice = ""
        imagePicker.image = nil
    }
}
