//
//  PagedScrollViewViewController.swift
//
//  Created by Adam Dahan on 2014-09-20.
//  Copyright (c) 2014 Adam Dahan. All rights reserved.

import UIKit
import Material
public struct PageControlOptions {
    /*
    @name Indicator
    */
    public struct Indicator {
        /*
        @name   Color
        */
        public struct Color {
            public static let Tint = UIColor.lightGrayColor()
            public static let CurrentTint = UIColor.whiteColor()
        }
        /*
        @name   Size
        */
        public struct Size {
            public static let Width = CGFloat(100.0)
            public static let Height = CGFloat(60.0)
        }
        /*
        @name   Padding
        */
        public struct Padding {
            public static let Vertical = CGFloat(15.0)
        }
    }
}

public class PagedScrollViewController: UIViewController, UIScrollViewDelegate  {
    
    public var pages: [UIView] = [UIView]()
    public let scrollView: UIScrollView = UIScrollView()
    public let pageControl: UIPageControl = UIPageControl()
    
    /*
    @name   viewDidLoad
    */
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.blackColor()
        prepareScrollView()
        preparePageControl()
    }
    
    /*
    @name   viewDidLayoutSubviews
    */
    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        layoutScrollView()
        layoutPages()
        layoutPageControl()
    }

    /*
    @name   prepareScrollView
    */
    private func prepareScrollView() {
        scrollView.backgroundColor = UIColor.clearColor()
        scrollView.delegate = self
        scrollView.pagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        view.addSubview(self.scrollView)
    }
    
    /*
    @name   preparePageControl
    */
    private func preparePageControl() {
        pageControl.pageIndicatorTintColor = PageControlOptions.Indicator.Color.Tint
        pageControl.currentPageIndicatorTintColor = PageControlOptions.Indicator.Color.CurrentTint
        pageControl.currentPage = 0
        view.addSubview(self.pageControl)
    }
    
    /*
    @name   layoutScrollView
    */
    private func layoutScrollView() {
        if scrollView.frame != CGRect.zero { return }
        scrollView.frame = CGRect(x: 0, y: 64, width: view.bounds.size.width, height: view.bounds.size.height - 64)
    }
    
    /*
    @name   layoutPageControl
    */
    private func layoutPageControl() {
        let w = PageControlOptions.Indicator.Size.Width
        let h = PageControlOptions.Indicator.Size.Height
        pageControl.frame = CGRect(x: (view.bounds.size.width / 2) - (w / 2), y: CGRectGetMaxY(view.bounds) - 55, width: w, height: h)
    }
    
    /*
    @name   createPages
    */
    private func layoutPages() {
        let sw = scrollView.bounds.size.width
        let sh = scrollView.bounds.size.height // FIXME: Make this 64 dynamic based on if this view is in a scrollview or not
        for (var i = 0; i < pages.count; i++) {
            let p = pages[i]
            p.frame = CGRect(x: CGRectGetMaxX(scrollView.bounds) * CGFloat(i), y: 0, width: sw, height: sh)
            scrollView.addSubview(p)
        }
        scrollView.contentSize = CGSizeMake(sw * CGFloat(pages.count), 0)
        pageControl.numberOfPages = pages.count
    }
    
    /*
    @name   scrollViewDidScroll
    */
    @objc public func scrollViewDidScroll(scrollView: UIScrollView) {
        let pageWidth = CGRectGetWidth(self.scrollView.bounds)
        if pageWidth == 0.0 {
            return
        }
        let pageFraction = self.scrollView.contentOffset.x / pageWidth
        pageControl.currentPage = Int(round(Float(pageFraction)))
    }
}

