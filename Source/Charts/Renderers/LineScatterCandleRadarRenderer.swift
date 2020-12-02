//
//  LineScatterCandleRadarRenderer.swift
//  Charts
//
//  Copyright 2015 Daniel Cohen Gindi & Philipp Jahoda
//  A port of MPAndroidChart for iOS
//  Licensed under Apache License 2.0
//
//  https://github.com/danielgindi/Charts
//

import Foundation
import CoreGraphics
import UIKit

@objc(LineScatterCandleRadarChartRenderer)
open class LineScatterCandleRadarRenderer: BarLineScatterCandleBubbleRenderer {
    
    //    @objc open weak var dataProvider: LineChartDataProvider?
    
    public override init(animator: Animator, viewPortHandler: ViewPortHandler) {
        super.init(animator: animator, viewPortHandler: viewPortHandler)
        //        self.dataProvider = dataProvider
    }
    
    /// Draws vertical & horizontal highlight-lines if enabled.
    /// :param: context
    /// :param: points
    /// :param: horizontal
    /// :param: vertical
    @objc open func drawHighlightLines(context: CGContext, point: CGPoint, set: ILineScatterCandleRadarChartDataSet) {
        
        // draw vertical highlight lines
        if set.isVerticalHighlightIndicatorEnabled {
            context.beginPath()
            context.move(to: CGPoint(x: point.x, y: viewPortHandler.contentTop))
            context.addLine(to: CGPoint(x: point.x, y: viewPortHandler.contentBottom))
            context.strokePath()
        }
        
        // draw horizontal highlight lines
        if set.isHorizontalHighlightIndicatorEnabled {
            context.beginPath()
            context.move(to: CGPoint(x: viewPortHandler.contentLeft, y: point.y))
            context.addLine(to: CGPoint(x: viewPortHandler.contentRight, y: point.y))
            context.strokePath()
        }
    }
    
    @objc open func drawHighlightBar(context: CGContext, graph: LineChartView, highlight: Highlight, set: ILineScatterCandleRadarChartDataSet, point: CGPoint) {
        let width = set.barHighlightWidth
        let minY = viewPortHandler.contentTop
        let maxY = viewPortHandler.contentBottom
        let minX = point.x - (width/2)
        let maxX = point.x + (width/2)
        
        let rectangle = CGRect(x: minX, y: minY, width: maxX - minX, height:  maxY - minY)
        context.setFillColor(set.highlightColor.withAlphaComponent(0.3).cgColor)
        context.addRect(rectangle)
        context.setLineWidth(0)
        context.setStrokeColor(UIColor.clear.cgColor)
        context.drawPath(using: .fillStroke)

    }
    
}
