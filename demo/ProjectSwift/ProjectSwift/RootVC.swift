

import UIKit
import Alamofire
import WebKit



class RootVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var mytableview: UITableView!
    var earthquakdata:RspDataModel?
    let cellidentifier:String = "EarthquakeInfoTableCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Earthquakes"
        mytableview = UITableView(frame: self.view.bounds,style: UITableView.Style.plain)
        mytableview.delegate = self
        mytableview.dataSource = self
        self.view.addSubview(mytableview) 
        mytableview.register(EarthquakeInfoCell.classForCoder(), forCellReuseIdentifier: cellidentifier)
        let urlstr = "https://earthquake.usgs.gov/fdsnws/event/1/query?format=geojson&starttime=2023-01-01&endtime=2024-01-01&minmagnitude=7"
        
        AF.request(urlstr).responseDecodable(of: RspDataModel.self) { response in
            debugPrint(response)
            
            if let data = response.value{
                print(data.type)
                self.earthquakdata = data
                self.mytableview.reloadData()
                
            }
        }
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count = 0
        if earthquakdata != nil {
            count = earthquakdata!.features.count
        }
        return count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let customCell = tableView.dequeueReusableCell(withIdentifier: cellidentifier, for: indexPath)
        
        if earthquakdata != nil {
            if indexPath.row < earthquakdata!.features.count {
                let model = earthquakdata!.features[indexPath.row]
                let xcell = customCell as! EarthquakeInfoCell
                xcell.updateCellUI(model.properties.title, "sources: " + model.properties.sources, "alert: " + model.properties.alert)
            }
        }
        return customCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("")
        
        if earthquakdata != nil {
            if indexPath.row < earthquakdata!.features.count {
                let model = earthquakdata!.features[indexPath.row]
                let mapvc = EarthMapWebVC()
                mapvc.weburl = model.properties.url + "/map"
                self.navigationController?.pushViewController(mapvc, animated: true)
            }
        }
        
    }

}
