//
//  ViewController.m
//  TableViwe
//
//  Created by Marina Melo Pires on 18/09/12.
//  Copyright (c) 2012 Marina Melo Pires. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize arrayTabela;

- (void)viewDidLoad
{
    [super viewDidLoad];
    arrayTabela = [[NSMutableArray alloc] init];
    
    NSDictionary* dictBrasil = [NSDictionary dictionaryWithObjectsAndKeys:@"Brasil", @"pais", @"Português", @"idioma", @"Brazil.gif", @"bandeira", nil];

    [arrayTabela addObject:dictBrasil];
    
    NSDictionary* dictArgentina = [NSDictionary dictionaryWithObjectsAndKeys:@"Argentina", @"pais", @"Espanhol", @"idioma", @"Argentina.gif", @"bandeira", nil];
    
    [arrayTabela addObject:dictArgentina];
    
    NSDictionary* dictUsa = [NSDictionary dictionaryWithObjectsAndKeys:@"EUA", @"pais", @"Inglês", @"idioma", @"USA.gif", @"bandeira", nil];
    
    [arrayTabela addObject:dictUsa];
    
    self.tableView.rowHeight = 60;
    
    self.navigationItem.leftBarButtonItem = self.editButtonItem;    
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

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [arrayTabela count];
}


-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"Países";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    NSDictionary* dict = [arrayTabela objectAtIndex:indexPath.row];
    cell.textLabel.text = [dict objectForKey:@"pais"];
    cell.detailTextLabel.text = [dict objectForKey:@"idioma"];
    cell.imageView.image = [UIImage imageNamed:[dict objectForKey:@"bandeira"]];
    
    return cell;
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}


-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [arrayTabela removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationLeft];
    }
}

-(void)insertNewObject:(id) sender{
    int posicao = [arrayTabela count];
    [self.arrayTabela insertObject:@"EU" atIndex:posicao];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:posicao inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationRight];
}

@end
