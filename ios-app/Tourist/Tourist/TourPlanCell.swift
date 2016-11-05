//
//  TourPlanCell.swift
//  Tourist
//
//  Created by Tomoya Hayakawa on 2016/11/05.
//  Copyright © 2016年 NG_1609. All rights reserved.
//

import UIKit

final class TourPlanCell: UITableViewCell, NibReusableCell {

    enum Weather {
        case sun, cloud, rain

        var image: UIImage {
            switch self {
            case .sun:   return #imageLiteral(resourceName: "sun")
            case .cloud: return #imageLiteral(resourceName: "cloud")
            case .rain:  return #imageLiteral(resourceName: "rain")
            }
        }
    }

    enum LineType {
        case top, center, last
    }

    // Background
    @IBOutlet private weak var backgroundImageView: UIImageView!
    @IBOutlet private weak var backgroundBlurView: UIView!

    // Line
    @IBOutlet private weak var backLine: UIView!
    @IBOutlet private weak var nextLine: UIView!
    @IBOutlet private weak var logoImageView: UIImageView!

    // Time
    @IBOutlet private weak var startTimeLabel: UILabel!
    @IBOutlet private weak var endTimeLabel: UILabel!
    @IBOutlet private weak var timeBetweenLabel: UILabel!

    // Body
    @IBOutlet private weak var titleLabel: UILabel!

    // Weather
    @IBOutlet private weak var startWeatherImageView: UIImageView!
    @IBOutlet private weak var centerWeatherImageView: UIImageView!
    @IBOutlet private weak var endWeatherImageView: UIImageView!
    @IBOutlet private weak var degreeLabel: UILabel!

    // Others
    private var defaultLineColor = UIColor(red: 148/255, green: 207/255, blue: 111/255, alpha: 1)


    override func awakeFromNib() {
        super.awakeFromNib()

        timeBetweenLabel.transform = CGAffineTransform(rotationAngle: 90)
        logoImageView.layer.cornerRadius = logoImageView.frame.width / 2.0
        logoImageView.clipsToBounds = true
    }

    func updateCell(title: String) {
        titleLabel.text = title
    }

    func setLine(type: LineType, backLineColor: UIColor? = nil, nextLineColor: UIColor? = nil) {
        backLine.isHidden = false
        nextLine.isHidden = false

        switch type {
        case .top:
            backLine.isHidden = true
        case .last:
            nextLine.isHidden = true
        default: break
        }

        backLine.backgroundColor = backLineColor ?? defaultLineColor
        nextLine.backgroundColor = nextLineColor ?? defaultLineColor
    }

    func setWeather(startWhether: Weather, endWeather: Weather, degree: Double) {
        startWeatherImageView.image = startWhether.image
        endWeatherImageView.image = endWeather.image
        centerWeatherImageView.image = #imageLiteral(resourceName: "arrow")
        degreeLabel.text = "\(degree.rounded())℃"
    }

}
