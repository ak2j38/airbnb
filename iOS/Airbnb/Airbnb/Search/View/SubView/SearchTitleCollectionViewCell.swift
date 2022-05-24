//
//  SearchTitleCollectionViewCell.swift
//  Airbnb
//
//  Created by 백상휘 on 2022/05/24.
//

import UIKit

class SearchTitleCollectionViewCell: UICollectionViewCell, SearchCellCommonType {
    
    static var reuseIdentifier: String {
        String(describing: Self.self)
    }
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    func setData(model: SearchFavoriteLocationModel) {
        self.titleLabel.text = model.titleLabel
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(8)
        }
        
        contentView.backgroundColor = UIColor.init(displayP3Red: CGFloat.random(in: 0.0...1.0), green: CGFloat.random(in: 0.0...1.0), blue: CGFloat.random(in: 0.0...1.0), alpha: 1)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}