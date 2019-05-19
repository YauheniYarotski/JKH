import UIKit

class GradientButton: UIButton {
  
  
  
  private var gradientLayer: CAGradientLayer?
  
  init(gradient: GradientParameters? = nil, frame: CGRect) {
    super.init(frame: frame)
    if let gradient = gradient {
      gradientLayer = layer.applyGradient(parameters: gradient)
    }
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    if previousBounds != bounds {
      previousBounds = bounds
      CATransaction.begin()
      CATransaction.setDisableActions(true)
      gradientLayer?.frame = bounds
      gradientLayer?.cornerRadius = bounds.height/2
      CATransaction.commit()
      
      layer.cornerRadius = bounds.height/2

    }
  }
  
  override var isEnabled: Bool {
    didSet {
      if isEnabled {
        
      } else {
//        gradientLayer?.colors = .gray
        
      }
    }
  }
}


public struct GradientParameters {
  
  static let darkGradientParameters = GradientParameters(
    colors: [UIColor(red: 0.0 / 255.0, green: 0.0 / 255.0, blue: 0.0 / 255.0, alpha: 0.8).cgColor, UIColor(red: 0.0 / 255.0, green: 0.0 / 255.0, blue: 0.0 / 255.0, alpha: 0.5).cgColor],
    startPoint: CGPoint(x:0, y: 0),
    endPoint: CGPoint(x:0, y: 1))
  
  static let cardGradientParameters = GradientParameters(
    colors: [UIColor(rgb:0x4067CF).cgColor, UIColor(rgb:0xBB61FF).cgColor],
    startPoint: CGPoint(x:0.0, y: 0.0),
    endPoint: CGPoint(x:1, y: 1))
  
  public static let defaultStartPoint = CGPoint(x: 0.5, y: 0.0)
  public static let defaultEndPoint = CGPoint(x: 0.5, y: 1.0)
  public static let defaultAlpha: Float = 1.0
  
  let colors: [CGColor]
  let horizontally: Bool
  let startPoint: CGPoint
  let endPoint: CGPoint
  let alpha: Float
  
  init(colors: [CGColor], horizontally: Bool = false, startPoint: CGPoint = GradientParameters.defaultStartPoint, endPoint: CGPoint = GradientParameters.defaultEndPoint, alpha: Float = GradientParameters.defaultAlpha) {
    self.colors = colors
    self.horizontally = horizontally
    self.startPoint = startPoint
    self.endPoint = endPoint
    self.alpha = alpha
  }
}

public extension CALayer {
  public func applyGradient(colors: [CGColor], horizontally: Bool, startPoint: CGPoint = GradientParameters.defaultStartPoint, endPoint: CGPoint = GradientParameters.defaultEndPoint, alpha: Float = GradientParameters.defaultAlpha) {
    let gradientLayer = makeGradient(colors: colors, horizontally: horizontally, startPoint: startPoint, endPoint: endPoint, alpha: alpha)
    self.insertSublayer(gradientLayer, at: 0)
  }
  
  public func applyGradient(parameters: GradientParameters) -> CAGradientLayer {
    let gradientLayer = makeGradient(colors: parameters.colors, horizontally: parameters.horizontally, startPoint: parameters.startPoint, endPoint: parameters.endPoint, alpha: parameters.alpha)
    self.insertSublayer(gradientLayer, at: 0)
    return gradientLayer
  }
  
  public func makeGradient(colors: [CGColor], horizontally: Bool, startPoint: CGPoint, endPoint: CGPoint, alpha: Float = 1.0) -> CAGradientLayer {
    let maskLayer = CAShapeLayer()
    let pathBounds = self.frame.size
    maskLayer.frame = CGRect(x: 0, y: 0, width: pathBounds.width, height: pathBounds.height)
    let gradientLayer = CAGradientLayer()
    if horizontally {
      gradientLayer.startPoint = CGPoint(x: 0.0,y: 0.5)
      gradientLayer.endPoint = CGPoint(x: 1.0,y: 0.5)
    }
    else {
      gradientLayer.startPoint = startPoint
      gradientLayer.endPoint = endPoint
    }
    gradientLayer.opacity = alpha
    gradientLayer.frame = CGRect(x: 0, y: 0, width: pathBounds.width, height: pathBounds.height)
    gradientLayer.colors = colors
    gradientLayer.locations = locationsByNumberOfColors(numberOfColors: colors.count)
    
    //if ( rotateTo*rotateTo > 0.0001 ) {
    //gradientLayer.transform = CATransform3DMakeRotation(CGFloat(rotateTo) / 180.0 * CGFloat(M_PI), 0.0, 0.0, 1.0);
    //}
    return gradientLayer
  }
  private func locationsByNumberOfColors(numberOfColors : Int) -> [NSNumber] {
    var locations : [CGFloat] = [0.0]
    let delta : CGFloat = 1.0 / CGFloat(numberOfColors - 1)
    
    for i in 1..<numberOfColors {
      locations.append(locations[i-1] + delta)
    }
    let numbers: [NSNumber] = locations.map {NSNumber(value: Float($0))}
    
    return numbers
  }
}

