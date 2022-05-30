//
//  LocationModel.swift
//  Airbnb
//
//  Created by YEONGJIN JANG on 2022/05/30.
//

import Foundation
import CloudKit

struct CityInfomation {
    let destination: String
    let distance: String
    let imageUrl: String
}

class LocationModel {
    private var model: [CityInfomation] = []
    
    subscript(index: Int) -> CityInfomation? {
        get {
            if 0 <= index, index < model.count {
                return model[index]
            }
            return nil
        }
    }
    
    init() {
        model = make8CitiesInfo()
    }
    
    
    private func make8CitiesInfo() -> [CityInfomation] {
        let locations: [String] = [
            "서울", "광주", "의정부시", "수원시",
            "대구", "울산", "대전", "부천시"
        ]
        let spandings: [String] = [
            "차로 30분 거리", "차로 4시간 거리", "차로 30분 거리", "차로 45분 거리",
            "차로 3.5시간 거리", "차로 4.5시간 거리", "차로 2시간 거리", "차로 30분 거리"
        ]
        
        return  locations.enumerated().map { index, element in
            CityInfomation(destination: element, distance: spandings[index], imageUrl: "")
        }
    }
    
    func getCount() -> Int {
        model.count
    }
}
