#import <LegacyComponents/LegacyComponents.h>

#import <SSignalKit/SSignalKit.h>

@class TGDialogListController;
@class TGContactsController;
@class TGAccountSettingsController;
@class TGRecentCallsController;
@class TGMainTabsController;
@class TGCallStatusBarView;
@class TGVolumeBarView;

/////// MY MODIFICATION: ADD SHOPPING CONTROLLER ////////
@class BBShoppingController;

@interface TGRootController : TGViewController

@property (nonatomic, strong, readonly) TGMainTabsController *mainTabsController;
@property (nonatomic, strong, readonly) TGDialogListController *dialogListController;

//////// MY MODIFICATION: REPLACE CONTACTS CONTROLLER BY SHOPPING CONTROLLER /////////
//@property (nonatomic, strong, readonly) TGContactsController *contactsController;
@property (nonatomic, strong, readonly) BBShoppingController *shoppingController;

@property (nonatomic, strong) TGAccountSettingsController *accountSettingsController;
@property (nonatomic, strong, readonly) TGRecentCallsController *callsController;
@property (nonatomic, strong, readonly) TGCallStatusBarView *callStatusBarView;
@property (nonatomic, strong, readonly) TGVolumeBarView *volumeBarView;

- (SSignal *)sizeClass;
- (bool)isSplitView;
- (bool)isSlideOver;
- (CGRect)applicationBounds;

- (bool)callStatusBarHidden;

- (void)pushContentController:(UIViewController *)contentController;
- (void)replaceContentController:(UIViewController *)contentController;
- (void)popToContentController:(UIViewController *)contentController;
- (void)clearContentControllers;
- (NSArray *)viewControllers;

- (void)resetControllers;

- (void)localizationUpdated;

- (bool)isRTL;

@end
