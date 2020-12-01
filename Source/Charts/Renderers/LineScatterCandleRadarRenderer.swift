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
    
    @objc open func drawHighlightBar(context: CGContext, graph: LineChartView, highlight: Highlight, set: ILineScatterCandleRadarChartDataSet) {
        context.saveGState()
        var barRect = CGRect()

        let transformer = graph.getTransformer(forAxis: set.axisDependency)
        context.setFillColor(set.highlightColor.withAlphaComponent(0.3).cgColor)

        if let e = set.entryForXValue(highlight.x, closestToY: highlight.y) as? ChartDataEntry {
            
            let y1: Double
            let y2: Double
            
            y1 = 100
            y2 = 0
            
            prepareBarHighlight(x: e.x, y1: y1, y2: y2, barWidthHalf: 10.0, trans: transformer, rect: &barRect) //TODO: Fix width!
            print("🚨 _1_ \(barRect)")
            setHighlightDrawPos(highlight: highlight, barRect: barRect)
            
            let path = createBarPath(for: barRect, roundedCorners: UIRectCorner())
            
            context.saveGState()
            
            context.addPath(path.cgPath)
            context.clip()
            context.fill(barRect)
            context.restoreGState()
        }
    
        context.restoreGState()
    }
    
    open func prepareBarHighlight(x: Double, y1: Double, y2: Double, barWidthHalf: Double, trans: Transformer, rect: inout CGRect) {
        let left = x - barWidthHalf
        let right = x + barWidthHalf
        let top = y1
        let bottom = y2
        
        print("🚨 _left_ \(left)")
        print("🚨 _right_ \(right)")
        print("🚨 _top_ \(top)")
        print("🚨 _bottom_ \(bottom)")
        
        rect.origin.x = CGFloat(left)
        rect.origin.y = CGFloat(top)
        rect.size.width = CGFloat(right - left)
        rect.size.height = CGFloat(bottom - top)
        
//        trans.rectValueToPixel(&rect, phaseY: animator.phaseY )
    }
    
    /// Sets the drawing position of the highlight object based on the given bar-rect.
    internal func setHighlightDrawPos(highlight high: Highlight, barRect: CGRect) {
        high.setDraw(x: barRect.midX, y: barRect.origin.y)
    }
    
    /// Creates path for bar in rect with rounded corners
    internal func createBarPath(for rect: CGRect, roundedCorners: UIRectCorner) -> UIBezierPath {
        
        let cornerRadius = rect.width / 2.0
        
        let path = UIBezierPath(roundedRect: rect,
                                byRoundingCorners: roundedCorners,
                                cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        
        return path
    }
}
