//
//  ViewController.m
//  Movie
//
//  Created by Marina Melo Pires on 21/09/12.
//  Copyright (c) 2012 Marina Melo Pires. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize movieInfo,viewParaMovies, viewThumbNail1, viewThumbNail2, moviePlayerLocal, moviePlayerRemoto;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

-(IBAction)tocarMovieLocal{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"filme" ofType:@"mp4"];
    NSURL *movieURL = [NSURL fileURLWithPath:path];
    
    self.moviePlayerLocal = [[MPMoviePlayerController alloc] initWithContentURL:movieURL];
    self.moviePlayerLocal.scalingMode = MPMovieScalingModeAspectFit;
    self.moviePlayerLocal.view.frame = CGRectMake(0, 0, viewParaMovies.frame.size.width, viewParaMovies.frame.size.height);
    
    self.moviePlayerRemoto.shouldAutoplay = YES;
    [self.viewParaMovies addSubview:moviePlayerLocal.view];
    
    [self.moviePlayerRemoto play];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(duracaoVideoDisponivel:) name:MPMovieDurationAvailableNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(videoAcabou:) name:MPMoviePlayerPlaybackDidFinishNotification object:nil];
}


-(void)videoAcabou:(NSNotification*) notification{
    MPMoviePlayerController *moviePlayer = [notification object];
    [[NSNotificationCenter defaultCenter]removeObserver:self name:MPMoviePlayerPlaybackDidFinishNotification object:nil];
    
    self.movieInfo.text = @"Selecione um vídeo para tocar";
    
    [moviePlayer.view removeFromSuperview];
}

-(void)duracaoVideoDisponivel:(NSNotification*) notification{
    MPMoviePlayerController *moviePlayer = [notification object];
    [[NSNotificationCenter defaultCenter]removeObserver:self name:MPMovieDurationAvailableNotification object:nil];
    
    self.movieInfo.text = [NSString stringWithFormat:@"Duração: %02d:%02d", ((int)moviePlayer.duration/60),  ((int)moviePlayer.duration%60)];
    
}


-(IBAction)tocarMovieRemoto{
    NSURL *movieURL = [NSURL URLWithString:@"http://ricardoroma.com/remoto.m4v"];
    
    self.moviePlayerRemoto = [[MPMoviePlayerController alloc] initWithContentURL:movieURL];
    self.moviePlayerRemoto.scalingMode = MPMovieScalingModeAspectFit;
    self.moviePlayerRemoto.view.frame = viewParaMovies.bounds;
    self.moviePlayerRemoto.shouldAutoplay = YES;
    
    [viewParaMovies addSubview:moviePlayerRemoto.view];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(mudouEstadoCarregando:) name:MPMoviePlayerLoadStateDidChangeNotification object:nil];
    
    NSArray *timeArray = [NSArray arrayWithObjects:[NSNumber numberWithFloat:3.0], [NSNumber numberWithFloat:20.0], nil];
    [moviePlayerRemoto requestThumbnailImagesAtTimes:timeArray timeOption:MPMovieTimeOptionExact];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(imagensThumbDisponiveis:) name:MPMoviePlayerThumbnailImageRequestDidFinishNotification object:nil];
    
    self.movieInfo.text = @"Baixando video";
}


-(void)mudouEstadoCarregando:(NSNotification*) notification{
    MPMoviePlayerController *moviePlayer = [notification object];
    if(moviePlayer.loadState == MPMovieLoadStateUnknown)
        self.movieInfo.text = @"Carregando";
    
    if(moviePlayer.loadState == MPMovieLoadStateStalled)
        self.movieInfo.text = @"Parado";
    
    if(moviePlayer.loadState == MPMovieLoadStatePlayable)
        self.movieInfo.text = @"Pode tocar";
}

-(void)imagensThumbDisponiveis:(NSNotification*) notification{
    NSDictionary *thumbDict = [notification userInfo];
    NSString *thumbTime = [NSString stringWithFormat:@"%.0f", [[thumbDict objectForKey:MPMoviePlayerThumbnailTimeKey] floatValue]];
    
    if([thumbTime floatValue] == 3.0)
        self.viewThumbNail1.image = [thumbDict objectForKey:MPMoviePlayerThumbnailImageKey];
    else
        self.viewThumbNail2.image = [thumbDict objectForKey:MPMoviePlayerThumbnailImageKey];
}

@end
