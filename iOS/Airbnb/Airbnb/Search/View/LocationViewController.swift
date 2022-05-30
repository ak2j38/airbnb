//
//  LocationViewController.swift
//  Airbnb
//
//  Created by YEONGJIN JANG on 2022/05/24.
//

import UIKit
import SnapKit

class LocationViewController: BackgroundViewController, CommonViewControllerProtocol {
     
    let model = LocationModel()
    
    private let searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        let searchBar = searchController.searchBar
        searchBar.searchBarStyle = .minimal
        searchBar.placeholder = "어디로 여행가세요?"
        searchBar.searchTextField.clearButtonMode = .never
        searchBar.searchTextField.returnKeyType = .go
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.automaticallyShowsCancelButton = false
        return searchController
    }()
        
    lazy var nearbyLoactionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: 64)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(LocationCollectionViewCell.self, forCellWithReuseIdentifier: LocationCollectionViewCell.reuseIdentifier)
        collectionView.register(HeaderReusableView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderReusableView.ID)
        return collectionView
    }()
    
    lazy var searchInitializeButton: UIBarButtonItem = {
        let barButton = UIBarButtonItem(title: "지우기", style: .done,
                                        target: self, action: #selector(self.clearSearchField(_:)))
        barButton.tintColor = .gray
        return barButton
    }()
    
    func attribute() {
        setUpDelegates()
        navigationItem.searchController = searchController
        navigationItem.title = "숙소 찾기"
        super.setUpNavigationAppearance()
        view.backgroundColor = .systemBackground
        self.navigationController?.isToolbarHidden = false
    }
    
    func layout() {
        let sideMargin: CGFloat = 16
        view.addSubview(nearbyLoactionView)
        
        nearbyLoactionView.snp.makeConstraints {
            $0.top.bottom.equalTo(view)
            $0.leading.equalTo(view).offset(sideMargin)
            $0.trailing.equalTo(view).inset(sideMargin)
        }
    }
    
    func bind() {
        
    }
    
    private func setUpDelegates() {
        nearbyLoactionView.delegate = self
        nearbyLoactionView.dataSource = self
        searchController.searchBar.delegate = self
        searchController.searchResultsUpdater = self
        definesPresentationContext = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        attribute()
        layout()
        bind()
    }
    
}

extension LocationViewController: UISearchBarDelegate, UITextFieldDelegate, UISearchResultsUpdating
{
    func updateSearchResults(for searchController: UISearchController) {
        guard let query = searchController.searchBar.text else { return }
        dump(query)
    }
    
    
    @objc func clearSearchField(_ sender: Any) {
        searchController.searchBar.text = nil
        self.navigationItem.rightBarButtonItem = nil
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        searchController.searchBar.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchController.searchBar.resignFirstResponder()
        return true
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        navigationItem.rightBarButtonItem = !searchText.isEmpty ? searchInitializeButton : nil
    }
}

extension LocationViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        model.getCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = nearbyLoactionView.dequeueReusableCell(withReuseIdentifier: LocationCollectionViewCell.reuseIdentifier, for: indexPath) as? LocationCollectionViewCell else {
            return UICollectionViewCell()
        }
        guard let item = model[indexPath.row] else {
            return UICollectionViewCell()
        }
        cell.cityName.text = item.destination
        cell.spendingTime.text = item.distance
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) ->
    UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let headerView = nearbyLoactionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderReusableView.ID, for: indexPath)
            return headerView
        default:
            assert(false, "header, footer, withReuseIdentifier 를 확인하세요.")
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let width: CGFloat = nearbyLoactionView.frame.width
        let headerViewHeight: CGFloat = 78
        return CGSize(width: width, height: headerViewHeight)
    }
}
