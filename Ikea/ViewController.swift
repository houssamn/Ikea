//
//  ViewController.swift
//  Ikea
//
//  Created by Houssam on 2/21/21.
//

import UIKit
import ARKit


class ViewController: UIViewController, UICollectionViewDataSource {

    let itemsArray: [String] = ["cup","vase", "boxing", "table"]
    @IBOutlet weak var itemsCollectionView: UICollectionView!
    @IBOutlet weak var sceneView: ARSCNView!
    
    let configuration = ARWorldTrackingConfiguration()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        
        self.sceneView.debugOptions = [ARSCNDebugOptions.showWorldOrigin, ARSCNDebugOptions.showFeaturePoints]
        self.sceneView.session.run(configuration)
        
        // Set the collection view's data source
        self.itemsCollectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemsArray.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "item", for: indexPath ) as! itemCell
        cell.itemLabel.text = self.itemsArray[indexPath.row]
        return cell
    }

}

