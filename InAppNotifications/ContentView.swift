//
//  ContentView.swift
//  InAppNotifications
//
//  Created by Иван Легенький on 03.01.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var showSheet: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Button("Show Sheet") {
                    showSheet.toggle()
                }
                .sheet(isPresented: $showSheet, content: {
                    Button("Show Airdrop notification") {
                        UIApplication.shared.inAppNotification(
                            adaptForDynamicIsland: true,
                            timeout: 5,
                            swipeToClose: true
                        ) {
                            HStack {
                                Image(systemName: "wifi")
                                    .font(.system(size: 40))
                                    .foregroundStyle(.white)
                                
                                VStack(alignment: .leading, spacing: 2, content: {
                                    Text("AirDrop")
                                        .font(.caption.bold())
                                        .foregroundStyle(.white)
                                    
                                    Text("From messanger")
                                        .textScale(.secondary)
                                        .foregroundStyle(.gray)
                                })
                                .padding(.top, 20)
                                
                                Spacer(minLength: 0)
                            }
                            .padding(15)
                            .background {
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(.black)
                            }
                            
                        }
                    }
                    .buttonStyle(.bordered)
                    .buttonBorderShape(.roundedRectangle(radius: 10))
                    .tint(.red)
                })
                
                Button("Show notification") {
                    UIApplication.shared.inAppNotification(
                        adaptForDynamicIsland: true,
                        timeout: 5,
                        swipeToClose: true
                    ) {
                        HStack {
                            Image(systemName: "gear")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 40, height: 40)
                                .clipShape(.circle)
                                .foregroundStyle(.white)
                            
                            VStack(alignment: .leading, spacing: 6, content: {
                                Text("Peter")
                                    .font(.caption.bold())
                                    .foregroundStyle(.white)
                                
                                Text("Hello I am from messanger")
                                    .textScale(.secondary)
                                    .foregroundStyle(.gray)
                            })
                            .padding(.top, 20)
                            
                            Spacer(minLength: 0)
                            
                            Button(action: {}, label: {
                                Image(systemName: "speaker.slash.fill")
                                    .font(.title2)
                            })
                            .buttonStyle(.bordered)
                            .buttonBorderShape(.circle)
                            .tint(.white)
                        }
                        .padding(15)
                        .background {
                            RoundedRectangle(cornerRadius: 15)
                                .fill(.black)
                        }
                    }
                }
            }
            .navigationTitle("In App Notification's")
        }
    }
}

#Preview {
    ContentView()
}
