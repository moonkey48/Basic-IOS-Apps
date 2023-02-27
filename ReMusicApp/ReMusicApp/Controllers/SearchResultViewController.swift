//
//  SearchResultViewController.swift
//  ReMusicApp
//
//  Created by moonkey on 2023/02/26.
//

import UIKit

class SearchResultViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    let flowLayout = UICollectionViewFlowLayout()
    let networkManager = NetworkManager.shared
    
    var musicArray: [Music] = []
    
    var searchString: String? {
        didSet{
            loadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupCollectionView()
    }
    func setupCollectionView(){
        collectionView.dataSource = self
        collectionView.backgroundColor  = .white
        flowLayout.scrollDirection = .vertical
        
        let collectionCellWidth = (UIScreen.main.bounds.width - CVCell.spacingWidth * (CVCell.cellColumn - 1)) / CVCell.cellColumn
        flowLayout.itemSize = CGSize(width: collectionCellWidth, height: collectionCellWidth)
        flowLayout.minimumLineSpacing = CVCell.spacingWidth
        flowLayout.minimumInteritemSpacing = CVCell.spacingWidth
        
        collectionView.collectionViewLayout = flowLayout
        
    }
    private func loadData(){
        
    }
}
extension SearchResultViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return musicArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.musicCollectionViewCellIdentifier, for: indexPath) as! Music
        
    }
}
