//
//  ContentView.swift
//  Macro_Challenge
//
//
//

import SwiftUI
import PhotosUI

struct ContentView: View {
    
    // variaveis do objeto
    let formatter = NumberFormatter()
    var prod: ProductViewModel
    @State private var purchasedPrice = String()
    @State private var status: ProductStatus = ProductStatus.acquarid
    @State private var double: Double = 0.0
    @State var imagepicker1 = UIImage(systemName: "")
    @StateObject var imagePicker = ImagePicker()
    
    
    @State private var isKeyboardVisible: Bool = false
    
    
    //Variaves do botão de status
    @State private var buttonBoolAcquarid = true
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
        GeometryReader { sizeOfView in
            ScrollView{
                ZStack {
                    VStack {
                        
                        Spacer(minLength: 30)
                        HStack{
                            
                            if let image = imagePicker.image {
                                PhotosPicker( selection: $imagePicker.imageSelection)
                                {
                                    Image(uiImage: image)
                                        .resizable()
                                        .scaledToFill()
                                    
                                        .frame(width: 90, height: 90)
                                    
                                    
                                        .clipped()
                                }
                            } else  {
                                PhotosPicker( selection: $imagePicker.imageSelection){
                                    Image(systemName: "photo")
                                        .resizable()
                                        .frame(width: 42, height: 30)
                                    
                                        .padding()
                                }
                                .foregroundColor(Color("elements"))//cor do botao de adicionar foto
                            }
                            
                            
                            Text("Adicionar foto da sua peça")
                            // .position(x: 65, y:10)
                                .bold()
                                .font(.system(size: 15, weight: .bold, design: .rounded))
                                .padding(10)
                                .foregroundColor(Color("elements"))
                            
                            
                        }
                        //                        .frame(width:350, height:50)
                        //.cornerRadius(CGFloat:30)
                        .background(Color("assetBackgroundLight"))
                        .cornerRadius(10)
                        Spacer(minLength: 30)
                        VStack(alignment: .leading) {
                            
                            //parte de exibicao das tags
                            
                            
                            Section(header: Text("Descreva sua peça").bold().font(.system(size: 15, weight: .bold, design: .rounded)).foregroundColor(Color("elements"))) {
                                Text("Adicione tags como: Azul, Camiseta, Algodão")
                                    .font(.subheadline)
                                Spacer(minLength: 30)
                                TextField("Adicione uma tag", text: $text, onCommit: addTag)
                                    .padding(.leading)
                                    .frame(width: sizeOfView.size.width * 0.9, height: sizeOfView.size.height * 0.06)
                                    .font(.system(size: 17, weight: .bold, design: .rounded))
                                    .background(
                                        Color("assetBackgroundLight")
                                            .foregroundColor(Color("title"))
                                            .cornerRadius(10)
                                            .frame(height: 40)
                                    )
                                
                                
                                    .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)) { _ in
                                        // Código para limpar o TextField aqui
                                        text = ""
                                    }
                                
                            }
                            Spacer(minLength: 20)
                            //exibicao das tags
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
                                    }
                                    .padding(10)
                                }
                            }.frame(width: sizeOfView.size.width * 0.9, height: sizeOfView.size.height * 0.20) .background(
                                RoundedRectangle(cornerRadius: 10).strokeBorder(Color.gray)                                    )
                            
