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
//        context.saveGState()
//        var barRect = CGRect()
        
//        let transformer = graph.getTransformer(forAxis: set.axisDependency)
        context.setFillColor(set.highlightColor.withAlphaComponent(0.3).cgColor)
        
        let width: CGFloat = 20.0
        let minY = viewPortHandler.contentTop
        let maxY = viewPortHandler.contentBottom
        let minX = point.x - (width/2)
        let maxX = point.x + (width/2)
        
        context.beginPath()
        context.move(to: CGPoint(x: minX, y: minY))
        context.addLine(to: CGPoint(x: maxX, y: minY))
        context.move(to: CGPoint(x: maxX, y: maxY))
        context.addLine(to: CGPoint(x: minX, y: maxY))
        context.strokePath()
        
//        prepareBarHighlight(x: point.x,
//                            y1: topPoint,
//                            y2: bottomPoint,
//                            barWidthHalf: 10.0,
//                            rect: &barRect)
        
//        setHighlightDrawPos(highlight: highlight, barRect: barRect)
        
//        let path = createBarPath(for: barRect, roundedCorners: UIRectCorner())
        
//        context.saveGState()
        
//        context.addPath(path.cgPath)
//        context.clip()
//        context.fill(barRect)
//        context.restoreGState()
    }
    
//    open func prepareBarHighlight(x: CGFloat, y1: CGFloat, y2: CGFloat, barWidthHalf: CGFloat, rect: inout CGRect) {
//        print("🚨 x -> \(x)")
//        print("🚨 y1 -> \(y1)")
//        print("🚨 y2 -> \(y2)")
//
//        let left = x - barWidthHalf
//        let right = x + barWidthHalf
//        let top = y1
//        let bottom = y2
//
//        print("🚨 _left_ \(left)")
//        print("🚨 _right_ \(right)")
//        print("🚨 _top_ \(top)")
//        print("🚨 _bottom_ \(bottom)")
//
//        rect.origin.x = left
//        rect.origin.y = top
//        rect.size.width = right - left
//        rect.size.height = bottom - top
//
//        print("🚨 _FINAL RECT_ \(rect)")
//        //        trans.rectValueToPixel(&rect, phaseY: animator.phaseY )
//    }
//
//    /// Sets the drawing position of the highlight object based on the given bar-rect.
//    internal func setHighlightDrawPos(highlight high: Highlight, barRect: CGRect) {
//        high.setDraw(x: barRect.midX, y: barRect.origin.y)
//    }
//
//    /// Creates path for bar in rect with rounded corners
//    internal func createBarPath(for rect: CGRect, roundedCorners: UIRectCorner) -> UIBezierPath {
//
//        let cornerRadius = rect.width / 2.0
//
//        let path = UIBezierPath(roundedRect: rect,
//                                byRoundingCorners: roundedCorners,
//                                cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
//
//        return path
//    }
}
