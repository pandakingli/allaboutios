

import Foundation
import UIKit

class EarthquakeInfoCell: UITableViewCell {
    var titlelable : UILabel!
    var timelable : UILabel!
    var alertlable : UILabel!
    
       required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
        }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = UITableViewCell.SelectionStyle.none
             
        titlelable = UILabel.init()
        titlelable.font = UIFont.systemFont(ofSize: 15)
        
        timelable = UILabel.init()
        timelable.font = UIFont.systemFont(ofSize: 10)
        
        alertlable = UILabel.init()
        alertlable.font = UIFont.systemFont(ofSize: 10)
        
        self.contentView.addSubview(titlelable)
        self.contentView.addSubview(timelable)
        self.contentView.addSubview(alertlable)
        }
         
    public  func updateCellUI(_ title: String, _ time: String, _ alert: String, _ mag: Float){
        titlelable.text = title
        timelable.text = time
        alertlable.text = alert
        titlelable.frame = CGRect(x: 5, y: 2, width: self.bounds.width-10, height: 20)
        timelable.frame = CGRect(x: 5, y: 25, width: self.bounds.width-10, height: 15)
        alertlable.frame = CGRect(x: 5, y: 43, width: self.bounds.width-10, height: 15)
        if mag >= 7.5 {
            titlelable.textColor = UIColor.red
        } else {
            titlelable.textColor = UIColor.black
        }
      
    }
    
        override func awakeFromNib() {
            super.awakeFromNib()
        }
         
        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)
        }
}
