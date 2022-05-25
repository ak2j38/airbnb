//
//  SearchViewController.swift
//  Airbnb
//
//  Created by YEONGJIN JANG on 2022/05/23.
//

import UIKit
import SnapKit

class SearchViewController: UIViewController {
    
    enum Section {
        case searchMainBody
    }
    
    private var searchMainCollectionViewLayout: UICollectionViewLayout {
        let inset = NSDirectionalEdgeInsets(
            top: 2, leading: 2, bottom: 2, trailing: 2)
        
        let titleSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(0.05))
        let titleLayoutItem = NSCollectionLayoutItem(layoutSize: titleSize)
        titleLayoutItem.contentInsets = inset
        
        let twoRowCellSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(0.2))
        let twoRowLayoutItem = NSCollectionLayoutItem(layoutSize: twoRowCellSize)
        twoRowLayoutItem.contentInsets = inset
        
        let oneRowCellSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(0.44))
        let oneRowLayoutItem = NSCollectionLayoutItem(layoutSize: oneRowCellSize)
        oneRowLayoutItem.contentInsets = inset
        
        let mainViewLayoutGroup = NSCollectionLayoutGroup.vertical(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalHeight(1.0)),
            subitems: [
                titleLayoutItem,
                twoRowLayoutItem,
                titleLayoutItem,
                oneRowLayoutItem
            ]
        )
        
        let section = NSCollectionLayoutSection(group: mainViewLayoutGroup)
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
    }
    
    private var searchCollectionViewDataSource: (UICollectionView) -> UICollectionViewDiffableDataSource<Section, [SearchViewModel]> = { collectionView in
        UICollectionViewDiffableDataSource<Section, [SearchViewModel]>(collectionView: collectionView) { collectionView, indexPath, itemIdentifier in
            var cell: UICollectionViewCell?
            
            if indexPath.item == 0 || indexPath.item == 2 {
                
                cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: SearchTitleCollectionViewCell.reuseIdentifier,
                    for: indexPath)
                
                if let model = itemIdentifier.first {
                    (cell as? SearchTitleCollectionViewCell)?.setData(model: model)
                }
                
            } else if indexPath.item == 1 {
                
                cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: MultipleRowsCollectionViewContainerCell.reuseIdentifier,
                    for: indexPath)
                
                (cell as? MultipleRowsCollectionViewContainerCell)?
                    .applyAttributes(
                        cellType: SearchTwoInARowCollectionViewCell.self,
                        items: itemIdentifier,
                        cellWidth: collectionView.frame.width * 2/3,
                        rowCount: 2)
                
            } else if indexPath.item == 3 {
                
                cell = collectionView.dequeueReusableCell(withReuseIdentifier: MultipleRowsCollectionViewContainerCell.reuseIdentifier, for: indexPath)
                (cell as? MultipleRowsCollectionViewContainerCell)?
                    .applyAttributes(
                        cellType: SearchOneInARowCollectionViewCell.self,
                        items: itemIdentifier,
                        cellWidth: collectionView.frame.width * 4/5,
                        rowCount: 1)
            }
            
            return cell
        }
    }
    
    func getSnapshotForSearchMainCollectionView() -> NSDiffableDataSourceSnapshot<Section, [SearchViewModel]> {
        var snapshot = NSDiffableDataSourceSnapshot<Section, [SearchViewModel]>()
        snapshot.appendSections([Section.searchMainBody])
        
        var items = [[SearchViewModel]]()
        var oneRowItems = [SearchViewModel]()
        var twoRowItems = [SearchViewModel]()
        
        for i in 0 ..< 18 {
            
            let model = SearchViewModel(imageData: Data(), titleLabel: "\(i)", subTitleLabel: "\(i)\(i)")
            
            if i == 0 || i == 9 {
                items.append([model])
            } else if 1...8 ~= i {
                twoRowItems.append(model)
            } else if i > 9 {
                oneRowItems.append(model)
            }
        }
        
        items.insert(twoRowItems, at: 1)
        items.append(oneRowItems)
        
        snapshot.appendItems(items)
        return snapshot
    }
    
    private var dataSourceContainer: UICollectionViewDiffableDataSource<Section, [SearchViewModel]>?
    
    private lazy var searchMainCollectionView: UICollectionView = {
        let collectionView = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: searchMainCollectionViewLayout)
        collectionView.register(SearchTitleCollectionViewCell.self, forCellWithReuseIdentifier: SearchTitleCollectionViewCell.reuseIdentifier)
        collectionView.register(MultipleRowsCollectionViewContainerCell.self, forCellWithReuseIdentifier: MultipleRowsCollectionViewContainerCell.reuseIdentifier)
        
        let snapshot = getSnapshotForSearchMainCollectionView()
        dataSourceContainer = searchCollectionViewDataSource(collectionView)
        collectionView.dataSource = dataSourceContainer
        dataSourceContainer?.apply(snapshot, animatingDifferences: false)
        
        return collectionView
    }()
  
    private let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "어디로 여행가세요?"
        return searchBar
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        attribute()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    private func attribute() {
        view.backgroundColor = .white
        setUpSearchController()
        navAppearance()
    }
    
    private func layout() {
        view.addSubview(searchMainCollectionView)

        searchMainCollectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension SearchViewController: UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        let locationVC = LocationViewController()
        locationVC.navigationItem.title = "숙소 찾기"
        let backButton = UIBarButtonItem(title: "뒤로", style: .plain,
                                         target: self, action: nil)
        backButton.tintColor = .gray
        
        self.navigationItem.backBarButtonItem = backButton
        self.navigationController?.navigationBar.backgroundColor = .red
        show(locationVC, sender: self)
    }
    
    private func setUpSearchController() {
        self.navigationItem.titleView = searchBar
        searchBar.delegate = self
    }
}

extension SearchViewController {
    private func navAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .yellow
        
        
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
    }
}
