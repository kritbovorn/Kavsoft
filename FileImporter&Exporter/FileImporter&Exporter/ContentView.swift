//
//  ContentView.swift
//  FileImporter&Exporter
//
//  Created by Kritbovorn Taweeyossak on 2/9/2563 BE.
//
//  https://www.youtube.com/watch?reload=9&v=tnOVnwbkAA0&pp=wgIECgIIAQ%3D%3D&feature=push-fr&attr_tag=eW-qkgmh6OdmAWqo:6

import SwiftUI
import UniformTypeIdentifiers

struct ContentView: View {
    var body: some View {
        
        HomeView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct HomeView: View {
    
    @State private var fileName: String = ""
    @State private var openFile: Bool = false
    @State private var saveFile: Bool = false
    
    var body: some View {
        
        VStack {
            
            Text(fileName)
                .fontWeight(.bold)
            
            Button(action: {
                
                openFile.toggle()
                
            }, label: {
                Text("Open")
                    
            })
            
            
            Button(action: {
                
                saveFile.toggle()
                
            }, label: {
                Text("Save")
                    
            })
        }
        .fileImporter(isPresented: $openFile, allowedContentTypes: [.audio]) { (res) in
            
            do {
                
                let fileURL = try res.get()
                print("@@@@ ", fileURL)
                self.fileName = fileURL.lastPathComponent
            }
            catch {
                print("Error reading docs")
                print(error.localizedDescription)
            }
        }
        
        .fileExporter(isPresented: $saveFile, document: Doc(url: Bundle.main.path(forResource: "Words", ofType: "mp3")!), contentType: .audio) { (res) in
            
            do {
                
                let fileURL = try res.get()
                print("Yessssss ,: ", fileURL)
            }
            catch {
                print("Oopssss  Cannot save Doc...")
                print(error.localizedDescription)
            }
        }
    }
    
}

struct Doc: FileDocument {
    
    var url: String
    
    static var readableContentTypes: [UTType] {[.audio]}
    
    init(url: String) {
        self.url = url
    }
    
    init(configuration: ReadConfiguration) throws {
        
        url = ""
    }
    
    func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
        
        let file = try! FileWrapper(url: URL(fileURLWithPath: url), options: FileWrapper.ReadingOptions.immediate)
        return file
    }
}
