import SwiftUI

public struct FoggyColorsView: View {
    @State var blurRadius: CGFloat
    @State var opacity: CGFloat
    @State var randomization = [PointRandomization]()
    @State var size: CGSize = CGSize()
    var randomColors = [Int]()
    var randomShapes = [Int]()
    private let differentShapes = 4
    var elemOpacity: CGFloat
    
    private let animated: Bool
    private let animation: Animation
    private let numberShapes: Int

    private let timer = Timer
        .publish(every: 5, on: .main, in: .common)
        .autoconnect()
    
    var colors: [LinearGradient] = [
        LinearGradient(gradient: Gradient(colors:[
            Color(red: 98.0 / 255.0, green: 219.0 / 255.0, blue: 198.0 / 255.0),
            Color(red: 48.0 / 255.0, green: 159.0 / 255.0, blue: 140.0 / 255.0)
        ]), startPoint: .topLeading, endPoint: .bottomTrailing),
        LinearGradient(gradient: Gradient(colors:[
            Color(red: 255.0 / 255.0, green: 175.0 / 255.0, blue: 198.0 / 255.0),
            Color(red: 255.0 / 255.0, green: 108.0 / 255.0, blue: 135.0 / 255.0)
        ]), startPoint: .topLeading, endPoint: .bottomTrailing),
        LinearGradient(gradient: Gradient(colors:[
            Color(red: 53.0 / 255.0, green: 127.0 / 255.0, blue: 255.0 / 255.0),
            Color(red: 53.0 / 255.0, green: 127.0 / 255.0, blue: 255.0 / 255.0)
        ]), startPoint: .topLeading, endPoint: .bottomTrailing),
        LinearGradient(gradient: Gradient(colors:[
            Color.red,
            Color.red
        ]), startPoint: .topLeading, endPoint: .bottomTrailing),
        LinearGradient(gradient: Gradient(colors:[
            Color.blue,
            Color.blue
        ]), startPoint: .topLeading, endPoint: .bottomTrailing),
        LinearGradient(gradient: Gradient(colors:[
            Color.blue,
            Color.red
        ]), startPoint: .topLeading, endPoint: .bottomTrailing),
        LinearGradient(gradient: Gradient(colors:[
            Color.orange,
            Color.red
        ]), startPoint: .topLeading, endPoint: .bottomTrailing),
    ]
    
    private func randomFrame(_ proxy: GeometryProxy) -> CGSize{
        let x = CGFloat.random(in: (proxy.size.width / 20.0)...(proxy.size.width))
        let y = CGFloat.random(in: (proxy.size.height / 20.0)...(proxy.size.height))
        return CGSize(width: x, height: y)
    }
    
    public var body: some View {
        GeometryReader { proxy in
            Group {
                ForEach(obtainRangeAndUpdate(size: proxy.size), id: \.self) { i in
                    Group {
                        switch(randomShapes[i]){
                        case 0:
                            Circle()
                                .fill(colors[randomColors[i]])
                        case 1:
                            Capsule()
                                .fill(colors[randomColors[i]])
                        case 2:
                            Capsule()
                                .stroke(lineWidth: 30)
                                .fill(colors[randomColors[i]])
                        default:
                            Ellipse()
                                .fill(colors[randomColors[i]])
                        }
                    }
                    
                    .frame(
                        width: randomization[i].width,
                        height: randomization[i].height)
                    .position(
                        x: randomization[i].offsetX,
                        y: randomization[i].offsetY)
                    .opacity(elemOpacity)
                    .zIndex(Double(i))
                }
            }
        }
        .blur(radius: blurRadius)
        .onReceive(timer) { _ in
            dispatchUpdate()
        }
        .drawingGroup(opaque: false,
                      colorMode: ColorRenderingMode.extendedLinear)
        .opacity(opacity)
    }
    
    private func dispatchUpdate() {
        if !randomization.isEmpty {
            if randomization.first?.offsetY == 0 && randomization.first?.offsetX == 0 {
                randomizationStart()
            }
        }
        if !animated { return }
        withAnimation(animation) {
            randomizationUpdate()
        }
    }

    private func randomizationStart() {
        var randomizationBuilder = [PointRandomization]()
        while randomizationBuilder.count < numberShapes {
            var randomizationElement = PointRandomization()
            randomizationElement.randomizeIn(size: size)
            randomizationBuilder.append(randomizationElement)
        }
        randomization = randomizationBuilder
    }
    
    private func randomizationUpdate() {
        var randomizationBuilder = randomization
        for i in 0..<randomizationBuilder.count {
            randomizationBuilder[i].moveIn(size: size)
        }
        randomization = randomizationBuilder
    }

    private func obtainRangeAndUpdate(size: CGSize) -> Range<Int> {
        issueSizeUpdate(withValue: size)
        return 0 ..< numberShapes
    }

    private func issueSizeUpdate(withValue size: CGSize) {
        if self.size == size { return }
        DispatchQueue.main.async {
            self.size = size
            self.dispatchUpdate()
        }
    }
    
    public init(
        blurRadius newBlurRadius: CGFloat = 50,
        globalOpacity: CGFloat = 1.0,
        elementOpacity: CGFloat = 0.6,
        animated: Bool = true,
        animation: Animation = Animation
            .interpolatingSpring(stiffness: 10, damping: 5)
            .speed(0.08),
        numberShapes: Int = 8
    ) {
        self.blurRadius = newBlurRadius
        self.opacity = globalOpacity
        self.elemOpacity = elementOpacity
        self.animation = animation
        self.numberShapes = numberShapes
        self.animated = animated
        randomColors = [Int](repeating: 0, count: numberShapes).map{_ in Int.random(in: 0..<colors.count)}
        randomShapes = [Int](repeating: 0, count: numberShapes).map{_ in Int.random(in: 0..<differentShapes)}
        _randomization = State(initialValue: [PointRandomization](repeating: .init(), count: numberShapes))
    }
}
