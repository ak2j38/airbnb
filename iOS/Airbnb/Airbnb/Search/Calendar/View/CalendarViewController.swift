//
//  CalendarViewController.swift
//  Airbnb
//
//  Created by YEONGJIN JANG on 2022/05/30.
//

import UIKit

class CalendarViewController: SearchInfoTrackingViewController, CommonViewControllerProtocol {
    
//    static let sectionHeaderElementKind = "section-header-element-kind"
    
    let reservationModel: ReservationModel
    let calendarModel: CalendarModel = CalendarModel(baseDate: Date())
    
    private var checkinCell: CalendarViewCell?
    private var checkoutCell: CalendarViewCell?
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemBackground
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
    var dataSource: UICollectionViewDiffableDataSource<Int, Day>!
    
    private let weekdayView: UIView = WeekdayView()
    
    init(reservationModel: ReservationModel) {
        self.reservationModel = reservationModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        attribute()
        layout()
        bind()
    }
    
    private func setUpCollectionViewDelegates() {
        
        collectionView.delegate = self
        let cellRegistration = UICollectionView.CellRegistration<CalendarViewCell, Day> { [weak self] (cell, indexPath, identifier) in
            //            cell.day = identifier
            guard let day = self?.calendarModel.month[indexPath.section].result[indexPath.row] else { return }
            cell.day = day
        }
        
        let headerRegister = UICollectionView.SupplementaryRegistration<CalendarHearderView>(elementKind: CalendarHearderView.sectionHeaderElementKind) { [weak self] (supplementaryView, elementKind, indexPath) in
            supplementaryView.baseDate = self?.calendarModel.month[indexPath.section].result.last?.date
        }
        
        dataSource = UICollectionViewDiffableDataSource<Int, Day>(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
        })
        
        dataSource.supplementaryViewProvider = { (_, _, index) in
            return self.collectionView.dequeueConfiguredReusableSupplementary(
                using: headerRegister, for: index)
        }
        
        // initail date
        let month = calendarModel.month
        let sections = Array(0..<month.count)
        var snapshot = NSDiffableDataSourceSnapshot<Int, Day>()
        sections.forEach {
            snapshot.appendSections([$0])
            snapshot.appendItems(month[$0].result)
        }
        dataSource.apply(snapshot, animatingDifferences: false)
    }
    
    
    
    //    func performQuery() {
    //        var snapshot = NSDiffableDataSourceSnapshot<Section, Day>()
    //        snapshot.appendSections([.main])
    //        snapshot.appendItems([Day(date: Date(), number: "4", isSelected: false, isWithInDisplayedMonth: true)])
    //        self.dataSource.apply(snapshot, animatingDifferences: true)
    //    }
    
    func attribute() {
        contentView.backgroundColor = .systemBackground
        navigationItem.title = "숙소 찾기"
        navigationController?.isToolbarHidden = false
        self.toolbarItems = setUpToolBarItems()
        setUpCollectionViewDelegates()
        //        self.performQuery()
    }
    
    func layout() {
        view.addSubview(weekdayView)
        view.addSubview(collectionView)
        
        weekdayView.snp.makeConstraints {
            $0.leading.trailing.equalTo(view.readableContentGuide)
            $0.top.equalTo(view.readableContentGuide).offset(32)
        }
        
        collectionView.snp.makeConstraints {
            $0.leading.trailing.equalTo(weekdayView)
            $0.top.equalTo(weekdayView.snp.bottom)
            $0.height.equalTo(view.snp.height).multipliedBy(0.5)
        }
        
        
    }
    
    func bind() {
        calendarModel.onUpdate = { [weak self] in
            self?.collectionView.reloadData()
        }
    }
    
    private func setUpToolBarItems() -> [UIBarButtonItem] {
        let spacing = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let skipButton = UIBarButtonItem(title: "건너뛰기", style: .plain, target: self, action: #selector(pushNextVC))
        let nextButton = UIBarButtonItem(title: "다음", style: .plain, target: self, action: nil)
        nextButton.isEnabled = false
        return [skipButton, spacing, nextButton]
    }
    
    @objc func pushNextVC() {
        let nextVC = PriceGraphViewController()
        nextVC.setModel(model)
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}

extension CalendarViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? CalendarViewCell,
              let day = cell.day,
              cell.day?.isBeforeToday == false else { return }
        
        calendarModel.onUpdateCheckinDay = { selectedDay in
            if let beforeCell = self.checkinCell {
                guard let beforeDay = beforeCell.day else { return }
                beforeDay.isSelected = false
                beforeCell.tabGenerated(for: beforeDay)
            }
            day.isSelected = true
            cell.tabGenerated(for: day)
            self.checkinCell = cell
        }
        
        
        calendarModel.onUpdateCheckoutDay = { selectedDay in
            if let beforeCell = self.checkoutCell {
                guard let beforeDay = beforeCell.day else { return }
                beforeDay.isSelected = false
                beforeCell.tabGenerated(for: beforeDay)
            }
            day.isSelected = true
            cell.tabGenerated(for: day)
            self.checkoutCell = cell
        }
        
        calendarModel.validateCheckDate(for: day)
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//        let width: CGFloat = self.collectionView.frame.width
//        let height: CGFloat = 60
//        return CGSize(width: width, height: height)
//    }
}

extension CalendarViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: Int = Int(self.collectionView.frame.width / 7)
        let height: Int = 50
        return CGSize(width: width, height: height)
    }
}
