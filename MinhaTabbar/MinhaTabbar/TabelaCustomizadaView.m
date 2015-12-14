//
//  TabelaCustomizadaView.m
//  MinhaTabbar
//
//  Created by Marina Melo Pires on 26/09/12.
//  Copyright (c) 2012 Marina Melo Pires. All rights reserved.
//

#import "TabelaCustomizadaView.h"
#import "MyCustomCell.h"
#import "ModalTabelaCustomizadaView.h"


@interface TabelaCustomizadaView ()

@end

@implementation TabelaCustomizadaView

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Custom", @"Custom");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
        //self.tabbar item.title
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.arrayTabela = [[NSMutableArray alloc] init];
    
    NSDictionary* dictBrasil = [NSDictionary dictionaryWithObjectsAndKeys:@"Brasil", @"pais", @"Português", @"idioma", @"Brazil.gif", @"bandeira", @"http://www.google.com.br", @"url", nil];
    
    [self.arrayTabela addObject:dictBrasil];
    
    NSDictionary* dictArgentina = [NSDictionary dictionaryWithObjectsAndKeys:@"Argentina", @"pais", @"Espanhol", @"idioma", @"Argentina.gif", @"bandeira", @"http://www.facebook.com", @"url", nil];
    
    [self.arrayTabela addObject:dictArgentina];
    
    NSDictionary* dictUsa = [NSDictionary dictionaryWithObjectsAndKeys:@"EUA", @"pais", @"Inglês", @"idioma", @"USA.gif", @"bandeira", @"http://www.globo.com", @"url", nil];
    
    [self.arrayTabela addObject:dictUsa];
    
    self.tableView.rowHeight = 50;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.arrayTabela count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    MyCustomCell *cell = (MyCustomCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"MyCustomCell" owner:nil options:nil] objectAtIndex: 0];
    }
    
    NSDictionary *dict = [self.arrayTabela objectAtIndex:indexPath.row];
    [cell.texto setText: [dict objectForKey:@"pais"]];
    [cell.imagem setImage:[UIImage imageNamed:[dict objectForKey:@"bandeira"]]];
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ModalTabelaCustomizadaView *modalView = [[ModalTabelaCustomizadaView alloc] initWithNibName:@"ModalTabelaCustomizadaView" bundle:nil];
    
    [modalView setMensagem:[NSString stringWithFormat: @"Linha clicada foi %d", indexPath.row + 1]];
    
    [self.navigationController pushViewController:modalView animated:YES];
}

@end
