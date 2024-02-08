.class final Lcom/android/server/usb/UsbDeviceManager$UsbHandler;
.super Landroid/os/Handler;
.source "UsbDeviceManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/usb/UsbDeviceManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "UsbHandler"
.end annotation


# instance fields
.field private mAdbNotificationShown:Z

.field private mAudioAccessoryConnected:Z

.field private mAudioAccessorySupported:Z

.field private mConfigured:Z

.field private mConnected:Z

.field private mCurrentAccessory:Landroid/hardware/usb/UsbAccessory;

.field private mCurrentFunctions:Ljava/lang/String;

.field private mCurrentFunctionsApplied:Z

.field private mCurrentOemFunctions:Ljava/lang/String;

.field private mCurrentUser:I

.field private mHideUsbNotification:Z

.field private mHostConnected:Z

.field private mSinkPower:Z

.field private mSourcePower:Z

.field private mSupportsAllCombinations:Z

.field private mUsbCharging:Z

.field private mUsbDataUnlocked:Z

.field private mUsbNotificationId:I

.field final synthetic this$0:Lcom/android/server/usb/UsbDeviceManager;


# direct methods
.method public constructor <init>(Lcom/android/server/usb/UsbDeviceManager;Landroid/os/Looper;)V
    .registers 7

    .prologue
    .line 432
    iput-object p1, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->this$0:Lcom/android/server/usb/UsbDeviceManager;

    .line 433
    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 426
    const/16 v0, -0x2710

    iput v0, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mCurrentUser:I

    .line 437
    :try_start_9
    invoke-direct {p0}, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->isNormalBoot()Z

    move-result v0

    if-eqz v0, :cond_a6

    .line 438
    const-string/jumbo v0, "sys.usb.config"

    .line 439
    const-string/jumbo v1, "none"

    .line 438
    invoke-static {v0, v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mCurrentFunctions:Ljava/lang/String;

    .line 440
    iget-object v0, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mCurrentFunctions:Ljava/lang/String;

    .line 441
    const-string/jumbo v1, "sys.usb.state"

    invoke-static {v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 440
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mCurrentFunctionsApplied:Z

    .line 455
    :goto_2a
    const-string/jumbo v0, "persist.sys.usb.config"

    invoke-static {v0}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 456
    const-string/jumbo v1, "adb"

    .line 454
    invoke-static {v0, v1}, Landroid/hardware/usb/UsbManager;->containsFunction(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    invoke-static {p1, v0}, Lcom/android/server/usb/UsbDeviceManager;->-set1(Lcom/android/server/usb/UsbDeviceManager;Z)Z

    .line 462
    const-string/jumbo v0, "persist.sys.usb.config"

    invoke-static {v0}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 463
    const-string/jumbo v1, "mtp"

    invoke-static {v0, v1}, Landroid/hardware/usb/UsbManager;->containsFunction(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_54

    .line 464
    const-string/jumbo v1, "ptp"

    invoke-static {v0, v1}, Landroid/hardware/usb/UsbManager;->containsFunction(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    .line 463
    if-eqz v1, :cond_68

    .line 465
    :cond_54
    const-string/jumbo v1, "persist.sys.usb.config"

    .line 467
    const-string/jumbo v2, "mtp"

    .line 466
    invoke-static {v0, v2}, Landroid/hardware/usb/UsbManager;->removeFunction(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 467
    const-string/jumbo v2, "ptp"

    .line 466
    invoke-static {v0, v2}, Landroid/hardware/usb/UsbManager;->removeFunction(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 465
    invoke-static {v1, v0}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 470
    :cond_68
    new-instance v0, Ljava/io/File;

    const-string/jumbo v1, "/sys/class/android_usb/android0/state"

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/os/FileUtils;->readTextFile(Ljava/io/File;ILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 471
    invoke-virtual {p0, v0}, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->updateState(Ljava/lang/String;)V

    .line 474
    invoke-static {p1}, Lcom/android/server/usb/UsbDeviceManager;->-get5(Lcom/android/server/usb/UsbDeviceManager;)Landroid/content/ContentResolver;

    move-result-object v0

    .line 475
    const-string/jumbo v1, "adb_enabled"

    invoke-static {v1}, Landroid/provider/Settings$Global;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    .line 476
    new-instance v2, Lcom/android/server/usb/UsbDeviceManager$AdbSettingsObserver;

    invoke-direct {v2, p1}, Lcom/android/server/usb/UsbDeviceManager$AdbSettingsObserver;-><init>(Lcom/android/server/usb/UsbDeviceManager;)V

    const/4 v3, 0x0

    .line 474
    invoke-virtual {v0, v1, v3, v2}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 479
    invoke-static {p1}, Lcom/android/server/usb/UsbDeviceManager;->-get15(Lcom/android/server/usb/UsbDeviceManager;)Landroid/os/UEventObserver;

    move-result-object v0

    const-string/jumbo v1, "DEVPATH=/devices/virtual/android_usb/android0"

    invoke-virtual {v0, v1}, Landroid/os/UEventObserver;->startObserving(Ljava/lang/String;)V

    .line 480
    invoke-static {p1}, Lcom/android/server/usb/UsbDeviceManager;->-get15(Lcom/android/server/usb/UsbDeviceManager;)Landroid/os/UEventObserver;

    move-result-object v0

    const-string/jumbo v1, "DEVPATH=/devices/virtual/misc/usb_accessory"

    invoke-virtual {v0, v1}, Landroid/os/UEventObserver;->startObserving(Ljava/lang/String;)V

    .line 484
    :goto_a5
    return-void

    .line 443
    :cond_a6
    const/4 v0, 0x1

    invoke-static {v0}, Lcom/android/server/usb/UsbDeviceManager;->getPersistProp(Z)Ljava/lang/String;

    move-result-object v0

    .line 444
    const-string/jumbo v1, "none"

    .line 443
    invoke-static {v0, v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mCurrentFunctions:Ljava/lang/String;

    .line 445
    const-string/jumbo v0, "sys.usb.config"

    .line 446
    const-string/jumbo v1, "none"

    .line 445
    invoke-static {v0, v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 447
    const-string/jumbo v1, "sys.usb.state"

    invoke-static {v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 445
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mCurrentFunctionsApplied:Z
    :try_end_cb
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_cb} :catch_cd

    goto/16 :goto_2a

    .line 481
    :catch_cd
    move-exception v0

    .line 482
    const-string/jumbo v1, "UsbDeviceManager"

    const-string/jumbo v2, "Error initializing UsbHandler"

    invoke-static {v1, v2, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_a5
.end method

.method private applyAdbFunction(Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    .prologue
    .line 706
    if-nez p1, :cond_5

    .line 707
    const-string/jumbo p1, ""

    .line 709
    :cond_5
    iget-object v0, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->this$0:Lcom/android/server/usb/UsbDeviceManager;

    invoke-static {v0}, Lcom/android/server/usb/UsbDeviceManager;->-get1(Lcom/android/server/usb/UsbDeviceManager;)Z

    move-result v0

    if-eqz v0, :cond_15

    .line 710
    const-string/jumbo v0, "adb"

    invoke-static {p1, v0}, Landroid/hardware/usb/UsbManager;->addFunction(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 714
    :goto_14
    return-object v0

    .line 712
    :cond_15
    const-string/jumbo v0, "adb"

    invoke-static {p1, v0}, Landroid/hardware/usb/UsbManager;->removeFunction(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_14
.end method

.method private getDefaultFunctions()Ljava/lang/String;
    .registers 3

    .prologue
    .line 1239
    const/4 v0, 0x1

    invoke-static {v0}, Lcom/android/server/usb/UsbDeviceManager;->getPersistProp(Z)Ljava/lang/String;

    move-result-object v0

    .line 1240
    const-string/jumbo v1, "none"

    .line 1239
    invoke-static {v0, v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1243
    const-string/jumbo v1, "adb"

    invoke-static {v0, v1}, Landroid/hardware/usb/UsbManager;->containsFunction(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_19

    .line 1244
    const-string/jumbo v0, "adb"

    return-object v0

    .line 1246
    :cond_19
    const-string/jumbo v0, "mtp"

    return-object v0
.end method

.method private isNormalBoot()Z
    .registers 3

    .prologue
    .line 647
    const-string/jumbo v0, "ro.bootmode"

    const-string/jumbo v1, "unknown"

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 648
    const-string/jumbo v1, "normal"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1b

    const-string/jumbo v1, "unknown"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    :goto_1a
    return v0

    :cond_1b
    const/4 v0, 0x1

    goto :goto_1a
.end method

.method private isUsbDataTransferActive()Z
    .registers 3

    .prologue
    .line 1041
    iget-object v0, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mCurrentFunctions:Ljava/lang/String;

    const-string/jumbo v1, "mtp"

    invoke-static {v0, v1}, Landroid/hardware/usb/UsbManager;->containsFunction(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_15

    .line 1042
    iget-object v0, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mCurrentFunctions:Ljava/lang/String;

    const-string/jumbo v1, "ptp"

    invoke-static {v0, v1}, Landroid/hardware/usb/UsbManager;->containsFunction(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    .line 1041
    :goto_14
    return v0

    :cond_15
    const/4 v0, 0x1

    goto :goto_14
.end method

.method private isUsbStateChanged(Landroid/content/Intent;)Z
    .registers 8

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 764
    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Bundle;->keySet()Ljava/util/Set;

    move-result-object v0

    .line 765
    iget-object v1, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->this$0:Lcom/android/server/usb/UsbDeviceManager;

    invoke-static {v1}, Lcom/android/server/usb/UsbDeviceManager;->-get4(Lcom/android/server/usb/UsbDeviceManager;)Landroid/content/Intent;

    move-result-object v1

    if-nez v1, :cond_29

    .line 766
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_16
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_5f

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 767
    invoke-virtual {p1, v0, v4}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_16

    .line 768
    return v5

    .line 772
    :cond_29
    iget-object v1, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->this$0:Lcom/android/server/usb/UsbDeviceManager;

    invoke-static {v1}, Lcom/android/server/usb/UsbDeviceManager;->-get4(Lcom/android/server/usb/UsbDeviceManager;)Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v1

    invoke-virtual {v1}, Landroid/os/Bundle;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3e

    .line 773
    return v5

    .line 775
    :cond_3e
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_42
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_5f

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 776
    invoke-virtual {p1, v0, v4}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v2

    .line 777
    iget-object v3, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->this$0:Lcom/android/server/usb/UsbDeviceManager;

    invoke-static {v3}, Lcom/android/server/usb/UsbDeviceManager;->-get4(Lcom/android/server/usb/UsbDeviceManager;)Landroid/content/Intent;

    move-result-object v3

    invoke-virtual {v3, v0, v4}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    .line 776
    if-eq v2, v0, :cond_42

    .line 778
    return v5

    .line 782
    :cond_5f
    return v4
.end method

.method private isUsbTransferAllowed()Z
    .registers 3

    .prologue
    .line 718
    iget-object v0, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->this$0:Lcom/android/server/usb/UsbDeviceManager;

    invoke-static {v0}, Lcom/android/server/usb/UsbDeviceManager;->-get6(Lcom/android/server/usb/UsbDeviceManager;)Landroid/content/Context;

    move-result-object v0

    const-string/jumbo v1, "user"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/UserManager;

    .line 719
    const-string/jumbo v1, "no_usb_file_transfer"

    invoke-virtual {v0, v1}, Landroid/os/UserManager;->hasUserRestriction(Ljava/lang/String;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method private notifyAccessoryModeExit()V
    .registers 5

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 751
    const-string/jumbo v0, "UsbDeviceManager"

    const-string/jumbo v1, "exited USB accessory mode"

    invoke-static {v0, v1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 752
    invoke-direct {p0, v2, v3, v3}, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->setEnabledFunctions(Ljava/lang/String;ZZ)V

    .line 754
    iget-object v0, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mCurrentAccessory:Landroid/hardware/usb/UsbAccessory;

    if-eqz v0, :cond_2c

    .line 755
    iget-object v0, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->this$0:Lcom/android/server/usb/UsbDeviceManager;

    invoke-static {v0}, Lcom/android/server/usb/UsbDeviceManager;->-get3(Lcom/android/server/usb/UsbDeviceManager;)Z

    move-result v0

    if-eqz v0, :cond_25

    .line 756
    iget-object v0, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->this$0:Lcom/android/server/usb/UsbDeviceManager;

    invoke-static {v0}, Lcom/android/server/usb/UsbDeviceManager;->-get14(Lcom/android/server/usb/UsbDeviceManager;)Lcom/android/server/usb/UsbSettingsManager;

    move-result-object v0

    iget-object v1, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mCurrentAccessory:Landroid/hardware/usb/UsbAccessory;

    invoke-virtual {v0, v1}, Lcom/android/server/usb/UsbSettingsManager;->usbAccessoryRemoved(Landroid/hardware/usb/UsbAccessory;)V

    .line 758
    :cond_25
    iput-object v2, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mCurrentAccessory:Landroid/hardware/usb/UsbAccessory;

    .line 759
    iget-object v0, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->this$0:Lcom/android/server/usb/UsbDeviceManager;

    invoke-static {v0, v2}, Lcom/android/server/usb/UsbDeviceManager;->-set0(Lcom/android/server/usb/UsbDeviceManager;[Ljava/lang/String;)[Ljava/lang/String;

    .line 761
    :cond_2c
    return-void
.end method

.method private setAdbEnabled(Z)V
    .registers 5

    .prologue
    .line 571
    iget-object v0, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->this$0:Lcom/android/server/usb/UsbDeviceManager;

    invoke-static {v0}, Lcom/android/server/usb/UsbDeviceManager;->-get1(Lcom/android/server/usb/UsbDeviceManager;)Z

    move-result v0

    if-eq p1, v0, :cond_41

    .line 572
    iget-object v0, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->this$0:Lcom/android/server/usb/UsbDeviceManager;

    invoke-static {v0, p1}, Lcom/android/server/usb/UsbDeviceManager;->-set1(Lcom/android/server/usb/UsbDeviceManager;Z)Z

    .line 573
    iget-object v0, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mCurrentFunctions:Ljava/lang/String;

    .line 577
    const-string/jumbo v1, "persist.sys.usb.config"

    const-string/jumbo v2, "none"

    .line 576
    invoke-static {v1, v2}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->applyAdbFunction(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 578
    const-string/jumbo v2, "persist.sys.usb.config"

    invoke-static {v2, v1}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 581
    const-string/jumbo v1, "mtp"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_37

    .line 582
    iget-boolean v1, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mUsbDataUnlocked:Z

    xor-int/lit8 v1, v1, 0x1

    .line 581
    if-eqz v1, :cond_37

    if-eqz p1, :cond_37

    .line 583
    const-string/jumbo v0, "none"

    .line 586
    :cond_37
    iget-boolean v1, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mUsbDataUnlocked:Z

    const/4 v2, 0x1

    invoke-direct {p0, v0, v2, v1}, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->setEnabledFunctions(Ljava/lang/String;ZZ)V

    .line 587
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->updateAdbNotification(Z)V

    .line 590
    :cond_41
    iget-object v0, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->this$0:Lcom/android/server/usb/UsbDeviceManager;

    invoke-static {v0}, Lcom/android/server/usb/UsbDeviceManager;->-get7(Lcom/android/server/usb/UsbDeviceManager;)Lcom/android/server/usb/UsbDebuggingManager;

    move-result-object v0

    if-eqz v0, :cond_58

    .line 591
    iget-object v0, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->this$0:Lcom/android/server/usb/UsbDeviceManager;

    invoke-static {v0}, Lcom/android/server/usb/UsbDeviceManager;->-get7(Lcom/android/server/usb/UsbDeviceManager;)Lcom/android/server/usb/UsbDebuggingManager;

    move-result-object v0

    iget-object v1, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->this$0:Lcom/android/server/usb/UsbDeviceManager;

    invoke-static {v1}, Lcom/android/server/usb/UsbDeviceManager;->-get1(Lcom/android/server/usb/UsbDeviceManager;)Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/android/server/usb/UsbDebuggingManager;->setAdbEnabled(Z)V

    .line 593
    :cond_58
    return-void
.end method

.method private setEnabledFunctions(Ljava/lang/String;ZZ)V
    .registers 8

    .prologue
    const/4 v3, 0x0

    .line 605
    iget-boolean v0, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mUsbDataUnlocked:Z

    if-eq p3, v0, :cond_b

    .line 606
    iput-boolean p3, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mUsbDataUnlocked:Z

    .line 607
    invoke-direct {p0, v3}, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->updateUsbNotification(Z)V

    .line 608
    const/4 p2, 0x1

    .line 612
    :cond_b
    iget-object v0, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mCurrentFunctions:Ljava/lang/String;

    .line 613
    iget-boolean v1, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mCurrentFunctionsApplied:Z

    .line 614
    invoke-direct {p0, p1, p2}, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->trySetEnabledFunctions(Ljava/lang/String;Z)Z

    move-result v2

    if-eqz v2, :cond_16

    .line 615
    return-void

    .line 622
    :cond_16
    if-eqz v1, :cond_30

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    xor-int/lit8 v1, v1, 0x1

    if-eqz v1, :cond_30

    .line 623
    const-string/jumbo v1, "UsbDeviceManager"

    const-string/jumbo v2, "Failsafe 1: Restoring previous USB functions."

    invoke-static {v1, v2}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 624
    invoke-direct {p0, v0, v3}, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->trySetEnabledFunctions(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_30

    .line 625
    return-void

    .line 630
    :cond_30
    const-string/jumbo v0, "UsbDeviceManager"

    const-string/jumbo v1, "Failsafe 2: Restoring default USB functions."

    invoke-static {v0, v1}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 631
    const/4 v0, 0x0

    invoke-direct {p0, v0, v3}, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->trySetEnabledFunctions(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_41

    .line 632
    return-void

    .line 637
    :cond_41
    const-string/jumbo v0, "UsbDeviceManager"

    const-string/jumbo v1, "Failsafe 3: Restoring empty function list (with ADB if enabled)."

    invoke-static {v0, v1}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 638
    const-string/jumbo v0, "none"

    invoke-direct {p0, v0, v3}, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->trySetEnabledFunctions(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_54

    .line 639
    return-void

    .line 643
    :cond_54
    const-string/jumbo v0, "UsbDeviceManager"

    const-string/jumbo v1, "Unable to set any USB functions!"

    invoke-static {v0, v1}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 644
    return-void
.end method

.method private setUsbConfig(Ljava/lang/String;)V
    .registers 3

    .prologue
    .line 566
    const-string/jumbo v0, "sys.usb.config"

    invoke-static {v0, p1}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 567
    return-void
.end method

.method private trySetEnabledFunctions(Ljava/lang/String;Z)Z
    .registers 10

    .prologue
    const/4 v6, 0x0

    const/4 v5, 0x1

    .line 652
    if-eqz p1, :cond_11

    invoke-direct {p0, p1}, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->applyAdbFunction(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 653
    const-string/jumbo v1, "none"

    .line 652
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_15

    .line 654
    :cond_11
    invoke-direct {p0}, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->getDefaultFunctions()Ljava/lang/String;

    move-result-object p1

    .line 656
    :cond_15
    invoke-direct {p0, p1}, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->applyAdbFunction(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 658
    iget-object v1, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->this$0:Lcom/android/server/usb/UsbDeviceManager;

    invoke-static {v1, v0}, Lcom/android/server/usb/UsbDeviceManager;->-wrap1(Lcom/android/server/usb/UsbDeviceManager;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 660
    invoke-direct {p0}, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->isNormalBoot()Z

    move-result v2

    if-nez v2, :cond_36

    iget-object v2, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mCurrentFunctions:Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    xor-int/lit8 v2, v2, 0x1

    if-eqz v2, :cond_36

    .line 661
    invoke-static {v5}, Lcom/android/server/usb/UsbDeviceManager;->getPersistProp(Z)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, v0}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 664
    :cond_36
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_4a

    .line 665
    iget-object v2, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mCurrentOemFunctions:Ljava/lang/String;

    if-eqz v2, :cond_5c

    .line 666
    iget-object v2, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mCurrentOemFunctions:Ljava/lang/String;

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    xor-int/lit8 v2, v2, 0x1

    .line 664
    if-nez v2, :cond_5c

    .line 667
    :cond_4a
    iget-object v2, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mCurrentFunctions:Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    xor-int/lit8 v2, v2, 0x1

    .line 664
    if-nez v2, :cond_5c

    .line 668
    iget-boolean v2, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mCurrentFunctionsApplied:Z

    xor-int/lit8 v2, v2, 0x1

    .line 664
    if-nez v2, :cond_5c

    if-eqz p2, :cond_d8

    .line 670
    :cond_5c
    const-string/jumbo v2, "UsbDeviceManager"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "Setting USB config to "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 671
    iput-object v0, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mCurrentFunctions:Ljava/lang/String;

    .line 672
    iput-object v1, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mCurrentOemFunctions:Ljava/lang/String;

    .line 673
    iput-boolean v6, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mCurrentFunctionsApplied:Z

    .line 676
    const-string/jumbo v2, "none"

    invoke-direct {p0, v2}, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->setUsbConfig(Ljava/lang/String;)V

    .line 678
    const-string/jumbo v2, "none"

    invoke-direct {p0, v2}, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->waitForState(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_95

    .line 679
    const-string/jumbo v0, "UsbDeviceManager"

    const-string/jumbo v1, "Failed to kick USB config"

    invoke-static {v0, v1}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 680
    return v6

    .line 684
    :cond_95
    invoke-direct {p0, v1}, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->setUsbConfig(Ljava/lang/String;)V

    .line 686
    iget-object v2, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->this$0:Lcom/android/server/usb/UsbDeviceManager;

    invoke-static {v2}, Lcom/android/server/usb/UsbDeviceManager;->-get3(Lcom/android/server/usb/UsbDeviceManager;)Z

    move-result v2

    if-eqz v2, :cond_b5

    .line 687
    const-string/jumbo v2, "mtp"

    invoke-static {v0, v2}, Landroid/hardware/usb/UsbManager;->containsFunction(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_b2

    .line 688
    const-string/jumbo v2, "ptp"

    invoke-static {v0, v2}, Landroid/hardware/usb/UsbManager;->containsFunction(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    .line 686
    if-eqz v2, :cond_b5

    .line 690
    :cond_b2
    invoke-direct {p0, v5}, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->updateUsbStateBroadcastIfNeeded(Z)V

    .line 693
    :cond_b5
    invoke-direct {p0, v1}, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->waitForState(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_d6

    .line 694
    const-string/jumbo v1, "UsbDeviceManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Failed to switch USB config to "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 695
    return v6

    .line 698
    :cond_d6
    iput-boolean v5, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mCurrentFunctionsApplied:Z

    .line 700
    :cond_d8
    return v5
.end method

.method private updateAdbNotification(Z)V
    .registers 14

    .prologue
    const v3, 0x1040053

    const/4 v11, 0x1

    const/16 v10, 0x1a

    const/4 v4, 0x0

    const/4 v1, 0x0

    .line 1187
    iget-object v0, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->this$0:Lcom/android/server/usb/UsbDeviceManager;

    invoke-static {v0}, Lcom/android/server/usb/UsbDeviceManager;->-get12(Lcom/android/server/usb/UsbDeviceManager;)Landroid/app/NotificationManager;

    move-result-object v0

    if-nez v0, :cond_11

    return-void

    .line 1191
    :cond_11
    iget-object v0, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->this$0:Lcom/android/server/usb/UsbDeviceManager;

    invoke-static {v0}, Lcom/android/server/usb/UsbDeviceManager;->-get1(Lcom/android/server/usb/UsbDeviceManager;)Z

    move-result v0

    if-eqz v0, :cond_de

    iget-boolean v0, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mConnected:Z

    if-eqz v0, :cond_de

    .line 1192
    const-string/jumbo v0, "0"

    const-string/jumbo v2, "persist.adb.notify"

    invoke-static {v2}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2e

    return-void

    .line 1194
    :cond_2e
    if-eqz p1, :cond_41

    iget-boolean v0, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mAdbNotificationShown:Z

    if-eqz v0, :cond_41

    .line 1195
    iput-boolean v1, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mAdbNotificationShown:Z

    .line 1196
    iget-object v0, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->this$0:Lcom/android/server/usb/UsbDeviceManager;

    invoke-static {v0}, Lcom/android/server/usb/UsbDeviceManager;->-get12(Lcom/android/server/usb/UsbDeviceManager;)Landroid/app/NotificationManager;

    move-result-object v0

    sget-object v2, Landroid/os/UserHandle;->ALL:Landroid/os/UserHandle;

    invoke-virtual {v0, v4, v10, v2}, Landroid/app/NotificationManager;->cancelAsUser(Ljava/lang/String;ILandroid/os/UserHandle;)V

    .line 1199
    :cond_41
    iget-boolean v0, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mAdbNotificationShown:Z

    if-nez v0, :cond_dd

    .line 1200
    iget-object v0, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->this$0:Lcom/android/server/usb/UsbDeviceManager;

    invoke-static {v0}, Lcom/android/server/usb/UsbDeviceManager;->-get6(Lcom/android/server/usb/UsbDeviceManager;)Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 1201
    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v6

    .line 1203
    const v2, 0x1040052

    .line 1202
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v7

    .line 1205
    new-instance v2, Landroid/content/Intent;

    const-string/jumbo v0, "android.settings.APPLICATION_DEVELOPMENT_SETTINGS"

    invoke-direct {v2, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1206
    const v0, 0x10008000

    invoke-virtual {v2, v0}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 1208
    iget-object v0, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->this$0:Lcom/android/server/usb/UsbDeviceManager;

    invoke-static {v0}, Lcom/android/server/usb/UsbDeviceManager;->-get6(Lcom/android/server/usb/UsbDeviceManager;)Landroid/content/Context;

    move-result-object v0

    .line 1209
    sget-object v5, Landroid/os/UserHandle;->CURRENT:Landroid/os/UserHandle;

    move v3, v1

    .line 1208
    invoke-static/range {v0 .. v5}, Landroid/app/PendingIntent;->getActivityAsUser(Landroid/content/Context;ILandroid/content/Intent;ILandroid/os/Bundle;Landroid/os/UserHandle;)Landroid/app/PendingIntent;

    move-result-object v0

    .line 1212
    new-instance v2, Landroid/app/Notification$Builder;

    iget-object v3, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->this$0:Lcom/android/server/usb/UsbDeviceManager;

    invoke-static {v3}, Lcom/android/server/usb/UsbDeviceManager;->-get6(Lcom/android/server/usb/UsbDeviceManager;)Landroid/content/Context;

    move-result-object v3

    sget-object v5, Lcom/android/internal/notification/SystemNotificationChannels;->DEVELOPER:Ljava/lang/String;

    invoke-direct {v2, v3, v5}, Landroid/app/Notification$Builder;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 1213
    const v3, 0x1080785

    .line 1212
    invoke-virtual {v2, v3}, Landroid/app/Notification$Builder;->setSmallIcon(I)Landroid/app/Notification$Builder;

    move-result-object v2

    .line 1214
    const-wide/16 v8, 0x0

    .line 1212
    invoke-virtual {v2, v8, v9}, Landroid/app/Notification$Builder;->setWhen(J)Landroid/app/Notification$Builder;

    move-result-object v2

    invoke-virtual {v2, v11}, Landroid/app/Notification$Builder;->setOngoing(Z)Landroid/app/Notification$Builder;

    move-result-object v2

    invoke-virtual {v2, v6}, Landroid/app/Notification$Builder;->setTicker(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/app/Notification$Builder;->setDefaults(I)Landroid/app/Notification$Builder;

    move-result-object v1

    .line 1218
    iget-object v2, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->this$0:Lcom/android/server/usb/UsbDeviceManager;

    invoke-static {v2}, Lcom/android/server/usb/UsbDeviceManager;->-get6(Lcom/android/server/usb/UsbDeviceManager;)Landroid/content/Context;

    move-result-object v2

    .line 1219
    const v3, 0x106014b

    .line 1218
    invoke-virtual {v2, v3}, Landroid/content/Context;->getColor(I)I

    move-result v2

    .line 1212
    invoke-virtual {v1, v2}, Landroid/app/Notification$Builder;->setColor(I)Landroid/app/Notification$Builder;

    move-result-object v1

    invoke-virtual {v1, v6}, Landroid/app/Notification$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v1

    invoke-virtual {v1, v7}, Landroid/app/Notification$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/app/Notification$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    move-result-object v0

    invoke-virtual {v0, v11}, Landroid/app/Notification$Builder;->setVisibility(I)Landroid/app/Notification$Builder;

    move-result-object v0

    .line 1225
    new-instance v1, Landroid/app/Notification$TvExtender;

    invoke-direct {v1}, Landroid/app/Notification$TvExtender;-><init>()V

    .line 1226
    const-string/jumbo v2, "usbdevicemanager.adb.tv"

    .line 1225
    invoke-virtual {v1, v2}, Landroid/app/Notification$TvExtender;->setChannelId(Ljava/lang/String;)Landroid/app/Notification$TvExtender;

    move-result-object v1

    .line 1212
    invoke-virtual {v0, v1}, Landroid/app/Notification$Builder;->extend(Landroid/app/Notification$Extender;)Landroid/app/Notification$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Notification$Builder;->build()Landroid/app/Notification;

    move-result-object v0

    .line 1228
    iput-boolean v11, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mAdbNotificationShown:Z

    .line 1229
    iget-object v1, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->this$0:Lcom/android/server/usb/UsbDeviceManager;

    invoke-static {v1}, Lcom/android/server/usb/UsbDeviceManager;->-get12(Lcom/android/server/usb/UsbDeviceManager;)Landroid/app/NotificationManager;

    move-result-object v1

    .line 1230
    sget-object v2, Landroid/os/UserHandle;->ALL:Landroid/os/UserHandle;

    .line 1229
    invoke-virtual {v1, v4, v10, v0, v2}, Landroid/app/NotificationManager;->notifyAsUser(Ljava/lang/String;ILandroid/app/Notification;Landroid/os/UserHandle;)V

    .line 1236
    :cond_dd
    :goto_dd
    return-void

    .line 1232
    :cond_de
    iget-boolean v0, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mAdbNotificationShown:Z

    if-eqz v0, :cond_dd

    .line 1233
    iput-boolean v1, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mAdbNotificationShown:Z

    .line 1234
    iget-object v0, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->this$0:Lcom/android/server/usb/UsbDeviceManager;

    invoke-static {v0}, Lcom/android/server/usb/UsbDeviceManager;->-get12(Lcom/android/server/usb/UsbDeviceManager;)Landroid/app/NotificationManager;

    move-result-object v0

    sget-object v1, Landroid/os/UserHandle;->ALL:Landroid/os/UserHandle;

    invoke-virtual {v0, v4, v10, v1}, Landroid/app/NotificationManager;->cancelAsUser(Ljava/lang/String;ILandroid/os/UserHandle;)V

    goto :goto_dd
.end method

.method private updateAudioSourceFunction()V
    .registers 8

    .prologue
    const/4 v3, -0x1

    const/4 v2, 0x0

    .line 828
    iget-object v0, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mCurrentFunctions:Ljava/lang/String;

    .line 829
    const-string/jumbo v1, "audio_source"

    .line 828
    invoke-static {v0, v1}, Landroid/hardware/usb/UsbManager;->containsFunction(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v4

    .line 830
    iget-object v0, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->this$0:Lcom/android/server/usb/UsbDeviceManager;

    invoke-static {v0}, Lcom/android/server/usb/UsbDeviceManager;->-get2(Lcom/android/server/usb/UsbDeviceManager;)Z

    move-result v0

    if-eq v4, v0, :cond_3d

    .line 834
    if-eqz v4, :cond_5f

    .line 837
    :try_start_15
    new-instance v1, Ljava/util/Scanner;

    new-instance v0, Ljava/io/File;

    const-string/jumbo v5, "/sys/class/android_usb/android0/f_audio_source/pcm"

    invoke-direct {v0, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {v1, v0}, Ljava/util/Scanner;-><init>(Ljava/io/File;)V
    :try_end_22
    .catch Ljava/io/FileNotFoundException; {:try_start_15 .. :try_end_22} :catch_3e
    .catchall {:try_start_15 .. :try_end_22} :catchall_50

    .line 838
    :try_start_22
    invoke-virtual {v1}, Ljava/util/Scanner;->nextInt()I
    :try_end_25
    .catch Ljava/io/FileNotFoundException; {:try_start_22 .. :try_end_25} :catch_5a
    .catchall {:try_start_22 .. :try_end_25} :catchall_58

    move-result v2

    .line 839
    :try_start_26
    invoke-virtual {v1}, Ljava/util/Scanner;->nextInt()I
    :try_end_29
    .catch Ljava/io/FileNotFoundException; {:try_start_26 .. :try_end_29} :catch_5d
    .catchall {:try_start_26 .. :try_end_29} :catchall_58

    move-result v3

    .line 843
    if-eqz v1, :cond_2f

    .line 844
    invoke-virtual {v1}, Ljava/util/Scanner;->close()V

    .line 848
    :cond_2f
    :goto_2f
    iget-object v0, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->this$0:Lcom/android/server/usb/UsbDeviceManager;

    invoke-static {v0}, Lcom/android/server/usb/UsbDeviceManager;->-get16(Lcom/android/server/usb/UsbDeviceManager;)Lcom/android/server/usb/UsbAlsaManager;

    move-result-object v0

    invoke-virtual {v0, v4, v2, v3}, Lcom/android/server/usb/UsbAlsaManager;->setAccessoryAudioState(ZII)V

    .line 849
    iget-object v0, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->this$0:Lcom/android/server/usb/UsbDeviceManager;

    invoke-static {v0, v4}, Lcom/android/server/usb/UsbDeviceManager;->-set2(Lcom/android/server/usb/UsbDeviceManager;Z)Z

    .line 851
    :cond_3d
    return-void

    .line 840
    :catch_3e
    move-exception v0

    move-object v1, v2

    move v2, v3

    .line 841
    :goto_41
    :try_start_41
    const-string/jumbo v5, "UsbDeviceManager"

    const-string/jumbo v6, "could not open audio source PCM file"

    invoke-static {v5, v6, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_4a
    .catchall {:try_start_41 .. :try_end_4a} :catchall_58

    .line 843
    if-eqz v1, :cond_2f

    .line 844
    invoke-virtual {v1}, Ljava/util/Scanner;->close()V

    goto :goto_2f

    .line 842
    :catchall_50
    move-exception v0

    move-object v1, v2

    .line 843
    :goto_52
    if-eqz v1, :cond_57

    .line 844
    invoke-virtual {v1}, Ljava/util/Scanner;->close()V

    .line 842
    :cond_57
    throw v0

    :catchall_58
    move-exception v0

    goto :goto_52

    .line 840
    :catch_5a
    move-exception v0

    move v2, v3

    goto :goto_41

    :catch_5d
    move-exception v0

    goto :goto_41

    :cond_5f
    move v2, v3

    goto :goto_2f
.end method

.method private updateCurrentAccessory()V
    .registers 4

    .prologue
    .line 725
    const/16 v0, 0x8

    invoke-virtual {p0, v0}, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->hasMessages(I)Z

    move-result v0

    .line 727
    iget-boolean v1, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mConfigured:Z

    if-eqz v1, :cond_5b

    if-eqz v0, :cond_5b

    .line 729
    iget-object v0, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->this$0:Lcom/android/server/usb/UsbDeviceManager;

    invoke-static {v0}, Lcom/android/server/usb/UsbDeviceManager;->-get0(Lcom/android/server/usb/UsbDeviceManager;)[Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_51

    .line 730
    new-instance v0, Landroid/hardware/usb/UsbAccessory;

    iget-object v1, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->this$0:Lcom/android/server/usb/UsbDeviceManager;

    invoke-static {v1}, Lcom/android/server/usb/UsbDeviceManager;->-get0(Lcom/android/server/usb/UsbDeviceManager;)[Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/hardware/usb/UsbAccessory;-><init>([Ljava/lang/String;)V

    iput-object v0, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mCurrentAccessory:Landroid/hardware/usb/UsbAccessory;

    .line 731
    const-string/jumbo v0, "UsbDeviceManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "entering USB accessory mode: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mCurrentAccessory:Landroid/hardware/usb/UsbAccessory;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 733
    iget-object v0, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->this$0:Lcom/android/server/usb/UsbDeviceManager;

    invoke-static {v0}, Lcom/android/server/usb/UsbDeviceManager;->-get3(Lcom/android/server/usb/UsbDeviceManager;)Z

    move-result v0

    if-eqz v0, :cond_50

    .line 734
    iget-object v0, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->this$0:Lcom/android/server/usb/UsbDeviceManager;

    invoke-static {v0}, Lcom/android/server/usb/UsbDeviceManager;->-wrap0(Lcom/android/server/usb/UsbDeviceManager;)Lcom/android/server/usb/UsbProfileGroupSettingsManager;

    move-result-object v0

    iget-object v1, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mCurrentAccessory:Landroid/hardware/usb/UsbAccessory;

    invoke-virtual {v0, v1}, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->accessoryAttached(Landroid/hardware/usb/UsbAccessory;)V

    .line 746
    :cond_50
    :goto_50
    return-void

    .line 737
    :cond_51
    const-string/jumbo v0, "UsbDeviceManager"

    const-string/jumbo v1, "nativeGetAccessoryStrings failed"

    invoke-static {v0, v1}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_50

    .line 740
    :cond_5b
    if-nez v0, :cond_50

    .line 741
    invoke-direct {p0}, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->notifyAccessoryModeExit()V

    goto :goto_50
.end method

.method private updateMidiFunction()V
    .registers 7

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 854
    iget-object v0, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mCurrentFunctions:Ljava/lang/String;

    .line 855
    const-string/jumbo v1, "midi"

    .line 854
    invoke-static {v0, v1}, Landroid/hardware/usb/UsbManager;->containsFunction(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    .line 856
    iget-object v1, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->this$0:Lcom/android/server/usb/UsbDeviceManager;

    invoke-static {v1}, Lcom/android/server/usb/UsbDeviceManager;->-get11(Lcom/android/server/usb/UsbDeviceManager;)Z

    move-result v1

    if-eq v0, v1, :cond_3e

    .line 857
    if-eqz v0, :cond_39

    .line 860
    :try_start_15
    new-instance v1, Ljava/util/Scanner;

    new-instance v4, Ljava/io/File;

    const-string/jumbo v5, "/sys/class/android_usb/android0/f_midi/alsa"

    invoke-direct {v4, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {v1, v4}, Ljava/util/Scanner;-><init>(Ljava/io/File;)V
    :try_end_22
    .catch Ljava/io/FileNotFoundException; {:try_start_15 .. :try_end_22} :catch_5e
    .catchall {:try_start_15 .. :try_end_22} :catchall_70

    .line 861
    :try_start_22
    iget-object v2, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->this$0:Lcom/android/server/usb/UsbDeviceManager;

    invoke-virtual {v1}, Ljava/util/Scanner;->nextInt()I

    move-result v4

    invoke-static {v2, v4}, Lcom/android/server/usb/UsbDeviceManager;->-set5(Lcom/android/server/usb/UsbDeviceManager;I)I

    .line 862
    iget-object v2, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->this$0:Lcom/android/server/usb/UsbDeviceManager;

    invoke-virtual {v1}, Ljava/util/Scanner;->nextInt()I

    move-result v4

    invoke-static {v2, v4}, Lcom/android/server/usb/UsbDeviceManager;->-set6(Lcom/android/server/usb/UsbDeviceManager;I)I
    :try_end_34
    .catch Ljava/io/FileNotFoundException; {:try_start_22 .. :try_end_34} :catch_7a
    .catchall {:try_start_22 .. :try_end_34} :catchall_78

    .line 867
    if-eqz v1, :cond_39

    .line 868
    invoke-virtual {v1}, Ljava/util/Scanner;->close()V

    .line 872
    :cond_39
    :goto_39
    iget-object v1, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->this$0:Lcom/android/server/usb/UsbDeviceManager;

    invoke-static {v1, v0}, Lcom/android/server/usb/UsbDeviceManager;->-set7(Lcom/android/server/usb/UsbDeviceManager;Z)Z

    .line 874
    :cond_3e
    iget-object v0, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->this$0:Lcom/android/server/usb/UsbDeviceManager;

    invoke-static {v0}, Lcom/android/server/usb/UsbDeviceManager;->-get16(Lcom/android/server/usb/UsbDeviceManager;)Lcom/android/server/usb/UsbAlsaManager;

    move-result-object v0

    .line 875
    iget-object v1, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->this$0:Lcom/android/server/usb/UsbDeviceManager;

    invoke-static {v1}, Lcom/android/server/usb/UsbDeviceManager;->-get11(Lcom/android/server/usb/UsbDeviceManager;)Z

    move-result v1

    if-eqz v1, :cond_4e

    iget-boolean v3, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mConfigured:Z

    :cond_4e
    iget-object v1, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->this$0:Lcom/android/server/usb/UsbDeviceManager;

    invoke-static {v1}, Lcom/android/server/usb/UsbDeviceManager;->-get9(Lcom/android/server/usb/UsbDeviceManager;)I

    move-result v1

    iget-object v2, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->this$0:Lcom/android/server/usb/UsbDeviceManager;

    invoke-static {v2}, Lcom/android/server/usb/UsbDeviceManager;->-get10(Lcom/android/server/usb/UsbDeviceManager;)I

    move-result v2

    .line 874
    invoke-virtual {v0, v3, v1, v2}, Lcom/android/server/usb/UsbAlsaManager;->setPeripheralMidiState(ZII)V

    .line 876
    return-void

    .line 863
    :catch_5e
    move-exception v0

    move-object v1, v2

    .line 864
    :goto_60
    :try_start_60
    const-string/jumbo v2, "UsbDeviceManager"

    const-string/jumbo v4, "could not open MIDI file"

    invoke-static {v2, v4, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_69
    .catchall {:try_start_60 .. :try_end_69} :catchall_78

    .line 867
    if-eqz v1, :cond_6e

    .line 868
    invoke-virtual {v1}, Ljava/util/Scanner;->close()V

    :cond_6e
    move v0, v3

    goto :goto_39

    .line 866
    :catchall_70
    move-exception v0

    move-object v1, v2

    .line 867
    :goto_72
    if-eqz v1, :cond_77

    .line 868
    invoke-virtual {v1}, Ljava/util/Scanner;->close()V

    .line 866
    :cond_77
    throw v0

    :catchall_78
    move-exception v0

    goto :goto_72

    .line 863
    :catch_7a
    move-exception v0

    goto :goto_60
.end method

.method private updateUsbFunctions()V
    .registers 1

    .prologue
    .line 823
    invoke-direct {p0}, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->updateAudioSourceFunction()V

    .line 824
    invoke-direct {p0}, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->updateMidiFunction()V

    .line 825
    return-void
.end method

.method private updateUsbNotification(Z)V
    .registers 15

    .prologue
    const v0, 0x1040601

    const/16 v3, 0x20

    const/16 v2, 0x1f

    const/4 v4, 0x0

    const/4 v1, 0x0

    .line 1050
    iget-object v5, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->this$0:Lcom/android/server/usb/UsbDeviceManager;

    invoke-static {v5}, Lcom/android/server/usb/UsbDeviceManager;->-get12(Lcom/android/server/usb/UsbDeviceManager;)Landroid/app/NotificationManager;

    move-result-object v5

    if-eqz v5, :cond_2b

    iget-object v5, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->this$0:Lcom/android/server/usb/UsbDeviceManager;

    invoke-static {v5}, Lcom/android/server/usb/UsbDeviceManager;->-get17(Lcom/android/server/usb/UsbDeviceManager;)Z

    move-result v5

    xor-int/lit8 v5, v5, 0x1

    if-nez v5, :cond_2b

    .line 1051
    const-string/jumbo v5, "0"

    const-string/jumbo v6, "persist.charging.notify"

    invoke-static {v6}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    .line 1050
    if-eqz v5, :cond_2c

    .line 1052
    :cond_2b
    return-void

    .line 1057
    :cond_2c
    iget-boolean v5, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mHideUsbNotification:Z

    if-eqz v5, :cond_53

    iget-boolean v5, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mSupportsAllCombinations:Z

    xor-int/lit8 v5, v5, 0x1

    if-eqz v5, :cond_53

    .line 1058
    iget v0, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mUsbNotificationId:I

    if-eqz v0, :cond_52

    .line 1059
    iget-object v0, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->this$0:Lcom/android/server/usb/UsbDeviceManager;

    invoke-static {v0}, Lcom/android/server/usb/UsbDeviceManager;->-get12(Lcom/android/server/usb/UsbDeviceManager;)Landroid/app/NotificationManager;

    move-result-object v0

    iget v2, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mUsbNotificationId:I

    .line 1060
    sget-object v3, Landroid/os/UserHandle;->ALL:Landroid/os/UserHandle;

    .line 1059
    invoke-virtual {v0, v4, v2, v3}, Landroid/app/NotificationManager;->cancelAsUser(Ljava/lang/String;ILandroid/os/UserHandle;)V

    .line 1061
    iput v1, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mUsbNotificationId:I

    .line 1062
    const-string/jumbo v0, "UsbDeviceManager"

    const-string/jumbo v1, "Clear notification"

    invoke-static {v0, v1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1064
    :cond_52
    return-void

    .line 1069
    :cond_53
    iget-object v5, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->this$0:Lcom/android/server/usb/UsbDeviceManager;

    invoke-static {v5}, Lcom/android/server/usb/UsbDeviceManager;->-get6(Lcom/android/server/usb/UsbDeviceManager;)Landroid/content/Context;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    .line 1070
    iget-boolean v5, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mAudioAccessoryConnected:Z

    if-eqz v5, :cond_144

    iget-boolean v5, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mAudioAccessorySupported:Z

    xor-int/lit8 v5, v5, 0x1

    if-eqz v5, :cond_144

    .line 1071
    const v0, 0x104060d

    .line 1072
    const/16 v2, 0x29

    move v6, v0

    move v7, v2

    .line 1112
    :goto_6e
    iget v0, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mUsbNotificationId:I

    if-ne v7, v0, :cond_74

    if-eqz p1, :cond_143

    .line 1114
    :cond_74
    iget v0, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mUsbNotificationId:I

    if-eqz v0, :cond_90

    .line 1115
    iget-object v0, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->this$0:Lcom/android/server/usb/UsbDeviceManager;

    invoke-static {v0}, Lcom/android/server/usb/UsbDeviceManager;->-get12(Lcom/android/server/usb/UsbDeviceManager;)Landroid/app/NotificationManager;

    move-result-object v0

    iget v2, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mUsbNotificationId:I

    .line 1116
    sget-object v3, Landroid/os/UserHandle;->ALL:Landroid/os/UserHandle;

    .line 1115
    invoke-virtual {v0, v4, v2, v3}, Landroid/app/NotificationManager;->cancelAsUser(Ljava/lang/String;ILandroid/os/UserHandle;)V

    .line 1117
    const-string/jumbo v0, "UsbDeviceManager"

    const-string/jumbo v2, "Clear notification"

    invoke-static {v0, v2}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1118
    iput v1, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mUsbNotificationId:I

    .line 1120
    :cond_90
    if-eqz v7, :cond_143

    .line 1122
    invoke-virtual {v8, v6}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v9

    .line 1127
    const v0, 0x104060d

    .line 1126
    if-eq v6, v0, :cond_1d9

    .line 1130
    new-instance v0, Landroid/content/ComponentName;

    const-string/jumbo v2, "com.android.settings"

    .line 1131
    const-string/jumbo v3, "com.android.settings.deviceinfo.UsbModeChooserActivity"

    .line 1130
    invoke-direct {v0, v2, v3}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 1129
    invoke-static {v0}, Landroid/content/Intent;->makeRestartActivityTask(Landroid/content/ComponentName;)Landroid/content/Intent;

    move-result-object v2

    .line 1132
    iget-object v0, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->this$0:Lcom/android/server/usb/UsbDeviceManager;

    invoke-static {v0}, Lcom/android/server/usb/UsbDeviceManager;->-get6(Lcom/android/server/usb/UsbDeviceManager;)Landroid/content/Context;

    move-result-object v0

    .line 1133
    sget-object v5, Landroid/os/UserHandle;->CURRENT:Landroid/os/UserHandle;

    move v3, v1

    .line 1132
    invoke-static/range {v0 .. v5}, Landroid/app/PendingIntent;->getActivityAsUser(Landroid/content/Context;ILandroid/content/Intent;ILandroid/os/Bundle;Landroid/os/UserHandle;)Landroid/app/PendingIntent;

    move-result-object v3

    .line 1134
    sget-object v2, Lcom/android/internal/notification/SystemNotificationChannels;->USB:Ljava/lang/String;

    .line 1136
    const v0, 0x1040609

    .line 1135
    invoke-virtual {v8, v0}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v0

    .line 1156
    :goto_c0
    new-instance v5, Landroid/app/Notification$Builder;

    iget-object v8, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->this$0:Lcom/android/server/usb/UsbDeviceManager;

    invoke-static {v8}, Lcom/android/server/usb/UsbDeviceManager;->-get6(Lcom/android/server/usb/UsbDeviceManager;)Landroid/content/Context;

    move-result-object v8

    invoke-direct {v5, v8, v2}, Landroid/app/Notification$Builder;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 1157
    const v2, 0x1080785

    .line 1156
    invoke-virtual {v5, v2}, Landroid/app/Notification$Builder;->setSmallIcon(I)Landroid/app/Notification$Builder;

    move-result-object v2

    .line 1158
    const-wide/16 v10, 0x0

    .line 1156
    invoke-virtual {v2, v10, v11}, Landroid/app/Notification$Builder;->setWhen(J)Landroid/app/Notification$Builder;

    move-result-object v2

    .line 1159
    const/4 v5, 0x1

    .line 1156
    invoke-virtual {v2, v5}, Landroid/app/Notification$Builder;->setOngoing(Z)Landroid/app/Notification$Builder;

    move-result-object v2

    invoke-virtual {v2, v9}, Landroid/app/Notification$Builder;->setTicker(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/app/Notification$Builder;->setDefaults(I)Landroid/app/Notification$Builder;

    move-result-object v1

    .line 1162
    iget-object v2, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->this$0:Lcom/android/server/usb/UsbDeviceManager;

    invoke-static {v2}, Lcom/android/server/usb/UsbDeviceManager;->-get6(Lcom/android/server/usb/UsbDeviceManager;)Landroid/content/Context;

    move-result-object v2

    .line 1163
    const v5, 0x106014b

    .line 1162
    invoke-virtual {v2, v5}, Landroid/content/Context;->getColor(I)I

    move-result v2

    .line 1156
    invoke-virtual {v1, v2}, Landroid/app/Notification$Builder;->setColor(I)Landroid/app/Notification$Builder;

    move-result-object v1

    invoke-virtual {v1, v9}, Landroid/app/Notification$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/app/Notification$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v1

    invoke-virtual {v1, v3}, Landroid/app/Notification$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    move-result-object v1

    .line 1168
    const/4 v2, 0x1

    .line 1156
    invoke-virtual {v1, v2}, Landroid/app/Notification$Builder;->setVisibility(I)Landroid/app/Notification$Builder;

    move-result-object v1

    .line 1171
    const v2, 0x104060d

    .line 1170
    if-ne v6, v2, :cond_118

    .line 1173
    new-instance v2, Landroid/app/Notification$BigTextStyle;

    invoke-direct {v2}, Landroid/app/Notification$BigTextStyle;-><init>()V

    invoke-virtual {v2, v0}, Landroid/app/Notification$BigTextStyle;->bigText(Ljava/lang/CharSequence;)Landroid/app/Notification$BigTextStyle;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/app/Notification$Builder;->setStyle(Landroid/app/Notification$Style;)Landroid/app/Notification$Builder;

    .line 1176
    :cond_118
    invoke-virtual {v1}, Landroid/app/Notification$Builder;->build()Landroid/app/Notification;

    move-result-object v0

    .line 1178
    iget-object v1, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->this$0:Lcom/android/server/usb/UsbDeviceManager;

    invoke-static {v1}, Lcom/android/server/usb/UsbDeviceManager;->-get12(Lcom/android/server/usb/UsbDeviceManager;)Landroid/app/NotificationManager;

    move-result-object v1

    .line 1179
    sget-object v2, Landroid/os/UserHandle;->ALL:Landroid/os/UserHandle;

    .line 1178
    invoke-virtual {v1, v4, v7, v0, v2}, Landroid/app/NotificationManager;->notifyAsUser(Ljava/lang/String;ILandroid/app/Notification;Landroid/os/UserHandle;)V

    .line 1180
    const-string/jumbo v0, "UsbDeviceManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "push notification:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1181
    iput v7, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mUsbNotificationId:I

    .line 1184
    :cond_143
    return-void

    .line 1073
    :cond_144
    iget-boolean v5, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mConnected:Z

    if-eqz v5, :cond_1ba

    .line 1074
    iget-boolean v5, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mUsbDataUnlocked:Z

    if-nez v5, :cond_15b

    .line 1075
    iget-boolean v5, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mSourcePower:Z

    if-eqz v5, :cond_157

    .line 1076
    const v0, 0x104060b

    move v6, v0

    move v7, v2

    .line 1077
    goto/16 :goto_6e

    :cond_157
    move v6, v0

    move v7, v3

    .line 1080
    goto/16 :goto_6e

    .line 1082
    :cond_15b
    iget-object v5, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mCurrentFunctions:Ljava/lang/String;

    .line 1083
    const-string/jumbo v6, "mtp"

    .line 1082
    invoke-static {v5, v6}, Landroid/hardware/usb/UsbManager;->containsFunction(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_16f

    .line 1084
    const v0, 0x1040608

    .line 1085
    const/16 v2, 0x1b

    move v6, v0

    move v7, v2

    goto/16 :goto_6e

    .line 1086
    :cond_16f
    iget-object v5, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mCurrentFunctions:Ljava/lang/String;

    .line 1087
    const-string/jumbo v6, "ptp"

    .line 1086
    invoke-static {v5, v6}, Landroid/hardware/usb/UsbManager;->containsFunction(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_183

    .line 1088
    const v0, 0x104060a

    .line 1089
    const/16 v2, 0x1c

    move v6, v0

    move v7, v2

    goto/16 :goto_6e

    .line 1090
    :cond_183
    iget-object v5, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mCurrentFunctions:Ljava/lang/String;

    .line 1091
    const-string/jumbo v6, "midi"

    .line 1090
    invoke-static {v5, v6}, Landroid/hardware/usb/UsbManager;->containsFunction(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_197

    .line 1092
    const v0, 0x1040602

    .line 1093
    const/16 v2, 0x1d

    move v6, v0

    move v7, v2

    goto/16 :goto_6e

    .line 1094
    :cond_197
    iget-object v5, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mCurrentFunctions:Ljava/lang/String;

    .line 1095
    const-string/jumbo v6, "accessory"

    .line 1094
    invoke-static {v5, v6}, Landroid/hardware/usb/UsbManager;->containsFunction(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1ab

    .line 1096
    const v0, 0x1040600

    .line 1097
    const/16 v2, 0x1e

    move v6, v0

    move v7, v2

    goto/16 :goto_6e

    .line 1098
    :cond_1ab
    iget-boolean v5, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mSourcePower:Z

    if-eqz v5, :cond_1b6

    .line 1099
    const v0, 0x104060b

    move v6, v0

    move v7, v2

    .line 1100
    goto/16 :goto_6e

    :cond_1b6
    move v6, v0

    move v7, v3

    .line 1103
    goto/16 :goto_6e

    .line 1105
    :cond_1ba
    iget-boolean v5, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mSourcePower:Z

    if-eqz v5, :cond_1c5

    .line 1106
    const v0, 0x104060b

    move v6, v0

    move v7, v2

    .line 1107
    goto/16 :goto_6e

    .line 1108
    :cond_1c5
    iget-boolean v2, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mHostConnected:Z

    if-eqz v2, :cond_1d5

    iget-boolean v2, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mSinkPower:Z

    if-eqz v2, :cond_1d5

    iget-boolean v2, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mUsbCharging:Z

    if-eqz v2, :cond_21b

    move v6, v0

    move v7, v3

    .line 1110
    goto/16 :goto_6e

    :cond_1d5
    move v6, v1

    move v7, v1

    .line 1108
    goto/16 :goto_6e

    .line 1138
    :cond_1d9
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 1139
    const-string/jumbo v2, "com.android.settings"

    .line 1140
    const-string/jumbo v3, "com.android.settings.HelpTrampoline"

    .line 1139
    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1141
    const-string/jumbo v2, "android.intent.extra.TEXT"

    .line 1142
    const-string/jumbo v3, "help_url_audio_accessory_not_supported"

    .line 1141
    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1144
    iget-object v2, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->this$0:Lcom/android/server/usb/UsbDeviceManager;

    invoke-static {v2}, Lcom/android/server/usb/UsbDeviceManager;->-get6(Lcom/android/server/usb/UsbDeviceManager;)Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    invoke-virtual {v2, v0, v1}, Landroid/content/pm/PackageManager;->resolveActivity(Landroid/content/Intent;I)Landroid/content/pm/ResolveInfo;

    move-result-object v2

    if-eqz v2, :cond_219

    .line 1145
    iget-object v2, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->this$0:Lcom/android/server/usb/UsbDeviceManager;

    invoke-static {v2}, Lcom/android/server/usb/UsbDeviceManager;->-get6(Lcom/android/server/usb/UsbDeviceManager;)Landroid/content/Context;

    move-result-object v2

    invoke-static {v2, v1, v0, v1}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v0

    .line 1150
    :goto_20a
    sget-object v3, Lcom/android/internal/notification/SystemNotificationChannels;->ALERTS:Ljava/lang/String;

    .line 1152
    const v2, 0x104060c

    .line 1151
    invoke-virtual {v8, v2}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v2

    move-object v12, v2

    move-object v2, v3

    move-object v3, v0

    move-object v0, v12

    goto/16 :goto_c0

    :cond_219
    move-object v0, v4

    .line 1147
    goto :goto_20a

    :cond_21b
    move v6, v1

    move v7, v1

    goto/16 :goto_6e
.end method

.method private updateUsbStateBroadcastIfNeeded(Z)V
    .registers 7

    .prologue
    const/4 v1, 0x0

    .line 787
    new-instance v2, Landroid/content/Intent;

    const-string/jumbo v0, "android.hardware.usb.action.USB_STATE"

    invoke-direct {v2, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 788
    const/high16 v0, 0x31000000

    invoke-virtual {v2, v0}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 791
    const-string/jumbo v0, "connected"

    iget-boolean v3, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mConnected:Z

    invoke-virtual {v2, v0, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 792
    const-string/jumbo v0, "host_connected"

    iget-boolean v3, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mHostConnected:Z

    invoke-virtual {v2, v0, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 793
    const-string/jumbo v0, "configured"

    iget-boolean v3, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mConfigured:Z

    invoke-virtual {v2, v0, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 794
    const-string/jumbo v3, "unlocked"

    .line 795
    invoke-direct {p0}, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->isUsbTransferAllowed()Z

    move-result v0

    if-eqz v0, :cond_58

    iget-boolean v0, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mUsbDataUnlocked:Z

    .line 794
    :goto_31
    invoke-virtual {v2, v3, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 796
    const-string/jumbo v0, "config_changed"

    invoke-virtual {v2, v0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 798
    iget-object v0, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mCurrentFunctions:Ljava/lang/String;

    if-eqz v0, :cond_5f

    .line 799
    iget-object v0, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mCurrentFunctions:Ljava/lang/String;

    const-string/jumbo v3, ","

    invoke-virtual {v0, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 800
    :goto_47
    array-length v3, v0

    if-ge v1, v3, :cond_5f

    .line 801
    aget-object v3, v0, v1

    .line 802
    const-string/jumbo v4, "none"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_5a

    .line 800
    :goto_55
    add-int/lit8 v1, v1, 0x1

    goto :goto_47

    :cond_58
    move v0, v1

    .line 795
    goto :goto_31

    .line 805
    :cond_5a
    const/4 v4, 0x1

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    goto :goto_55

    .line 810
    :cond_5f
    invoke-direct {p0, v2}, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->isUsbStateChanged(Landroid/content/Intent;)Z

    move-result v0

    if-nez v0, :cond_6a

    xor-int/lit8 v0, p1, 0x1

    if-eqz v0, :cond_6a

    .line 814
    return-void

    .line 818
    :cond_6a
    iget-object v0, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->this$0:Lcom/android/server/usb/UsbDeviceManager;

    invoke-static {v0}, Lcom/android/server/usb/UsbDeviceManager;->-get6(Lcom/android/server/usb/UsbDeviceManager;)Landroid/content/Context;

    move-result-object v0

    sget-object v1, Landroid/os/UserHandle;->ALL:Landroid/os/UserHandle;

    invoke-virtual {v0, v2, v1}, Landroid/content/Context;->sendStickyBroadcastAsUser(Landroid/content/Intent;Landroid/os/UserHandle;)V

    .line 819
    iget-object v0, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->this$0:Lcom/android/server/usb/UsbDeviceManager;

    invoke-static {v0, v2}, Lcom/android/server/usb/UsbDeviceManager;->-set4(Lcom/android/server/usb/UsbDeviceManager;Landroid/content/Intent;)Landroid/content/Intent;

    .line 820
    return-void
.end method

.method private waitForState(Ljava/lang/String;)Z
    .registers 8

    .prologue
    const/4 v1, 0x0

    .line 550
    const/4 v0, 0x0

    move-object v2, v0

    move v0, v1

    .line 551
    :goto_4
    const/16 v3, 0x14

    if-ge v0, v3, :cond_1f

    .line 553
    const-string/jumbo v2, "sys.usb.state"

    invoke-static {v2}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 554
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_17

    const/4 v0, 0x1

    return v0

    .line 555
    :cond_17
    const-wide/16 v4, 0x32

    invoke-static {v4, v5}, Landroid/os/SystemClock;->sleep(J)V

    .line 551
    add-int/lit8 v0, v0, 0x1

    goto :goto_4

    .line 557
    :cond_1f
    const-string/jumbo v0, "UsbDeviceManager"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "waitForState("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, ") FAILED: got "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 558
    return v1
.end method


# virtual methods
.method public dump(Lcom/android/internal/util/IndentingPrintWriter;)V
    .registers 6

    .prologue
    .line 1251
    const-string/jumbo v0, "USB Device State:"

    invoke-virtual {p1, v0}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V

    .line 1252
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "  mCurrentFunctions: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mCurrentFunctions:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V

    .line 1253
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "  mCurrentOemFunctions: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mCurrentOemFunctions:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V

    .line 1254
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "  mCurrentFunctionsApplied: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mCurrentFunctionsApplied:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V

    .line 1255
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "  mConnected: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mConnected:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V

    .line 1256
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "  mConfigured: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mConfigured:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V

    .line 1257
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "  mUsbDataUnlocked: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mUsbDataUnlocked:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V

    .line 1258
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "  mCurrentAccessory: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mCurrentAccessory:Landroid/hardware/usb/UsbAccessory;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V

    .line 1259
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "  mHostConnected: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mHostConnected:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V

    .line 1260
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "  mSourcePower: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mSourcePower:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V

    .line 1261
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "  mSinkPower: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mSinkPower:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V

    .line 1262
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "  mUsbCharging: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mUsbCharging:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V

    .line 1263
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "  mHideUsbNotification: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mHideUsbNotification:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V

    .line 1264
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "  mAudioAccessoryConnected: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mAudioAccessoryConnected:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V

    .line 1267
    :try_start_14b
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "  Kernel state: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 1268
    new-instance v1, Ljava/io/File;

    const-string/jumbo v2, "/sys/class/android_usb/android0/state"

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-static {v1, v2, v3}, Landroid/os/FileUtils;->readTextFile(Ljava/io/File;ILjava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 1267
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V

    .line 1269
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "  Kernel function list: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 1270
    new-instance v1, Ljava/io/File;

    const-string/jumbo v2, "/sys/class/android_usb/android0/functions"

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-static {v1, v2, v3}, Landroid/os/FileUtils;->readTextFile(Ljava/io/File;ILjava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 1269
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V
    :try_end_19d
    .catch Ljava/io/IOException; {:try_start_14b .. :try_end_19d} :catch_19e

    .line 1274
    :goto_19d
    return-void

    .line 1271
    :catch_19e
    move-exception v0

    .line 1272
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "IOException: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V

    goto :goto_19d
.end method

.method public getCurrentAccessory()Landroid/hardware/usb/UsbAccessory;
    .registers 2

    .prologue
    .line 1046
    iget-object v0, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mCurrentAccessory:Landroid/hardware/usb/UsbAccessory;

    return-object v0
.end method

.method public handleMessage(Landroid/os/Message;)V
    .registers 11

    .prologue
    const/4 v8, 0x4

    const/4 v7, 0x2

    const/4 v5, 0x0

    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 880
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_21a

    .line 1038
    :cond_a
    :goto_a
    return-void

    .line 882
    :pswitch_b  #0x0
    iget v0, p1, Landroid/os/Message;->arg1:I

    if-ne v0, v3, :cond_53

    move v0, v3

    :goto_10
    iput-boolean v0, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mConnected:Z

    .line 883
    iget v0, p1, Landroid/os/Message;->arg2:I

    if-ne v0, v3, :cond_55

    move v0, v3

    :goto_17
    iput-boolean v0, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mConfigured:Z

    .line 885
    invoke-direct {p0, v4}, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->updateUsbNotification(Z)V

    .line 886
    invoke-direct {p0, v4}, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->updateAdbNotification(Z)V

    .line 887
    iget-object v0, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->this$0:Lcom/android/server/usb/UsbDeviceManager;

    invoke-static {v0}, Lcom/android/server/usb/UsbDeviceManager;->-get3(Lcom/android/server/usb/UsbDeviceManager;)Z

    move-result v0

    if-eqz v0, :cond_2a

    .line 888
    invoke-direct {p0, v4}, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->updateUsbStateBroadcastIfNeeded(Z)V

    .line 890
    :cond_2a
    iget-object v0, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mCurrentFunctions:Ljava/lang/String;

    .line 891
    const-string/jumbo v1, "accessory"

    .line 890
    invoke-static {v0, v1}, Landroid/hardware/usb/UsbManager;->containsFunction(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_38

    .line 892
    invoke-direct {p0}, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->updateCurrentAccessory()V

    .line 894
    :cond_38
    iget-object v0, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->this$0:Lcom/android/server/usb/UsbDeviceManager;

    invoke-static {v0}, Lcom/android/server/usb/UsbDeviceManager;->-get3(Lcom/android/server/usb/UsbDeviceManager;)Z

    move-result v0

    if-eqz v0, :cond_57

    .line 895
    iget-boolean v0, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mConnected:Z

    if-nez v0, :cond_4f

    .line 897
    iget-object v0, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->this$0:Lcom/android/server/usb/UsbDeviceManager;

    invoke-static {v0}, Lcom/android/server/usb/UsbDeviceManager;->-get1(Lcom/android/server/usb/UsbDeviceManager;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    invoke-direct {p0, v5, v0, v4}, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->setEnabledFunctions(Ljava/lang/String;ZZ)V

    .line 899
    :cond_4f
    invoke-direct {p0}, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->updateUsbFunctions()V

    goto :goto_a

    :cond_53
    move v0, v4

    .line 882
    goto :goto_10

    :cond_55
    move v0, v4

    .line 883
    goto :goto_17

    .line 901
    :cond_57
    iget-object v0, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->this$0:Lcom/android/server/usb/UsbDeviceManager;

    invoke-static {v0, v3}, Lcom/android/server/usb/UsbDeviceManager;->-set8(Lcom/android/server/usb/UsbDeviceManager;Z)Z

    goto :goto_a

    .line 905
    :pswitch_5d  #0x7
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lcom/android/internal/os/SomeArgs;

    .line 906
    iget-boolean v6, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mHostConnected:Z

    .line 907
    iget-object v1, v0, Lcom/android/internal/os/SomeArgs;->arg1:Ljava/lang/Object;

    check-cast v1, Landroid/hardware/usb/UsbPort;

    .line 908
    iget-object v2, v0, Lcom/android/internal/os/SomeArgs;->arg2:Ljava/lang/Object;

    check-cast v2, Landroid/hardware/usb/UsbPortStatus;

    .line 909
    invoke-virtual {v2}, Landroid/hardware/usb/UsbPortStatus;->getCurrentDataRole()I

    move-result v5

    if-ne v5, v3, :cond_c6

    move v5, v3

    :goto_72
    iput-boolean v5, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mHostConnected:Z

    .line 910
    invoke-virtual {v2}, Landroid/hardware/usb/UsbPortStatus;->getCurrentPowerRole()I

    move-result v5

    if-ne v5, v3, :cond_c8

    move v5, v3

    :goto_7b
    iput-boolean v5, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mSourcePower:Z

    .line 911
    invoke-virtual {v2}, Landroid/hardware/usb/UsbPortStatus;->getCurrentPowerRole()I

    move-result v5

    if-ne v5, v7, :cond_ca

    move v5, v3

    :goto_84
    iput-boolean v5, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mSinkPower:Z

    .line 913
    invoke-virtual {v2}, Landroid/hardware/usb/UsbPortStatus;->getCurrentMode()I

    move-result v5

    if-ne v5, v8, :cond_cc

    move v5, v3

    .line 912
    :goto_8d
    iput-boolean v5, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mAudioAccessoryConnected:Z

    .line 914
    invoke-virtual {v1, v8}, Landroid/hardware/usb/UsbPort;->isModeSupported(I)Z

    move-result v1

    iput-boolean v1, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mAudioAccessorySupported:Z

    .line 918
    invoke-virtual {v2, v3, v3}, Landroid/hardware/usb/UsbPortStatus;->isRoleCombinationSupported(II)Z

    move-result v1

    if-eqz v1, :cond_ce

    .line 920
    invoke-virtual {v2, v7, v3}, Landroid/hardware/usb/UsbPortStatus;->isRoleCombinationSupported(II)Z

    move-result v1

    .line 918
    if-eqz v1, :cond_ce

    .line 922
    invoke-virtual {v2, v3, v7}, Landroid/hardware/usb/UsbPortStatus;->isRoleCombinationSupported(II)Z

    move-result v1

    .line 918
    if-eqz v1, :cond_ce

    .line 924
    invoke-virtual {v2, v7, v3}, Landroid/hardware/usb/UsbPortStatus;->isRoleCombinationSupported(II)Z

    move-result v1

    .line 918
    :goto_ab
    iput-boolean v1, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mSupportsAllCombinations:Z

    .line 927
    invoke-virtual {v0}, Lcom/android/internal/os/SomeArgs;->recycle()V

    .line 928
    invoke-direct {p0, v4}, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->updateUsbNotification(Z)V

    .line 929
    iget-object v0, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->this$0:Lcom/android/server/usb/UsbDeviceManager;

    invoke-static {v0}, Lcom/android/server/usb/UsbDeviceManager;->-get3(Lcom/android/server/usb/UsbDeviceManager;)Z

    move-result v0

    if-eqz v0, :cond_d0

    .line 930
    iget-boolean v0, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mHostConnected:Z

    if-nez v0, :cond_c1

    if-eqz v6, :cond_a

    .line 931
    :cond_c1
    invoke-direct {p0, v4}, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->updateUsbStateBroadcastIfNeeded(Z)V

    goto/16 :goto_a

    :cond_c6
    move v5, v4

    .line 909
    goto :goto_72

    :cond_c8
    move v5, v4

    .line 910
    goto :goto_7b

    :cond_ca
    move v5, v4

    .line 911
    goto :goto_84

    :cond_cc
    move v5, v4

    .line 913
    goto :goto_8d

    :cond_ce
    move v1, v4

    .line 918
    goto :goto_ab

    .line 934
    :cond_d0
    iget-object v0, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->this$0:Lcom/android/server/usb/UsbDeviceManager;

    invoke-static {v0, v3}, Lcom/android/server/usb/UsbDeviceManager;->-set8(Lcom/android/server/usb/UsbDeviceManager;Z)Z

    goto/16 :goto_a

    .line 938
    :pswitch_d7  #0x9
    iget v0, p1, Landroid/os/Message;->arg1:I

    if-ne v0, v3, :cond_e2

    :goto_db
    iput-boolean v3, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mUsbCharging:Z

    .line 939
    invoke-direct {p0, v4}, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->updateUsbNotification(Z)V

    goto/16 :goto_a

    :cond_e2
    move v3, v4

    .line 938
    goto :goto_db

    .line 942
    :pswitch_e4  #0xa
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Ljava/util/Iterator;

    .line 943
    iget v1, p1, Landroid/os/Message;->arg1:I

    .line 949
    iput-boolean v4, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mHideUsbNotification:Z

    .line 950
    :cond_ec
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_130

    .line 951
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 955
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/hardware/usb/UsbDevice;

    .line 956
    invoke-virtual {v1}, Landroid/hardware/usb/UsbDevice;->getConfigurationCount()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    .line 957
    :goto_104
    if-ltz v2, :cond_ec

    .line 958
    invoke-virtual {v1, v2}, Landroid/hardware/usb/UsbDevice;->getConfiguration(I)Landroid/hardware/usb/UsbConfiguration;

    move-result-object v6

    .line 959
    add-int/lit8 v5, v2, -0x1

    .line 960
    invoke-virtual {v6}, Landroid/hardware/usb/UsbConfiguration;->getInterfaceCount()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    .line 961
    :cond_112
    if-ltz v2, :cond_12e

    .line 962
    invoke-virtual {v6, v2}, Landroid/hardware/usb/UsbConfiguration;->getInterface(I)Landroid/hardware/usb/UsbInterface;

    move-result-object v7

    .line 963
    add-int/lit8 v2, v2, -0x1

    .line 964
    invoke-static {}, Lcom/android/server/usb/UsbDeviceManager;->-get18()Ljava/util/Set;

    move-result-object v8

    invoke-virtual {v7}, Landroid/hardware/usb/UsbInterface;->getInterfaceClass()I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-interface {v8, v7}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_112

    .line 965
    iput-boolean v3, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mHideUsbNotification:Z

    :cond_12e
    move v2, v5

    goto :goto_104

    .line 971
    :cond_130
    invoke-direct {p0, v4}, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->updateUsbNotification(Z)V

    goto/16 :goto_a

    .line 974
    :pswitch_135  #0x1
    iget v0, p1, Landroid/os/Message;->arg1:I

    if-ne v0, v3, :cond_13e

    :goto_139
    invoke-direct {p0, v3}, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->setAdbEnabled(Z)V

    goto/16 :goto_a

    :cond_13e
    move v3, v4

    goto :goto_139

    .line 977
    :pswitch_140  #0x2
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    .line 978
    iget v1, p1, Landroid/os/Message;->arg1:I

    if-ne v1, v3, :cond_14d

    :goto_148
    invoke-direct {p0, v0, v4, v3}, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->setEnabledFunctions(Ljava/lang/String;ZZ)V

    goto/16 :goto_a

    :cond_14d
    move v3, v4

    goto :goto_148

    .line 982
    :pswitch_14f  #0x6
    iget-boolean v0, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mUsbDataUnlocked:Z

    if-eqz v0, :cond_16c

    .line 983
    invoke-direct {p0}, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->isUsbDataTransferActive()Z

    move-result v0

    .line 982
    if-eqz v0, :cond_16c

    .line 984
    invoke-direct {p0}, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->isUsbTransferAllowed()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    .line 986
    :goto_15f
    iget-object v1, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mCurrentFunctions:Ljava/lang/String;

    iget-boolean v2, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mUsbDataUnlocked:Z

    if-eqz v2, :cond_167

    xor-int/lit8 v4, v0, 0x1

    .line 985
    :cond_167
    invoke-direct {p0, v1, v0, v4}, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->setEnabledFunctions(Ljava/lang/String;ZZ)V

    goto/16 :goto_a

    :cond_16c
    move v0, v4

    .line 982
    goto :goto_15f

    .line 989
    :pswitch_16e  #0x3
    invoke-direct {p0, v4}, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->updateUsbNotification(Z)V

    .line 990
    invoke-direct {p0, v4}, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->updateAdbNotification(Z)V

    .line 991
    invoke-direct {p0}, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->updateUsbFunctions()V

    goto/16 :goto_a

    .line 994
    :pswitch_179  #0xb
    invoke-direct {p0, v3}, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->updateAdbNotification(Z)V

    .line 995
    invoke-direct {p0, v3}, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->updateUsbNotification(Z)V

    goto/16 :goto_a

    .line 998
    :pswitch_181  #0x4
    iget-object v0, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->this$0:Lcom/android/server/usb/UsbDeviceManager;

    invoke-static {v0, v3}, Lcom/android/server/usb/UsbDeviceManager;->-set3(Lcom/android/server/usb/UsbDeviceManager;Z)Z

    .line 999
    iget-object v0, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->this$0:Lcom/android/server/usb/UsbDeviceManager;

    invoke-static {v0}, Lcom/android/server/usb/UsbDeviceManager;->-get13(Lcom/android/server/usb/UsbDeviceManager;)Z

    move-result v0

    if-eqz v0, :cond_196

    .line 1000
    invoke-direct {p0, v4}, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->updateUsbStateBroadcastIfNeeded(Z)V

    .line 1001
    iget-object v0, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->this$0:Lcom/android/server/usb/UsbDeviceManager;

    invoke-static {v0, v4}, Lcom/android/server/usb/UsbDeviceManager;->-set8(Lcom/android/server/usb/UsbDeviceManager;Z)Z

    .line 1003
    :cond_196
    invoke-direct {p0, v5, v4, v4}, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->setEnabledFunctions(Ljava/lang/String;ZZ)V

    .line 1004
    iget-object v0, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mCurrentAccessory:Landroid/hardware/usb/UsbAccessory;

    if-eqz v0, :cond_1a8

    .line 1005
    iget-object v0, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->this$0:Lcom/android/server/usb/UsbDeviceManager;

    invoke-static {v0}, Lcom/android/server/usb/UsbDeviceManager;->-wrap0(Lcom/android/server/usb/UsbDeviceManager;)Lcom/android/server/usb/UsbProfileGroupSettingsManager;

    move-result-object v0

    iget-object v1, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mCurrentAccessory:Landroid/hardware/usb/UsbAccessory;

    invoke-virtual {v0, v1}, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->accessoryAttached(Landroid/hardware/usb/UsbAccessory;)V

    .line 1007
    :cond_1a8
    iget-object v0, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->this$0:Lcom/android/server/usb/UsbDeviceManager;

    invoke-static {v0}, Lcom/android/server/usb/UsbDeviceManager;->-get7(Lcom/android/server/usb/UsbDeviceManager;)Lcom/android/server/usb/UsbDebuggingManager;

    move-result-object v0

    if-eqz v0, :cond_a

    .line 1008
    iget-object v0, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->this$0:Lcom/android/server/usb/UsbDeviceManager;

    invoke-static {v0}, Lcom/android/server/usb/UsbDeviceManager;->-get7(Lcom/android/server/usb/UsbDeviceManager;)Lcom/android/server/usb/UsbDebuggingManager;

    move-result-object v0

    iget-object v1, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->this$0:Lcom/android/server/usb/UsbDeviceManager;

    invoke-static {v1}, Lcom/android/server/usb/UsbDeviceManager;->-get1(Lcom/android/server/usb/UsbDeviceManager;)Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/android/server/usb/UsbDebuggingManager;->setAdbEnabled(Z)V

    goto/16 :goto_a

    .line 1012
    :pswitch_1c1  #0x5
    iget v0, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mCurrentUser:I

    iget v1, p1, Landroid/os/Message;->arg1:I

    if-eq v0, v1, :cond_a

    .line 1014
    iget-boolean v0, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mUsbDataUnlocked:Z

    if-eqz v0, :cond_1fd

    .line 1015
    invoke-direct {p0}, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->isUsbDataTransferActive()Z

    move-result v0

    .line 1014
    if-eqz v0, :cond_1fd

    .line 1016
    iget v0, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mCurrentUser:I

    const/16 v1, -0x2710

    if-eq v0, v1, :cond_1fd

    .line 1017
    const-string/jumbo v0, "UsbDeviceManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Current user switched to "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p1, Landroid/os/Message;->arg1:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 1018
    const-string/jumbo v2, "; resetting USB host stack for MTP or PTP"

    .line 1017
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Slog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1020
    invoke-direct {p0, v5, v3, v4}, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->setEnabledFunctions(Ljava/lang/String;ZZ)V

    .line 1022
    :cond_1fd
    iget v0, p1, Landroid/os/Message;->arg1:I

    iput v0, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mCurrentUser:I

    goto/16 :goto_a

    .line 1030
    :pswitch_203  #0x8
    iget-boolean v0, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mConnected:Z

    if-eqz v0, :cond_214

    .line 1031
    iget-object v0, p0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->mCurrentFunctions:Ljava/lang/String;

    .line 1032
    const-string/jumbo v1, "accessory"

    .line 1030
    invoke-static {v0, v1}, Landroid/hardware/usb/UsbManager;->containsFunction(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_a

    .line 1033
    :cond_214
    invoke-direct {p0}, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->notifyAccessoryModeExit()V

    goto/16 :goto_a

    .line 880
    nop

    :pswitch_data_21a
    .packed-switch 0x0
        :pswitch_b  #00000000
        :pswitch_135  #00000001
        :pswitch_140  #00000002
        :pswitch_16e  #00000003
        :pswitch_181  #00000004
        :pswitch_1c1  #00000005
        :pswitch_14f  #00000006
        :pswitch_5d  #00000007
        :pswitch_203  #00000008
        :pswitch_d7  #00000009
        :pswitch_e4  #0000000a
        :pswitch_179  #0000000b
    .end packed-switch
.end method

.method public sendMessage(ILjava/lang/Object;)V
    .registers 4

    .prologue
    .line 494
    invoke-virtual {p0, p1}, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->removeMessages(I)V

    .line 495
    invoke-static {p0, p1}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object v0

    .line 496
    iput-object p2, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 497
    invoke-virtual {p0, v0}, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->sendMessage(Landroid/os/Message;)Z

    .line 498
    return-void
.end method

.method public sendMessage(ILjava/lang/Object;Z)V
    .registers 6

    .prologue
    .line 501
    invoke-virtual {p0, p1}, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->removeMessages(I)V

    .line 502
    invoke-static {p0, p1}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object v1

    .line 503
    iput-object p2, v1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 504
    if-eqz p3, :cond_12

    const/4 v0, 0x1

    :goto_c
    iput v0, v1, Landroid/os/Message;->arg1:I

    .line 505
    invoke-virtual {p0, v1}, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->sendMessage(Landroid/os/Message;)Z

    .line 506
    return-void

    .line 504
    :cond_12
    const/4 v0, 0x0

    goto :goto_c
.end method

.method public sendMessage(IZ)V
    .registers 5

    .prologue
    .line 487
    invoke-virtual {p0, p1}, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->removeMessages(I)V

    .line 488
    invoke-static {p0, p1}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object v1

    .line 489
    if-eqz p2, :cond_10

    const/4 v0, 0x1

    :goto_a
    iput v0, v1, Landroid/os/Message;->arg1:I

    .line 490
    invoke-virtual {p0, v1}, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->sendMessage(Landroid/os/Message;)Z

    .line 491
    return-void

    .line 489
    :cond_10
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public updateHostState(Landroid/hardware/usb/UsbPort;Landroid/hardware/usb/UsbPortStatus;)V
    .registers 7

    .prologue
    const/4 v1, 0x7

    .line 537
    invoke-static {}, Lcom/android/internal/os/SomeArgs;->obtain()Lcom/android/internal/os/SomeArgs;

    move-result-object v0

    .line 538
    iput-object p1, v0, Lcom/android/internal/os/SomeArgs;->arg1:Ljava/lang/Object;

    .line 539
    iput-object p2, v0, Lcom/android/internal/os/SomeArgs;->arg2:Ljava/lang/Object;

    .line 541
    invoke-virtual {p0, v1}, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->removeMessages(I)V

    .line 542
    invoke-virtual {p0, v1, v0}, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    .line 544
    const-wide/16 v2, 0x3e8

    invoke-virtual {p0, v0, v2, v3}, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 545
    return-void
.end method

.method public updateState(Ljava/lang/String;)V
    .registers 6

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 511
    const-string/jumbo v2, "DISCONNECTED"

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_21

    move v0, v1

    move v2, v1

    .line 524
    :goto_d
    invoke-virtual {p0, v1}, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->removeMessages(I)V

    .line 525
    invoke-static {p0, v1}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object v3

    .line 526
    iput v2, v3, Landroid/os/Message;->arg1:I

    .line 527
    iput v0, v3, Landroid/os/Message;->arg2:I

    .line 529
    if-nez v2, :cond_1c

    const/16 v1, 0x3e8

    :cond_1c
    int-to-long v0, v1

    invoke-virtual {p0, v3, v0, v1}, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 530
    return-void

    .line 514
    :cond_21
    const-string/jumbo v2, "CONNECTED"

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2d

    move v2, v0

    move v0, v1

    .line 516
    goto :goto_d

    .line 517
    :cond_2d
    const-string/jumbo v2, "CONFIGURED"

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_38

    move v2, v0

    .line 519
    goto :goto_d

    .line 521
    :cond_38
    const-string/jumbo v0, "UsbDeviceManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "unknown state "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 522
    return-void
.end method
