//
//  SearchModel.swift
//  Airbnb
//
//  Created by YEONGJIN JANG on 2022/05/23.
//

import Foundation

//TODO: - 외부에서 값 변경 하지 못하게 변수 접근제한자 설정
class ReservationModel {
    var location: String?
    var checkInDate: String?
    var checkOutDate: String?
    var minCharge: Int?
    var maxCharge: Int?
    var headcount: Int?
}
