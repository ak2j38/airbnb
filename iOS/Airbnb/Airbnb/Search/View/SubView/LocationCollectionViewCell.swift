//
//  LocationCollectionViewCell.swift
//  Airbnb
//
//  Created by YEONGJIN JANG on 2022/05/26.
//

import UIKit
import SnapKit

class LocationCollectionViewCell: UICollectionViewCell {
    
    var cityName = UILabel()
    var spendingTime = UILabel()
    
    private let cityImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "mockImage")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = CGFloat(6)
        imageView.frame = CGRect(x: 0, y: 0, width: 64, height: 64)
        return imageView
    }()
    
    private let textStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 4
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        layout()
        attribute()
    }
    
    private func attribute() {
        self.backgroundColor = .systemBackground
        cityName.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        cityName.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        spendingTime.font = UIFont.systemFont(ofSize: 17, weight: .light)
        spendingTime.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    }
    
    private func layout() {
        contentView.addSubview(cityImage)
        contentView.addSubview(textStackView)
        
        textStackView.addArrangedSubview(cityName)
        textStackView.addArrangedSubview(spendingTime)
        
        cityImage.snp.makeConstraints {
            $0.leading.top.bottom.equalToSuperview()
            $0.width.equalTo(cityImage.snp.height)
        }
        
        textStackView.snp.makeConstraints {
            $0.leading.equalTo(cityImage.snp.trailing).offset(16)
            $0.centerY.equalToSuperview()
        }
    }
}
