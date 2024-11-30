

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
    let header = MJRefreshNormalHeader()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        setupNavigationBar()
        setupTableview()
        
        hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.show(animated: true)
        
        useURLSessionRequestData()
         
        //testgcdbarrier()
        //testgcdsemaphore()
    }
    
    func testgcdsemaphore() {
        let semaphore = DispatchSemaphore.init(value: 1)
        let queuex = DispatchQueue.init(label: "test", qos: .default, attributes: .concurrent)
        for i in 0..<10 {
            queuex.async {
                semaphore.wait()
                print("i = \(i):\(Thread.current.description)")
                semaphore.signal()
            }
        }
    }
    
    
    func testgcdbarrier() {
        let queue = DispatchQueue(label: "barrier", attributes: .concurrent)
        queue.async {
            print("任务A")
            
        }
        queue.async {
            print("任务B")
        }
        
        // barrier，必须等任务C完成后，才走后面任务D
        queue.async(flags: .barrier) {
            print("任务C")
        }
        
        queue.async {
            print("任务D")
        }
    }
    
    override func viewWillLayoutSubviews() {
        //let layoutFrame = self.view.safeAreaLayoutGuide.layoutFrame
        let insets = self.view.safeAreaInsets;
        mytableview.frame = CGRect(x: insets.left, y: insets.top, width: self.view.bounds.size.width - insets.left - insets.right, height: self.view.bounds.size.height - insets.top - insets.bottom)
    }
    
    func setupNavigationBar() {
        self.title = "Earthquakes List"
        if self.navigationController != nil {
            self.navigationController!.navigationBar.backgroundColor = UIColor.white
            self.navigationController!.navigationBar.barStyle = UIBarStyle.default
        }
    }
    
    func setupTableview() {
        mytableview = UITableView(frame: self.view.bounds,style: UITableView.Style.plain)
        mytableview.delegate = self
        mytableview.dataSource = self
        self.view.addSubview(mytableview)
        mytableview.showsVerticalScrollIndicator = false
        mytableview.register(EarthquakeInfoCell.classForCoder(), forCellReuseIdentifier: cellidentifier)
        header.setRefreshingTarget(self, refreshingAction: #selector(RootVC.useURLSessionRequestData))
        self.mytableview!.mj_header = header
        if #available(iOS 15.0, *) {
            mytableview.sectionHeaderTopPadding = 0.0
        }
    }
    
    @objc func useURLSessionRequestData() {
        let urlstr = "https://earthquake.usgs.gov/fdsnws/event/1/query?format=geojson&starttime=2023-01-01&endtime=2024-01-01&minmagnitude=7"
        let dataurl = URL(string: urlstr)
        if dataurl == nil {
            return
        }
        let request = URLRequest(url: dataurl!, cachePolicy: URLRequest.CachePolicy.useProtocolCachePolicy, timeoutInterval: 30)
        
        let datatask = URLSession.shared.dataTask(with: request) { Data, URLResponse, Error in
            DispatchQueue.main.async {
                self.hud.hide(animated: true)
                self.mytableview.mj_header!.endRefreshing()
            }
            
            if Error != nil {
                print(Error!)
                DispatchQueue.main.async {
                    self.view.makeToast("request failed:"  + Error!.localizedDescription, position: .center)
                }
                return
            }
            
            if let data = Data {
                    let rspdata = try? JSONDecoder().decode(RspDataModel.self, from: data)
                    if rspdata != nil {
                        DispatchQueue.main.async {
                            self.view.makeToast("request ok", position: .center)
                            self.earthquakdata = rspdata
                            self.mytableview.reloadData()
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
    
    //点击跳转详情页
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if earthquakdata != nil {
            if indexPath.row < earthquakdata!.features.count {
                let model = earthquakdata!.features[indexPath.row]
                let mapvc = EarthMapWebVC()
                mapvc.weburl = model.properties.url + "/map"
                mapvc.webtitle = model.properties.title
                self.navigationController?.pushViewController(mapvc, animated: true)
            }
        }
    }
}
