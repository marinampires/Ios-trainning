//
//  MovieViewController.h
//  MinhaTabbar
//
//  Created by Marina Melo Pires on 26/09/12.
//  Copyright (c) 2012 Marina Melo Pires. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@interface MovieViewController : UIViewController
@property(nonatomic, strong) IBOutlet UIView *viewParaMovies;
@property(nonatomic, strong) MPMoviePlayerController *moviePlayerLocal;

@end
