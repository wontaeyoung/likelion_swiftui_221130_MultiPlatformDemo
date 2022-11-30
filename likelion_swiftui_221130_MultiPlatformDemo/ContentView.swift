//
//  ContentView.swift
//  likelion_swiftui_221130_MultiPlatformDemo
//
//  Created by 원태영 on 2022/11/30.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedTab : Int = 0
    @State private var selectedMenuItemID : MenuItem.ID?
    @State private var selectedSchoolItemID : SchoolItem.ID?
    
    var body: some View {
        myNaviSplitView
        
        
    }
    
    private var myNaviSplitView : some View {
        NavigationSplitView {
            // SideBar - 대분류(메뉴 바)
            List(menuItems, selection: $selectedMenuItemID) {
                Text($0.name)
            }
        } content: {
            // 중분류(서브 메뉴)
            List(schoolItems, selection: $selectedSchoolItemID) {
                Text($0.name)
            }
        } detail: {
            // 컨텐츠(서브 메뉴에서 선택된 컨텐츠)
            SchoolDetailView(schoolID: selectedSchoolItemID)
        }

    }
    
    private var myTabView : some View {
        TabView(selection: $selectedTab) {
            Text("QWER")
                .tabItem{
                    Text("XBox")
                    Image(systemName: "xbox.logo")
                }
                .tag(1)
            Text("ASDF")
                .tabItem{
                    Image(systemName: "playstation.logo")
                    Text("Playstation")
                }
                .tag(2)
        }
    }
    
    struct SchoolDetailView : View {
        let schoolID : SchoolItem.ID?
        
        var schoolItem : SchoolItem? {
            for school in schoolItems {
                if school.id == schoolID {
                    return school
                }
            }
            return nil
        }
        
        var body: some View {
            VStack {
                Text(schoolItem?.description ?? "nil")
            }
            .navigationTitle(schoolItem?.name ?? "nil")
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
        
    }
}
