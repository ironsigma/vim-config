" Vim syntax file
" Language:     Objective-C Cocoa Extension
" Maintainer:   Juan Frias
" Last Change:  2005 Nov 28


" Keywords
syn keyword	objcTypeModifier IBOutlet IBAction

syn keyword objcConstant YES NO containedin=objcMessage

syn keyword objcFoundation NSAffineTransform NSAppleEventDescriptor NSAppleEventManager NSAppleScript NSArchiver
            \ NSArray NSAssertionHandler NSAttributedString NSAutoreleasePool NSBundle NSCachedURLResponse NSCalendar
            \ NSCalendarDate NSCharacterSet NSClassDescription NSCloneCommand NSCloseCommand NSCoder NSComparisonPredicate
            \ NSCompoundPredicate NSConditionLock NSConnection NSCountCommand NSCountedSet NSCreateCommand NSData NSDate
            \ NSDateComponents NSDateFormatter NSDecimalNumber NSDecimalNumberHandler NSDeleteCommand NSDeserializer
            \ NSDictionary NSDirectoryEnumerator NSDistantObject NSDistantObjectRequest NSDistributedLock
            \ NSDistributedNotificationCenter NSEnumerator NSError NSException NSExistsCommand NSExpression NSFileHandle
            \ NSFileManager NSFormatter NSGetCommand NSHost NSHTTPCookie NSHTTPCookieStorage NSHTTPURLResponse NSIndexPath
            \ NSIndexSet NSIndexSpecifier NSInputStream NSInvocation NSKeyedArchiver NSKeyedUnarchiver NSLocale NSLock
            \ NSLogicalTest NSMachBootstrapServer NSMachPort NSMessagePort NSMessagePortNameServer NSMetadataItem
            \ NSMetadataQuery NSMetadataQueryAttributeValueTuple NSMetadataQueryResultGroup NSMethodSignature NSMiddleSpecifier
            \ NSMoveCommand NSMutableArray NSMutableAttributedString NSMutableCharacterSet NSMutableData NSMutableDictionary
            \ NSMutableIndexSet NSMutableSet NSMutableString NSMutableURLRequest NSNameSpecifier NSNetService
            \ NSNetServiceBrowser NSNotification NSNotificationCenter NSNotificationQueue NSNull NSNumber NSNumberFormatter
            \ NSObject NSOutputStream NSPipe NSPort NSPortCoder NSPortMessage NSPortNameServer NSPositionalSpecifier NSPredicate
            \ NSProcessInfo NSPropertyListSerialization NSPropertySpecifier NSProtocolChecker NSProxy NSQuitCommand
            \ NSRandomSpecifier NSRangeSpecifier NSRecursiveLock NSRelativeSpecifier NSRunLoop NSScanner
            \ NSScriptClassDescription NSScriptCommandDescription NSScriptCoercionHandler NSScriptCommand
            \ NSScriptExecutionContext NSScriptObjectSpecifier NSScriptSuiteRegistry NSScriptWhoseTest NSSerializer NSSet
            \ NSSetCommand NSSocketPort NSSocketPortNameServer NSSortDescriptor NSSpecifierTest NSSpellServer NSStream NSString
            \ NSTask NSThread NSTimer NSTimeZone NSUnarchiver NSUndoManager NSUniqueIDSpecifier NSURL
            \ NSURLAuthenticationChallenge NSURLCache NSURLConnection NSURLCredential NSURLCredentialStorage NSURLDownload
            \ NSURLHandle NSURLProtectionSpace NSURLProtocol NSURLRequest NSURLResponse NSUserDefaults NSValue
            \ NSValueTransformer NSWhoseSpecifier NSXMLDocument NSXMLDTD NSXMLDTDNode NSXMLElement NSXMLNode
            \ NSXMLParser containedin=objcMessage

syn keyword objcFoundationProtocol NSCoding NSComparisonMethods NSCopying NSDecimalNumberBehaviors NSErrorRecoveryAttempting
            \ NSKeyValueCoding NSKeyValueObserving NSLocking NSMutableCopying NSObjCTypeSerializationCallBack NSObject
            \ NSScriptingComparisonMethods NSScriptKeyValueCoding NSScriptObjectSpecifiers NSURLAuthenticationChallengeSender
            \ NSURLClient NSURLHandleClient NSURLProtocolClient containedin=objcMessage

