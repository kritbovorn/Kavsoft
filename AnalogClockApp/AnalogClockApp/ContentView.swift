//
//  ContentView.swift
//  AnalogClockApp
//
//  Created by Kritbovorn Taweeyossak on 9/9/2563 BE.
//
//  https://www.youtube.com/watch?v=BTtERko7j1Y&feature=push-prem-sub&attr_tag=u1Omrl9uG2xCQ_Um%3A6


import SwiftUI

struct ContentView: View {
    
    @State private var isDark: Bool = false
    
    var body: some View {
        
        NavigationView {
            
            HomeView(isDark: $isDark)
                .navigationBarHidden(true)
                .preferredColorScheme(isDark ? .dark : .light)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct HomeView: View {
    
    @Binding var isDark: Bool
    @State private var currentTime: Time = Time(sec: 0, min: 0, hour: 0)
    @State private var receiverTime = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    // FIXME: - Proxy Function
    func proxyHeight(for metric: GeometryProxy) -> CGFloat {
        let proxyHeight = metric.size.height
        
        return proxyHeight
    }
    
    var body: some View {
        
        GeometryReader { main in
            VStack(spacing: 0) {
                
                // FIXME: - First
                GeometryReader { first in
                    
                    HeaderView(isDark: $isDark, size: first.size)
                }
                .frame(height: main.size.height * 0.1)
//                .background(Color.red)
                
                // FIXME: - Second
                GeometryReader { second in

                    VStack {
                        Spacer()

                        HStack {

                            Spacer()

                            ZStack {

                                Circle()
                                    .fill(Color("Color").opacity(0.1))

                                
                                ForeachRectangle(size: second.size)

                                RecSecond(size: second.size, currentTime: $currentTime)
                                    

                                RecMin(size: second.size, currentTime: $currentTime)

                                RecHour(size: second.size, currentTime: $currentTime)
                                    
                                    

                                Circle()
                                    .fill(Color.primary)
                                    .frame(width: proxyHeight(for: second) * 0.05,height: proxyHeight(for: second) * 0.05)

                                
                            }
                            .frame(width: proxyHeight(for: second) * 0.6, height: proxyHeight(for: second) * 0.6)

                            Spacer()
                        }

                        Spacer()
                    }

                    .onAppear {
                        let calendar = Calendar.current

                        let sec = calendar.component(.second, from: Date())
                        let min = calendar.component(.minute, from: Date())
                        let hour = calendar.component(.hour, from: Date())

                        withAnimation(Animation.linear(duration: 0.01)) {
                            self.currentTime = Time(sec: sec, min: min, hour: hour)
                        }
                    }

                    .onReceive(receiverTime) { _ in
                        let calendar = Calendar.current

                        let sec = calendar.component(.second, from: Date())
                        let min = calendar.component(.minute, from: Date())
                        let hour = calendar.component(.hour, from: Date())

                        withAnimation(Animation.linear(duration: 0.01)) {
                            self.currentTime = Time(sec: sec, min: min, hour: hour)
                        }
                    }
                }
                .frame(height: main.size.height * 0.7)

                
                // FIXME: - Third
                GeometryReader { third in
                    
//                    Text(Locale.current.localizedString(forRegionCode: Locale.current.regionCode!) ?? "" )
                    
                    VStack {
                        Text("ที่อยู่ :  \(Locale.current.localizedString(forRegionCode: Locale.current.regionCode!) ?? "")")
                            .foregroundColor(.primary)
                            .font(.system(size: third.size.height * 0.2, weight: .bold))

                        
                        Text("ภาษาที่เลือก : \(Locale.current.localizedString(forLanguageCode: Locale.current.languageCode!) ?? "")" )
                            .foregroundColor(.primary)
                            .font(.system(size: third.size.height * 0.2, weight: .bold))
                        
                        Text("เวลา : \(getTime())")
                            .foregroundColor(.primary)
                            .font(.system(size: third.size.height * 0.15, weight: .semibold))
                    }
                    .frame(width: third.size.width, height: third.size.height * 0.8)
                    
                }
                .frame(height: main.size.height * 0.2)

                
                
            }
            
        }
    }
    
    func getTime() -> String {
        let format = DateFormatter()
        format.dateFormat = "hh: mm: a"
        
        return format.string(from: Date())
    }
    
}

struct Time {
    
    var sec: Int
    var min: Int
    var hour: Int
    
}

