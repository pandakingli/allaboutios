

import UIKit
import Alamofire
import WebKit
import Toast_Swift
import MBProgressHUD
import MJRefresh

class RootVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var mytableview: UITableView!
    var earthquakdata:RspDataModel?
    let cellidentifier:String = "EarthquakeInfoTableCell"
    var hud: MBProgressHUD!
    var statusBarview:UIView!
    // 顶部刷新
    let header = MJRefreshNormalHeader()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Earthquakes"
        self.navigationController?.navigationBar.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.barStyle = UIBarStyle.default
        statusBarview = UIView(frame:  CGRectMake(0, -20, self.view.frame.size.width, 20))
        statusBarview.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.addSubview(statusBarview)
        setupTableview()
        useURLSessionRequestData()
        hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.show(animated: true)
    }
    
    func setupTableview() {
        mytableview = UITableView(frame: self.view.bounds,style: UITableView.Style.plain)
        mytableview.delegate = self
        mytableview.dataSource = self
        self.view.addSubview(mytableview)
        mytableview.showsVerticalScrollIndicator = false
        mytableview.register(EarthquakeInfoCell.classForCoder(), forCellReuseIdentifier: cellidentifier)
        //下拉刷新相关设置
        header.setRefreshingTarget(self, refreshingAction: #selector(RootVC.useURLSessionRequestData))
        self.mytableview!.mj_header = header
        if #available(iOS 15.0, *) {
            mytableview.sectionHeaderTopPadding = 0.0
        } else {
            // Fallback on earlier versions
        }
    }
    
    @objc func useURLSessionRequestData() {
        let urlstr = "https://earthquake.usgs.gov/fdsnws/event/1/query?format=geojson&starttime=2023-01-01&endtime=2024-01-01&minmagnitude=7"
        let dataurl = URL(string: urlstr)
        if dataurl == nil {
            return
        }
        let request = URLRequest(url: dataurl!, cachePolicy: URLRequest.CachePolicy.useProtocolCachePolicy, timeoutInterval: 30)
        //request.setValue(<#T##value: String?##String?#>, forHTTPHeaderField: <#T##String#>)
        //request.httpBody =
        
        let datatask = URLSession.shared.dataTask(with: request) { Data, URLResponse, Error in
            DispatchQueue.main.async {
                //self.view.hideToast()
                self.hud.hide(animated: true)
                //结束刷新
                self.mytableview.mj_header!.endRefreshing()
            }
            
            if Error != nil {
                print(Error!)
                DispatchQueue.main.async {
                    
                    //self.view.makeToast("request failed:"  + Error!.localizedDescription, position: .center)
                }
                return
            }
            
            if let data = Data {
                if let jsonString = String(data: data, encoding: .utf8) {
                   // print("响应数据：\(jsonString)")
                   // let jsonObjectData = jsonString.data(using: .utf8)!
                    let rspdata = try? JSONDecoder().decode(RspDataModel.self, from: data)
                    if rspdata != nil {
                        DispatchQueue.main.async {
                            //回到主线程刷新数据
                            self.earthquakdata = rspdata
                            self.mytableview.reloadData()
                            //self.view.hideToast()
                        }
                    }
                }
            }
        }
        
        datatask.resume()
    }
        
    func useAFnetRequestData() {
        let urlstr = "https://earthquake.usgs.gov/fdsnws/event/1/query?format=geojson&starttime=2023-01-01&endtime=2024-01-01&minmagnitude=7"
        
        AF.request(urlstr).responseDecodable(of: RspDataModel.self) { response in
            //debugPrint(response)
            
            if let data = response.value{
                //print(data.type)
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
                xcell.updateCellUI(model.properties.title, "sources: " + model.properties.sources, "alert: " + model.properties.alert, model.properties.mag)
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