syn keyword objcAppKit CIColor Additions CIImage Additions NSActionCell NSAffineTransform Additions NSAlert NSAnimation
            \ NSAppleScript Additions NSApplication NSArrayController NSATSTypesetter NSAttributedString Additions
            \ NSBezierPath NSBitmapImageRep NSBox NSBrowser NSBrowserCell NSBundle Additions NSButton NSButtonCell
            \ NSCachedImageRep NSCell NSCIImageRep NSClipView NSCoder Additions NSColor NSColorList NSColorPanel NSColorPicker
            \ NSColorSpace NSColorWell NSComboBox NSComboBoxCell NSControl NSController NSCursor NSCustomImageRep NSDatePicker
            \ NSDatePickerCell NSDocument NSDocumentController NSDrawer NSEPSImageRep NSEvent NSFileWrapper NSFont
            \ NSFontDescriptor NSFontManager NSFontPanel NSForm NSFormCell NSGlyphGenerator NSGlyphInfo NSGraphicsContext
            \ NSHelpManager NSImage NSImageCell NSImageRep NSImageView NSInputManager NSInputServer NSLayoutManager
            \ NSLevelIndicator NSLevelIndicatorCell NSMatrix NSMenu NSMenuItem NSMenuItemCell NSMenuView NSMovie NSMovieView
            \ NSMutableAttributedString Additions NSMutableParagraphStyle NSNib NSNibConnector NSNibControlConnector
            \ NSNibOutletConnector NSObjectController NSOpenGLContext NSOpenGLPixelBuffer NSOpenGLPixelFormat NSOpenGLView
            \ NSOpenPanel NSOutlineView NSPageLayout NSPanel NSParagraphStyle NSPasteboard NSPDFImageRep NSPersistentDocument
            \ NSPICTImageRep NSPopUpButton NSPopUpButtonCell NSPrinter NSPrintInfo NSPrintOperation NSPrintPanel
            \ NSProgressIndicator NSQuickDrawView NSResponder NSRulerMarker NSRulerView NSSavePanel NSScreen NSScroller
            \ NSScrollView NSSearchField NSSearchFieldCell NSSecureTextField NSSecureTextFieldCell NSSegmentedCell
            \ NSSegmentedControl NSShadow NSSimpleHorizontalTypesetter NSSlider NSSliderCell NSSound NSSpeechRecognizer
            \ NSSpeechSynthesizer NSSpellChecker NSSplitView NSStatusBar NSStatusItem NSStepper NSStepperCell NSString Additions
            \ NSTableColumn NSTableHeaderCell NSTableHeaderView NSTableView NSTabView NSTabViewItem NSText NSTextAttachment
            \ NSTextAttachmentCell NSTextBlock NSTextContainer NSTextField NSTextFieldCell NSTextList NSTextStorage NSTextTab
            \ NSTextTable NSTextTableBlock NSTextView NSTokenField NSTokenFieldCell NSToolbar NSToolbarItem NSTreeController
            \ NSTypesetter NSURL Additions NSUserDefaultsController NSView NSViewAnimation NSWindow NSWindowController
            \ NSWorkspace NSApp containedin=objcMessage

syn keyword objcAppKitProtocol NSAccessibility NSChangeSpelling NSColorPickingCustom NSColorPickingDefault
            \ NSComboBoxCellDataSource NSComboBoxDataSource NSDraggingDestination NSDraggingInfo NSDraggingSource NSEditor
            \ NSEditorRegistration NSFontPanelValidation NSGlyphStorage NSIgnoreMisspelledWords NSInputServerMouseTracker
            \ NSInputServiceProvider NSKeyValueBindingCreation NSMenuItem NSMenuValidation NSNibAwaking NSOutlineViewDataSource
            \ NSPlaceholders NSServicesRequests NSTableDataSource NSTextAttachmentCell NSTextInput NSToolbarItemValidation
            \ NSToolTipOwner NSUserInterfaceValidations NSValidatedUserInterfaceItem NSWindowScripting containedin=objcMessage

syn keyword objcCocoaFunction init dealloc retain release containedin=objcMessage

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_objc_syntax_inits")
  if version < 508
    let did_objc_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink objcFoundation             Type
  HiLink objcFoundationProtocol     cConstant
  HiLink objcAppKit                 Type
  HiLink objcAppKitProtocol         cConstant
  HiLink objcCocoaFunction          Function

  delcommand HiLink
endif
