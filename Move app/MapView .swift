
//  Mapview.swift
//  Move app
//
//  Created by 吉田史織 on 2023/02/23.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    //検索キーワード
    let searchKey: String
    //表示するViewを作成するときに実行
    func makeUIView(context: Context)-> MKMapView{
        //MKMapViewのインスタンス作成
        MKMapView()
    }
    //表示したViewが更新されるたびに実行
    func updateUIView(_ uiView: MKMapView,context:Context){
        print(searchKey)
        
        //緯度軽度インスタンスを取得
        let geocoder = CLGeocoder()
        
        geocoder.geocodeAddressString(searchKey, completionHandler: {(placemarks,error) in
            if let unwrapPlacemarks = placemarks,
               let firstPlacemark = unwrapPlacemarks.first,
               let location = firstPlacemark.location{
                let targetCoordinate = location.coordinate
                print(targetCoordinate)
                
                //MKPointAnnotationインスタンスを作成
                let pin = MKPointAnnotation()
                pin.coordinate = targetCoordinate
                pin.title = searchKey
                //ピンを追加
                uiView.addAnnotation(pin)
                
                uiView.region = MKCoordinateRegion(
                    center: targetCoordinate,
                    latitudinalMeters: 500.0,
                    longitudinalMeters: 500.0)
                
                
            }
            
        })
    }
}

struct Mapview_Previews: PreviewProvider {
    static var previews: some View {
        MapView(searchKey: "渋谷駅")
    }
}