                            Section(header: Text("Preço de venda")
                                .font(.system(size: 17, weight: .bold, design: .rounded))
                                .foregroundColor(Color("elements"))
                                .bold()
                                .padding(10)
                                .position(x:63, y:35)){
                                    
                                    Text("Qual será o preço \nde venda  de sua peça?")
                                        .font(.system(size: 16, design: .rounded))
                                    TextField("0.00", text: $purchasedPrice, onEditingChanged: { isEditing in
                                        isKeyboardVisible = true
                                    })
                                    .position(x: 405, y:-45)
                                    .padding(.trailing)
                                    .keyboardType(.decimalPad).background(Color(("assetBackgroundLight"))
                                        .cornerRadius(10)
                                        .frame(width: 130, height: 40)
                                        .position(x: 285, y:-45)
                                                                          
                                    )
                                    
                                }
                            
                        }
                        .toolbar {
                            ToolbarItemGroup(placement: .keyboard) {
                                Spacer()
                                
                                Button(action: {
                                    // Dismiss the keyboard
                                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                                    
                                    // Additional actions if needed
                                }) {
                                    Text("OK")
                                        .font(.system(size: 14))
                                        .foregroundColor(.blue)
                                }
                            }
                            
                        }
                        .padding(10)
                        
                        
                        VStack() {
                            Section(header: Text("Status")
                                .font(.system(size: 17, weight: .bold, design: .rounded))
                                .foregroundColor(Color("elements"))
                                    
                                .position(x:30,y:0 )
                                    
                                .bold()
                                .padding(10)) {
                                    Text("Em qual etapa do processo sua peça está?")
                                        .position(x:160,y:-15 )
                                        .font(.subheadline)
                                    
                                    HStack(spacing: 10) {
                                        VStack {
                                            Button {
                                                buttonBoolAcquarid = true
                                                status = ProductStatus.acquarid
                                                buttonBoolSold = false
                                                buttonBoolSelling = false
                                                buttonBoolWashing = false
                                                buttonBoolMaintenance = false
                                            } label: {
                                                VStack {
                                                    if buttonBoolAcquarid == true {
                                                        Image("iconeAdquiridoClicado")
                                                            .resizable()
                                                            .frame(width: 53, height: 53 )
                                                        
                                                    } else {
                                                        Image("iconeAdquirido")
                                                            .resizable()
                                                            .frame(width: 53, height: 53)
                                                        
                                                    }
                                                    Text("Adquirido")
                                                        .foregroundColor(Color("title"))
                                                        .font(.system(size: 11, weight: .bold, design: .rounded))
                                                }
                                            }
                                        }
                                        
                                        VStack {
                                            Button {
                                                buttonBoolWashing = true
                                                status = ProductStatus.washing
                                                buttonBoolSold = false
                                                buttonBoolSelling = false
                                                buttonBoolAcquarid = false
                                                buttonBoolMaintenance = false
                                            } label: {
                                                VStack {
                                                    if buttonBoolWashing == true {
                                                        Image("iconeLavandoClicado")
                                                            .resizable()
                                                            .frame(width: 53, height: 53)
                                                        
                                                    } else {
                                                        Image("iconeLavando")
                                                            .resizable()
                                                            .frame(width: 53, height: 53)
                                                        
                                                    }
                                                    Text("Lavando")
                                                        .foregroundColor(Color("title"))
                                                        .font(.system(size: 11, weight: .bold, design: .rounded))
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
                                                VStack {
                                                    if buttonBoolMaintenance == true {
                                                        Image("iconeManutencaoClicado")
                                                            .resizable()
                                                            .frame(width: 53, height: 53)
                                                        
                                                    } else {
                                                        Image("iconeManutencao")
                                                            .resizable()
                                                            .frame(width: 53, height: 53)
                                                        
                                                    }
                                                    Text("Manutenção")
                                                        .foregroundColor(Color("title"))
                                                        .font(.system(size: 11, weight: .bold, design: .rounded))
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
                                                VStack {
                                                    if buttonBoolSelling == true {
                                                        Image("iconeNaLojaClicado")
                                                            .resizable()
                                                            .frame(width: 53, height: 53)
                                                        
                                                    } else {
                                                        Image("iconeNaLoja")
                                                            .resizable()
                                                            .frame(width: 53, height: 53)
                                                        
                                                    }
                                                    Text("Na loja")
                                                        .foregroundColor(Color("title"))
                                                        .font(.system(size: 11, weight: .bold, design: .rounded))
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
                                                VStack {
                                                    if buttonBoolSold == true {
                                                        Image("iconeVendidoClicado")
                                                            .resizable()
                                                            .frame(width: 53, height: 53)
                                                    } else {
                                                        Image("iconeVendido")
                                                            .resizable()
                                                            .frame(width: 53, height: 53)
                                                    }
                                                    Text("Vendido")
                                                        .foregroundColor(Color("title"))
                                                        .font(.system(size: 11, weight: .bold, design: .rounded))
                                                }
                                            }
                                        }
                                    }
                                }
                        }
                        //                        Button {
                        //                            prod.addProduct1( purchasedPrice: 20.0, status: "Status", acessory: true, image: "isso")
                        //                        } label: {
                        //                            Text("cRIA")
                        //                        }
                        
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
            
            .background(Color("background"))
        }.onTapGesture {
            if isKeyboardVisible {
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }
        }
        .navigationBarTitle("Nova peça", displayMode: .large)
        .navigationBarItems(
            leading:
                Button(action: {
                    
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("")
                },
            trailing:
                Button(action: {
                    if (purchasedPrice == "" || tags.isEmpty || imagePicker.image == nil){
                        showAlert = true
                        print("nao deu")
                    }else {
                        prod.addProduct(tags: tags, purchasedPrice: prod.convertStringToDouble(text: purchasedPrice), status: status, acessory: true,image: ((imagePicker.image ?? imagepicker1)!))
                        
                        resetScreenObject()
                        self.presentationMode.wrappedValue.dismiss()
                    }
                }) {
                    Text("Salvar")
                }.alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("Campos Insuficientes"),
                        message: Text("Preencha todos os campos \n de adição da peça!")
                    )}
        )
        
    }
    @ViewBuilder
    func RowView(tag: Tag) ->some View{
        Text(tag.name)
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