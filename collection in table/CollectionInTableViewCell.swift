//
//  CollectionInTableViewCell.swift
//  JustTakeCar
//
//  Created by Евгений Буракевич on 22.06.22.
//

import UIKit

final class TableViewCellWithCollection: UITableViewCell {

    let collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumInteritemSpacing = 8
        flowLayout.sectionInset = .init(top: 0, left: 16, bottom: 0, right: 16)
        flowLayout.itemSize = CGSize(width: (UIScreen.main.bounds.width / 2 - 36 - 16), height: 100)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collection.collectionViewLayout = flowLayout
        collection.isPagingEnabled = true
        collection.showsHorizontalScrollIndicator = false
        collection.register(NewCarCollectionViewCell.self, forCellWithReuseIdentifier: "NewCarCollectionViewCell")
        return collection
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
       addSubviews()
        setupConstraints()
        collectionView.dataSource = self
        collectionView.delegate = self
       
        backgroundColor = .white
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    private func addSubviews() {
           
            addSubview(collectionView)
        }
 
    
 private func setupConstraints() {
           
            collectionView.translatesAutoresizingMaskIntoConstraints = false
            
       

            collectionView.topAnchor.constraint(equalTo: bottomAnchor).isActive = true
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
            collectionView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        }
        

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

   

         
}

extension TableViewCellWithCollection: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewCarCollectionViewCell", for: indexPath) as! NewCarCollectionViewCell
    return cell
    }
    
    
    
}

