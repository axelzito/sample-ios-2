//
//  MapController.swift
//  MyPhomeApp
//
//  Created by Aluno on 23/03/2019.
//  Copyright © 2019 Axel. All rights reserved.
//

import UIKit
import MapKit

class MapController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBOutlet weak var vrMap: MKMapView!
    
    
    @IBAction func trataEventoSegment(_ sender: UISegmentedControl) {
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
