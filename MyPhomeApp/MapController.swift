//
//  MapController.swift
//  MyPhomeApp
//
//  Created by Aluno on 23/03/2019.
//  Copyright © 2019 Axel. All rights reserved.
//

import UIKit
import MapKit

class MapController:
    UIViewController,
    MKMapViewDelegate,
    UIGestureRecognizerDelegate {
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        print("Um pino foi selecionado no mapa")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        vrMap.delegate = self
    }
    
    @IBAction func handleCall(_ sender: Any) {
        if let url = URL(string: "tel://\(99999999)") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        criaPino()
    }

    func criaPino() {
        let pino = MKPointAnnotation()
        pino.title = "UFG Mobile"
        let coordenadas = CLLocationCoordinate2D(latitude: -16.6032579, longitude: -49.2674331)
        
        pino.coordinate = coordenadas
        
        vrMap.addAnnotation(pino)
        
        let zoom = MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002)
        let regiao = MKCoordinateRegion(center: pino.coordinate, span: zoom)
        
        vrMap.setRegion(regiao, animated: true)
        
    }
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        
        //recuperei a posicao(x,y) onde houve o toque
        let ponto = gestureRecognizer.location(in: vrMap)
        
        //transformei a pos(x,y) em  coordenadas do mapa (latitude e kongitude)
        let coordenadas = vrMap.convert(ponto, toCoordinateFrom: vrMap)

        
        let pino = MKPointAnnotation()
        pino.title = "nova anotacao"
        pino.coordinate = coordenadas
        vrMap.addAnnotation(pino)
        
        print("um long press aconteceu")
        return true
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var vrMap: MKMapView!
    
    @IBAction func trataEventoSegment(_ sender: UISegmentedControl) {
        
        if (sender.selectedSegmentIndex == 0) {
            vrMap.mapType = .standard
        } else if (sender.selectedSegmentIndex == 1) {
            vrMap.mapType = .satellite
        } else if (sender.selectedSegmentIndex == 2) {
            vrMap.mapType = .hybrid
        }
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
