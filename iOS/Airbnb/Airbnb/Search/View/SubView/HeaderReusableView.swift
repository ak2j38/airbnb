//
//  headerView.swift
//  Airbnb
//
//  Created by YEONGJIN JANG on 2022/05/27.
//

import UIKit
import SnapKit

class HeaderReusableView: UICollectionReusableView {
    
    let text: UILabel = {
        let label = UILabel()
        label.text = "근처의 인기 여행지"
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        return label
    }()
    
    static var ID: String { String(describing: Self.self) }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(text)
        
        self.backgroundColor = .systemBackground
        text.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.centerY.equalToSuperview()
        }
    }
}
