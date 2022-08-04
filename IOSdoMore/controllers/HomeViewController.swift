//
//  HomeViewController.swift
//  IOSdoMore
//
//  Created by Habibulloh on 04/08/22.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDataSource,UICollectionViewDelegate{
    
    

    
    @IBOutlet weak var collectionView:UICollectionView!
    let numberOfColums:CGFloat = 2
    var items: Array<Item> = Array()
    override func viewDidLoad() {
        super.viewDidLoad()
         initViews()
        // Do any additional setup after loading the view.
    }
    //Mark:-Method
    func initViews(){
    addNavigationBar()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        self.collectionView.register(UINib(nibName: "ItemCollectionViewCell", bundle: nil),forCellWithReuseIdentifier:"My cell")
        
        if let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout{
            let screenSize: CGRect = UIScreen.main.bounds
            let cellWidht = screenSize.width / numberOfColums - 15
            flowLayout.itemSize = CGSize(width: cellWidht, height: cellWidht)
        }
        items.append(Item(title: "Name of song:Marlbaro", image: "miyagi"))//, image1: "tommy"))
        items.append(Item(title: "Shelby limited CMP", image: "tommy"))//, image1: "tommy"))
        items.append(Item(title: "Name of song:When/i/Win", image: "miyagi"))//, image1: "tommy"))
        items.append(Item(title: "Tommy", image: "tommy"))//, image1: "tommy"))
        items.append(Item(title: "Tantra", image: "miyagi"))
        items.append(Item(title: "Shelby", image: "tommy"))
    }
    func addNavigationBar(){
        let scroll = UIImage(named: "ic_scroll")
        navigationItem.rightBarButtonItem =  UIBarButtonItem(image: scroll, style: .plain, target: self, action: #selector(scrollTapped))
        title = "Collection View"
    }
        func callScrollController(){
            let vc = ScrollViewController(nibName: "ScrollViewController", bundle: nil)
            self.navigationController?.pushViewController(vc, animated: true)
        }
    
    //Mark:Action
    @objc func scrollTapped(){
        callScrollController()
    }
    //Mark:-CollectionViews
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let item = items[indexPath.row]
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "My cell", for: indexPath)  as! ItemCollectionViewCell
            cell.imageView1.image = UIImage(named: item.image)
           // cell.imageView2.image = UIImage(named: item.image1)
            cell.nameLabel1.text = item.title
            //cell.nameLabel2.text = item.title1
            return cell
        }

    
}
