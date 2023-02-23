
//  Mapview.swift
//  Move app
//
//  Created by 吉田史織 on 2023/02/23.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    //検索キーワード
    let searchKey1: String
    let searchKey2: String
    //表示するViewを作成するときに実行
    func makeUIView(context: Context)-> MKMapView{
        //MKMapViewのインスタンス作成
        MKMapView()
    }
    //表示したViewが更新されるたびに実行
    func updateUIView(_ uiView: MKMapView,context:Context){
        print(searchKey1)
        print(searchKey2)
        
        //緯度軽度インスタンスを取得
        let geocoder1 = CLGeocoder()
        let geocoder2 = CLGeocoder()
        
        geocoder1.geocodeAddressString(searchKey1, completionHandler: {(placemarks,error) in
            if let unwrapPlacemarks = placemarks,
               let firstPlacemark = unwrapPlacemarks.first,
               let location = firstPlacemark.location{
                let targetCoordinate1 = location.coordinate
                print(targetCoordinate1)
                
                //MKPointAnnotationインスタンスを作成
                let pin1 = MKPointAnnotation()
                pin1.coordinate = targetCoordinate1
                pin1.title = searchKey1
                //ピンを追加
                uiView.addAnnotation(pin1)
                
                uiView.region = MKCoordinateRegion(
                    center: targetCoordinate1,
                    latitudinalMeters: 500.0,
                    longitudinalMeters: 500.0)
                
                
            }
            
        })
        geocoder2.geocodeAddressString(searchKey1, completionHandler: {(placemarks,error) in
            if let unwrapPlacemarks = placemarks,
               let firstPlacemark = unwrapPlacemarks.first,
               let location = firstPlacemark.location{
                let targetCoordinate2 = location.coordinate
                print(targetCoordinate2)
                
                //MKPointAnnotationインスタンスを作成
                let pin2 = MKPointAnnotation()
                pin2.coordinate = targetCoordinate2
                pin2.title = searchKey2
                //ピンを追加
                uiView.addAnnotation(pin2)
                
                uiView.region = MKCoordinateRegion(
                    center: targetCoordinate2,
                    latitudinalMeters: 500.0,
                    longitudinalMeters: 500.0)
                
                
            }
            
        })
    }
}

struct Mapview_Previews: PreviewProvider {
    static var previews: some View {
        MapView(searchKey1: "渋谷駅",searchKey2: "渋谷公園")
    }
}
