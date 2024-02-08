.class Lcom/android/server/usb/UsbProfileGroupSettingsManager;
.super Ljava/lang/Object;
.source "UsbProfileGroupSettingsManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/server/usb/UsbProfileGroupSettingsManager$AccessoryFilter;,
        Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;,
        Lcom/android/server/usb/UsbProfileGroupSettingsManager$MyPackageMonitor;,
        Lcom/android/server/usb/UsbProfileGroupSettingsManager$UserPackage;
    }
.end annotation


# static fields
.field private static final DEBUG:Z

.field private static final TAG:Ljava/lang/String;

.field private static final sSingleUserSettingsFile:Ljava/io/File;


# instance fields
.field private final mAccessoryPreferenceMap:Ljava/util/HashMap;
    .annotation build Lcom/android/internal/annotations/GuardedBy;
        value = "mLock"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Lcom/android/server/usb/UsbProfileGroupSettingsManager$AccessoryFilter;",
            "Lcom/android/server/usb/UsbProfileGroupSettingsManager$UserPackage;",
            ">;"
        }
    .end annotation
.end field

.field private final mContext:Landroid/content/Context;

.field private final mDevicePreferenceMap:Ljava/util/HashMap;
    .annotation build Lcom/android/internal/annotations/GuardedBy;
        value = "mLock"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;",
            "Lcom/android/server/usb/UsbProfileGroupSettingsManager$UserPackage;",
            ">;"
        }
    .end annotation
.end field

.field private final mDisablePermissionDialogs:Z

.field private mIsWriteSettingsScheduled:Z
    .annotation build Lcom/android/internal/annotations/GuardedBy;
        value = "mLock"
    .end annotation
.end field

.field private final mLock:Ljava/lang/Object;

.field private final mMtpNotificationManager:Lcom/android/server/usb/MtpNotificationManager;

.field private final mPackageManager:Landroid/content/pm/PackageManager;

.field mPackageMonitor:Lcom/android/server/usb/UsbProfileGroupSettingsManager$MyPackageMonitor;

.field private final mParentUser:Landroid/os/UserHandle;

.field private final mSettingsFile:Landroid/util/AtomicFile;

.field private final mSettingsManager:Lcom/android/server/usb/UsbSettingsManager;

.field private final mUserManager:Landroid/os/UserManager;


# direct methods
.method static synthetic -get0()Ljava/lang/String;
    .registers 1

    sget-object v0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic -get1(Lcom/android/server/usb/UsbProfileGroupSettingsManager;)Landroid/os/UserHandle;
    .registers 2

    iget-object v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->mParentUser:Landroid/os/UserHandle;

    return-object v0
.end method

.method static synthetic -get2(Lcom/android/server/usb/UsbProfileGroupSettingsManager;)Landroid/os/UserManager;
    .registers 2

    iget-object v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->mUserManager:Landroid/os/UserManager;

    return-object v0
.end method

.method static synthetic -wrap0(Lcom/android/server/usb/UsbProfileGroupSettingsManager;Lcom/android/server/usb/UsbProfileGroupSettingsManager$UserPackage;)V
    .registers 2

    invoke-direct {p0, p1}, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->handlePackageAdded(Lcom/android/server/usb/UsbProfileGroupSettingsManager$UserPackage;)V

    return-void
.end method

.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 77
    const-class v0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->TAG:Ljava/lang/String;

    .line 81
    new-instance v0, Ljava/io/File;

    .line 82
    const-string/jumbo v1, "/data/system/usb_device_manager.xml"

    .line 81
    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->sSingleUserSettingsFile:Ljava/io/File;

    .line 76
    return-void
.end method

.method constructor <init>(Landroid/content/Context;Landroid/os/UserHandle;Lcom/android/server/usb/UsbSettingsManager;)V
    .registers 10

    .prologue
    const/4 v5, 0x0

    .line 591
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 99
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->mDevicePreferenceMap:Ljava/util/HashMap;

    .line 103
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->mAccessoryPreferenceMap:Ljava/util/HashMap;

    .line 105
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->mLock:Ljava/lang/Object;

    .line 580
    new-instance v0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$MyPackageMonitor;

    invoke-direct {v0, p0, v5}, Lcom/android/server/usb/UsbProfileGroupSettingsManager$MyPackageMonitor;-><init>(Lcom/android/server/usb/UsbProfileGroupSettingsManager;Lcom/android/server/usb/UsbProfileGroupSettingsManager$MyPackageMonitor;)V

    iput-object v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->mPackageMonitor:Lcom/android/server/usb/UsbProfileGroupSettingsManager$MyPackageMonitor;

    .line 597
    :try_start_20
    const-string/jumbo v0, "android"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1, p2}, Landroid/content/Context;->createPackageContextAsUser(Ljava/lang/String;ILandroid/os/UserHandle;)Landroid/content/Context;
    :try_end_27
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_20 .. :try_end_27} :catch_8a

    move-result-object v1

    .line 602
    iput-object p1, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->mContext:Landroid/content/Context;

    .line 603
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    iput-object v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->mPackageManager:Landroid/content/pm/PackageManager;

    .line 604
    iput-object p3, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->mSettingsManager:Lcom/android/server/usb/UsbSettingsManager;

    .line 605
    const-string/jumbo v0, "user"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/UserManager;

    iput-object v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->mUserManager:Landroid/os/UserManager;

    .line 607
    iput-object p2, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->mParentUser:Landroid/os/UserHandle;

    .line 608
    new-instance v0, Landroid/util/AtomicFile;

    new-instance v2, Ljava/io/File;

    .line 609
    invoke-virtual {p2}, Landroid/os/UserHandle;->getIdentifier()I

    move-result v3

    invoke-static {v3}, Landroid/os/Environment;->getUserSystemDirectory(I)Ljava/io/File;

    move-result-object v3

    .line 610
    const-string/jumbo v4, "usb_device_manager.xml"

    .line 608
    invoke-direct {v2, v3, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-direct {v0, v2}, Landroid/util/AtomicFile;-><init>(Ljava/io/File;)V

    iput-object v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->mSettingsFile:Landroid/util/AtomicFile;

    .line 612
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 613
    const v2, 0x112003f

    .line 612
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->mDisablePermissionDialogs:Z

    .line 615
    iget-object v2, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->mLock:Ljava/lang/Object;

    monitor-enter v2

    .line 616
    :try_start_66
    sget-object v0, Landroid/os/UserHandle;->SYSTEM:Landroid/os/UserHandle;

    invoke-virtual {v0, p2}, Landroid/os/UserHandle;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_71

    .line 617
    invoke-direct {p0}, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->upgradeSingleUserLocked()V

    .line 619
    :cond_71
    invoke-direct {p0}, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->readSettingsLocked()V
    :try_end_74
    .catchall {:try_start_66 .. :try_end_74} :catchall_94

    monitor-exit v2

    .line 622
    iget-object v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->mPackageMonitor:Lcom/android/server/usb/UsbProfileGroupSettingsManager$MyPackageMonitor;

    sget-object v2, Landroid/os/UserHandle;->ALL:Landroid/os/UserHandle;

    const/4 v3, 0x1

    invoke-virtual {v0, p1, v5, v2, v3}, Lcom/android/server/usb/UsbProfileGroupSettingsManager$MyPackageMonitor;->register(Landroid/content/Context;Landroid/os/Looper;Landroid/os/UserHandle;Z)V

    .line 623
    new-instance v0, Lcom/android/server/usb/MtpNotificationManager;

    .line 625
    new-instance v2, Lcom/android/server/usb/-$Lambda$FKfu8uuaZxaSOkvg1oeLD5zHuwk;

    invoke-direct {v2, p0}, Lcom/android/server/usb/-$Lambda$FKfu8uuaZxaSOkvg1oeLD5zHuwk;-><init>(Ljava/lang/Object;)V

    .line 623
    invoke-direct {v0, v1, v2}, Lcom/android/server/usb/MtpNotificationManager;-><init>(Landroid/content/Context;Lcom/android/server/usb/MtpNotificationManager$OnOpenInAppListener;)V

    iput-object v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->mMtpNotificationManager:Lcom/android/server/usb/MtpNotificationManager;

    .line 627
    return-void

    .line 598
    :catch_8a
    move-exception v0

    .line 599
    new-instance v0, Ljava/lang/RuntimeException;

    const-string/jumbo v1, "Missing android package"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 615
    :catchall_94
    move-exception v0

    monitor-exit v2

    throw v0
.end method

.method private clearCompatibleMatchesLocked(Lcom/android/server/usb/UsbProfileGroupSettingsManager$UserPackage;Lcom/android/server/usb/UsbProfileGroupSettingsManager$AccessoryFilter;)Z
    .registers 7

    .prologue
    .line 1283
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 1286
    iget-object v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->mAccessoryPreferenceMap:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_f
    :goto_f
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_33

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$AccessoryFilter;

    .line 1287
    invoke-virtual {p2, v0}, Lcom/android/server/usb/UsbProfileGroupSettingsManager$AccessoryFilter;->contains(Lcom/android/server/usb/UsbProfileGroupSettingsManager$AccessoryFilter;)Z

    move-result v1

    if-eqz v1, :cond_f

    .line 1288
    iget-object v1, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->mAccessoryPreferenceMap:Ljava/util/HashMap;

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/server/usb/UsbProfileGroupSettingsManager$UserPackage;

    .line 1289
    invoke-virtual {v1, p1}, Lcom/android/server/usb/UsbProfileGroupSettingsManager$UserPackage;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_f

    .line 1290
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_f

    .line 1295
    :cond_33
    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_4f

    .line 1296
    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_3d
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4f

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$AccessoryFilter;

    .line 1297
    iget-object v3, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->mAccessoryPreferenceMap:Ljava/util/HashMap;

    invoke-virtual {v3, v0}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_3d

    .line 1301
    :cond_4f
    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method private clearCompatibleMatchesLocked(Lcom/android/server/usb/UsbProfileGroupSettingsManager$UserPackage;Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;)Z
    .registers 7

    .prologue
    .line 1260
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 1263
    iget-object v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->mDevicePreferenceMap:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_f
    :goto_f
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_33

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;

    .line 1264
    invoke-virtual {p2, v0}, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->contains(Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;)Z

    move-result v1

    if-eqz v1, :cond_f

    .line 1265
    iget-object v1, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->mDevicePreferenceMap:Ljava/util/HashMap;

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/server/usb/UsbProfileGroupSettingsManager$UserPackage;

    .line 1266
    invoke-virtual {v1, p1}, Lcom/android/server/usb/UsbProfileGroupSettingsManager$UserPackage;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_f

    .line 1267
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_f

    .line 1272
    :cond_33
    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_4f

    .line 1273
    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_3d
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4f

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;

    .line 1274
    iget-object v3, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->mDevicePreferenceMap:Ljava/util/HashMap;

    invoke-virtual {v3, v0}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_3d

    .line 1278
    :cond_4f
    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method private clearPackageDefaultsLocked(Lcom/android/server/usb/UsbProfileGroupSettingsManager$UserPackage;)Z
    .registers 10

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 1483
    iget-object v5, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->mLock:Ljava/lang/Object;

    monitor-enter v5

    .line 1484
    :try_start_5
    iget-object v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->mDevicePreferenceMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsValue(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_38

    .line 1486
    iget-object v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->mDevicePreferenceMap:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    const/4 v1, 0x0

    new-array v1, v1, [Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;

    invoke-interface {v0, v1}, Ljava/util/Set;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;

    move v4, v3

    move v1, v3

    .line 1487
    :goto_1e
    array-length v6, v0

    if-ge v4, v6, :cond_39

    .line 1488
    aget-object v6, v0, v4

    .line 1489
    iget-object v7, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->mDevicePreferenceMap:Ljava/util/HashMap;

    invoke-virtual {v7, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {p1, v7}, Lcom/android/server/usb/UsbProfileGroupSettingsManager$UserPackage;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_35

    .line 1490
    iget-object v1, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->mDevicePreferenceMap:Ljava/util/HashMap;

    invoke-virtual {v1, v6}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move v1, v2

    .line 1487
    :cond_35
    add-int/lit8 v4, v4, 0x1

    goto :goto_1e

    :cond_38
    move v1, v3

    .line 1495
    :cond_39
    iget-object v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->mAccessoryPreferenceMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsValue(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6a

    .line 1498
    iget-object v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->mAccessoryPreferenceMap:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    const/4 v4, 0x0

    new-array v4, v4, [Lcom/android/server/usb/UsbProfileGroupSettingsManager$AccessoryFilter;

    invoke-interface {v0, v4}, Ljava/util/Set;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/android/server/usb/UsbProfileGroupSettingsManager$AccessoryFilter;

    .line 1499
    :goto_50
    array-length v4, v0

    if-ge v3, v4, :cond_6a

    .line 1500
    aget-object v4, v0, v3

    .line 1501
    iget-object v6, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->mAccessoryPreferenceMap:Ljava/util/HashMap;

    invoke-virtual {v6, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {p1, v6}, Lcom/android/server/usb/UsbProfileGroupSettingsManager$UserPackage;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_67

    .line 1502
    iget-object v1, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->mAccessoryPreferenceMap:Ljava/util/HashMap;

    invoke-virtual {v1, v4}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_66
    .catchall {:try_start_5 .. :try_end_66} :catchall_6c

    move v1, v2

    .line 1499
    :cond_67
    add-int/lit8 v3, v3, 0x1

    goto :goto_50

    :cond_6a
    monitor-exit v5

    .line 1507
    return v1

    .line 1483
    :catchall_6c
    move-exception v0

    monitor-exit v5

    throw v0
.end method

.method private static createDeviceAttachedIntent(Landroid/hardware/usb/UsbDevice;)Landroid/content/Intent;
    .registers 3

    .prologue
    .line 1525
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v1, "android.hardware.usb.action.USB_DEVICE_ATTACHED"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1526
    const-string/jumbo v1, "device"

    invoke-virtual {v0, v1, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 1528
    const/high16 v1, 0x11000000

    .line 1527
    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 1530
    return-object v0
.end method

.method private getAccessoryMatchesLocked(Landroid/hardware/usb/UsbAccessory;Landroid/content/Intent;)Ljava/util/ArrayList;
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/hardware/usb/UsbAccessory;",
            "Landroid/content/Intent;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/content/pm/ResolveInfo;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1025
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 1026
    invoke-direct {p0, p2}, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->queryIntentActivitiesForAllProfiles(Landroid/content/Intent;)Ljava/util/ArrayList;

    move-result-object v3

    .line 1027
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v4

    .line 1028
    const/4 v0, 0x0

    move v1, v0

    :goto_f
    if-ge v1, v4, :cond_29

    .line 1029
    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/pm/ResolveInfo;

    .line 1030
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    invoke-direct {p0, v0, v5, v6, p1}, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->packageMatchesLocked(Landroid/content/pm/ResolveInfo;Ljava/lang/String;Landroid/hardware/usb/UsbDevice;Landroid/hardware/usb/UsbAccessory;)Z

    move-result v5

    if-eqz v5, :cond_25

    .line 1031
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1028
    :cond_25
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_f

    .line 1035
    :cond_29
    invoke-direct {p0, v2}, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->preferHighPriority(Ljava/util/ArrayList;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->removeForwardIntentIfNotNeeded(Ljava/util/ArrayList;)Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method

.method private getDefaultActivityLocked(Ljava/util/ArrayList;Lcom/android/server/usb/UsbProfileGroupSettingsManager$UserPackage;)Landroid/content/pm/ActivityInfo;
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/content/pm/ResolveInfo;",
            ">;",
            "Lcom/android/server/usb/UsbProfileGroupSettingsManager$UserPackage;",
            ")",
            "Landroid/content/pm/ActivityInfo;"
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    const/4 v5, 0x0

    .line 1228
    if-eqz p2, :cond_34

    .line 1230
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_8
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_34

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/pm/ResolveInfo;

    .line 1231
    iget-object v2, v0, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    if-eqz v2, :cond_8

    .line 1232
    new-instance v2, Lcom/android/server/usb/UsbProfileGroupSettingsManager$UserPackage;

    iget-object v3, v0, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v3, v3, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    .line 1234
    iget-object v4, v0, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v4, v4, Landroid/content/pm/ActivityInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget v4, v4, Landroid/content/pm/ApplicationInfo;->uid:I

    .line 1233
    invoke-static {v4}, Landroid/os/UserHandle;->getUserHandleForUid(I)Landroid/os/UserHandle;

    move-result-object v4

    .line 1232
    invoke-direct {v2, v3, v4, v5}, Lcom/android/server/usb/UsbProfileGroupSettingsManager$UserPackage;-><init>(Ljava/lang/String;Landroid/os/UserHandle;Lcom/android/server/usb/UsbProfileGroupSettingsManager$UserPackage;)V

    .line 1231
    invoke-virtual {p2, v2}, Lcom/android/server/usb/UsbProfileGroupSettingsManager$UserPackage;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 1235
    iget-object v0, v0, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    return-object v0

    .line 1240
    :cond_34
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_57

    .line 1241
    invoke-virtual {p1, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/pm/ResolveInfo;

    iget-object v0, v0, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    .line 1242
    if-eqz v0, :cond_57

    .line 1243
    iget-boolean v1, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->mDisablePermissionDialogs:Z

    if-eqz v1, :cond_4a

    .line 1244
    return-object v0

    .line 1247
    :cond_4a
    iget-object v1, v0, Landroid/content/pm/ActivityInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    if-eqz v1, :cond_57

    .line 1248
    iget-object v1, v0, Landroid/content/pm/ActivityInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget v1, v1, Landroid/content/pm/ApplicationInfo;->flags:I

    and-int/lit8 v1, v1, 0x1

    if-eqz v1, :cond_57

    .line 1250
    return-object v0

    .line 1255
    :cond_57
    return-object v5
.end method

.method private getDeviceMatchesLocked(Landroid/hardware/usb/UsbDevice;Landroid/content/Intent;)Ljava/util/ArrayList;
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/hardware/usb/UsbDevice;",
            "Landroid/content/Intent;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/content/pm/ResolveInfo;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1010
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 1011
    invoke-direct {p0, p2}, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->queryIntentActivitiesForAllProfiles(Landroid/content/Intent;)Ljava/util/ArrayList;

    move-result-object v3

    .line 1012
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v4

    .line 1013
    const/4 v0, 0x0

    move v1, v0

    :goto_f
    if-ge v1, v4, :cond_29

    .line 1014
    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/pm/ResolveInfo;

    .line 1015
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    invoke-direct {p0, v0, v5, p1, v6}, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->packageMatchesLocked(Landroid/content/pm/ResolveInfo;Ljava/lang/String;Landroid/hardware/usb/UsbDevice;Landroid/hardware/usb/UsbAccessory;)Z

    move-result v5

    if-eqz v5, :cond_25

    .line 1016
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1013
    :cond_25
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_f

    .line 1020
    :cond_29
    invoke-direct {p0, v2}, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->preferHighPriority(Ljava/util/ArrayList;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->removeForwardIntentIfNotNeeded(Ljava/util/ArrayList;)Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method

.method private getSerial(Landroid/os/UserHandle;)I
    .registers 4

    .prologue
    .line 1383
    iget-object v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->mUserManager:Landroid/os/UserManager;

    invoke-virtual {p1}, Landroid/os/UserHandle;->getIdentifier()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/os/UserManager;->getUserSerialNumber(I)I

    move-result v0

    return v0
.end method

.method private handlePackageAdded(Lcom/android/server/usb/UsbProfileGroupSettingsManager$UserPackage;)V
    .registers 9

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 1341
    iget-object v3, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->mLock:Ljava/lang/Object;

    monitor-enter v3

    .line 1346
    :try_start_5
    iget-object v2, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->mPackageManager:Landroid/content/pm/PackageManager;

    iget-object v4, p1, Lcom/android/server/usb/UsbProfileGroupSettingsManager$UserPackage;->packageName:Ljava/lang/String;

    .line 1348
    iget-object v5, p1, Lcom/android/server/usb/UsbProfileGroupSettingsManager$UserPackage;->user:Landroid/os/UserHandle;

    invoke-virtual {v5}, Landroid/os/UserHandle;->getIdentifier()I

    move-result v5

    .line 1347
    const/16 v6, 0x81

    .line 1346
    invoke-virtual {v2, v4, v6, v5}, Landroid/content/pm/PackageManager;->getPackageInfoAsUser(Ljava/lang/String;II)Landroid/content/pm/PackageInfo;
    :try_end_14
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_5 .. :try_end_14} :catch_1b
    .catchall {:try_start_5 .. :try_end_14} :catchall_5d

    move-result-object v2

    .line 1354
    :try_start_15
    iget-object v4, v2, Landroid/content/pm/PackageInfo;->activities:[Landroid/content/pm/ActivityInfo;
    :try_end_17
    .catchall {:try_start_15 .. :try_end_17} :catchall_5d

    .line 1355
    if-nez v4, :cond_37

    monitor-exit v3

    return-void

    .line 1349
    :catch_1b
    move-exception v0

    .line 1350
    :try_start_1c
    sget-object v1, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "handlePackageUpdate could not find package "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_35
    .catchall {:try_start_1c .. :try_end_35} :catchall_5d

    monitor-exit v3

    .line 1351
    return-void

    :cond_37
    move v2, v0

    .line 1356
    :goto_38
    :try_start_38
    array-length v5, v4

    if-ge v2, v5, :cond_56

    .line 1358
    aget-object v5, v4, v2

    .line 1359
    const-string/jumbo v6, "android.hardware.usb.action.USB_DEVICE_ATTACHED"

    .line 1358
    invoke-direct {p0, p1, v5, v6}, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->handlePackageAddedLocked(Lcom/android/server/usb/UsbProfileGroupSettingsManager$UserPackage;Landroid/content/pm/ActivityInfo;Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_47

    move v0, v1

    .line 1363
    :cond_47
    aget-object v5, v4, v2

    .line 1364
    const-string/jumbo v6, "android.hardware.usb.action.USB_ACCESSORY_ATTACHED"

    .line 1363
    invoke-direct {p0, p1, v5, v6}, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->handlePackageAddedLocked(Lcom/android/server/usb/UsbProfileGroupSettingsManager$UserPackage;Landroid/content/pm/ActivityInfo;Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_53

    move v0, v1

    .line 1356
    :cond_53
    add-int/lit8 v2, v2, 0x1

    goto :goto_38

    .line 1369
    :cond_56
    if-eqz v0, :cond_5b

    .line 1370
    invoke-direct {p0}, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->scheduleWriteSettingsLocked()V
    :try_end_5b
    .catchall {:try_start_38 .. :try_end_5b} :catchall_5d

    :cond_5b
    monitor-exit v3

    .line 1373
    return-void

    .line 1341
    :catchall_5d
    move-exception v0

    monitor-exit v3

    throw v0
.end method

.method private handlePackageAddedLocked(Lcom/android/server/usb/UsbProfileGroupSettingsManager$UserPackage;Landroid/content/pm/ActivityInfo;Ljava/lang/String;)Z
    .registers 10

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x1

    const/4 v2, 0x0

    .line 1310
    :try_start_3
    iget-object v3, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->mPackageManager:Landroid/content/pm/PackageManager;

    invoke-virtual {p2, v3, p3}, Landroid/content/pm/ActivityInfo;->loadXmlMetaData(Landroid/content/pm/PackageManager;Ljava/lang/String;)Landroid/content/res/XmlResourceParser;
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_8} :catch_36
    .catchall {:try_start_3 .. :try_end_8} :catchall_75

    move-result-object v2

    .line 1311
    if-nez v2, :cond_11

    .line 1333
    if-eqz v2, :cond_10

    invoke-interface {v2}, Landroid/content/res/XmlResourceParser;->close()V

    .line 1311
    :cond_10
    return v1

    .line 1313
    :cond_11
    :try_start_11
    invoke-static {v2}, Lcom/android/internal/util/XmlUtils;->nextElement(Lorg/xmlpull/v1/XmlPullParser;)V

    .line 1314
    :goto_14
    invoke-interface {v2}, Landroid/content/res/XmlResourceParser;->getEventType()I

    move-result v3

    if-eq v3, v0, :cond_6f

    .line 1315
    invoke-interface {v2}, Landroid/content/res/XmlResourceParser;->getName()Ljava/lang/String;

    move-result-object v3

    .line 1316
    const-string/jumbo v4, "usb-device"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_5a

    .line 1317
    invoke-static {v2}, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->read(Lorg/xmlpull/v1/XmlPullParser;)Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;

    move-result-object v3

    .line 1318
    invoke-direct {p0, p1, v3}, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->clearCompatibleMatchesLocked(Lcom/android/server/usb/UsbProfileGroupSettingsManager$UserPackage;Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;)Z

    move-result v3

    if-eqz v3, :cond_32

    move v1, v0

    .line 1328
    :cond_32
    :goto_32
    invoke-static {v2}, Lcom/android/internal/util/XmlUtils;->nextElement(Lorg/xmlpull/v1/XmlPullParser;)V
    :try_end_35
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_35} :catch_36
    .catchall {:try_start_11 .. :try_end_35} :catchall_75

    goto :goto_14

    .line 1330
    :catch_36
    move-exception v0

    .line 1331
    :try_start_37
    sget-object v3, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "Unable to load component info "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p2}, Landroid/content/pm/ActivityInfo;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4, v0}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_54
    .catchall {:try_start_37 .. :try_end_54} :catchall_75

    .line 1333
    if-eqz v2, :cond_59

    invoke-interface {v2}, Landroid/content/res/XmlResourceParser;->close()V

    .line 1335
    :cond_59
    :goto_59
    return v1

    .line 1322
    :cond_5a
    :try_start_5a
    const-string/jumbo v4, "usb-accessory"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_32

    .line 1323
    invoke-static {v2}, Lcom/android/server/usb/UsbProfileGroupSettingsManager$AccessoryFilter;->read(Lorg/xmlpull/v1/XmlPullParser;)Lcom/android/server/usb/UsbProfileGroupSettingsManager$AccessoryFilter;

    move-result-object v3

    .line 1324
    invoke-direct {p0, p1, v3}, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->clearCompatibleMatchesLocked(Lcom/android/server/usb/UsbProfileGroupSettingsManager$UserPackage;Lcom/android/server/usb/UsbProfileGroupSettingsManager$AccessoryFilter;)Z
    :try_end_6a
    .catch Ljava/lang/Exception; {:try_start_5a .. :try_end_6a} :catch_36
    .catchall {:try_start_5a .. :try_end_6a} :catchall_75

    move-result v3

    if-eqz v3, :cond_32

    move v1, v0

    .line 1325
    goto :goto_32

    .line 1333
    :cond_6f
    if-eqz v2, :cond_59

    invoke-interface {v2}, Landroid/content/res/XmlResourceParser;->close()V

    goto :goto_59

    .line 1332
    :catchall_75
    move-exception v0

    .line 1333
    if-eqz v2, :cond_7b

    invoke-interface {v2}, Landroid/content/res/XmlResourceParser;->close()V

    .line 1332
    :cond_7b
    throw v0
.end method

.method private isForwardMatch(Landroid/content/pm/ResolveInfo;)Z
    .registers 4

    .prologue
    .line 903
    invoke-virtual {p1}, Landroid/content/pm/ResolveInfo;->getComponentInfo()Landroid/content/pm/ComponentInfo;

    move-result-object v0

    iget-object v0, v0, Landroid/content/pm/ComponentInfo;->name:Ljava/lang/String;

    sget-object v1, Lcom/android/internal/app/IntentForwarderActivity;->FORWARD_INTENT_TO_MANAGED_PROFILE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method private packageMatchesLocked(Landroid/content/pm/ResolveInfo;Ljava/lang/String;Landroid/hardware/usb/UsbDevice;Landroid/hardware/usb/UsbAccessory;)Z
    .registers 11

    .prologue
    const/4 v5, 0x0

    const/4 v3, 0x1

    const/4 v1, 0x0

    .line 835
    invoke-direct {p0, p1}, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->isForwardMatch(Landroid/content/pm/ResolveInfo;)Z

    move-result v0

    if-eqz v0, :cond_a

    .line 836
    return v3

    .line 839
    :cond_a
    iget-object v0, p1, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    .line 843
    :try_start_c
    iget-object v2, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->mPackageManager:Landroid/content/pm/PackageManager;

    invoke-virtual {v0, v2, p2}, Landroid/content/pm/ActivityInfo;->loadXmlMetaData(Landroid/content/pm/PackageManager;Ljava/lang/String;)Landroid/content/res/XmlResourceParser;

    move-result-object v1

    .line 844
    if-nez v1, :cond_33

    .line 845
    sget-object v0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "no meta-data for "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2d
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_2d} :catch_7a
    .catchall {:try_start_c .. :try_end_2d} :catchall_a4

    .line 869
    if-eqz v1, :cond_32

    invoke-interface {v1}, Landroid/content/res/XmlResourceParser;->close()V

    .line 846
    :cond_32
    return v5

    .line 849
    :cond_33
    :try_start_33
    invoke-static {v1}, Lcom/android/internal/util/XmlUtils;->nextElement(Lorg/xmlpull/v1/XmlPullParser;)V

    .line 850
    :goto_36
    invoke-interface {v1}, Landroid/content/res/XmlResourceParser;->getEventType()I

    move-result v0

    if-eq v0, v3, :cond_9e

    .line 851
    invoke-interface {v1}, Landroid/content/res/XmlResourceParser;->getName()Ljava/lang/String;

    move-result-object v0

    .line 852
    if-eqz p3, :cond_5b

    const-string/jumbo v2, "usb-device"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5b

    .line 853
    invoke-static {v1}, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->read(Lorg/xmlpull/v1/XmlPullParser;)Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;

    move-result-object v0

    .line 854
    invoke-virtual {v0, p3}, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->matches(Landroid/hardware/usb/UsbDevice;)Z
    :try_end_52
    .catch Ljava/lang/Exception; {:try_start_33 .. :try_end_52} :catch_7a
    .catchall {:try_start_33 .. :try_end_52} :catchall_a4

    move-result v0

    if-eqz v0, :cond_76

    .line 869
    if-eqz v1, :cond_5a

    invoke-interface {v1}, Landroid/content/res/XmlResourceParser;->close()V

    .line 855
    :cond_5a
    return v3

    .line 858
    :cond_5b
    if-eqz p4, :cond_76

    :try_start_5d
    const-string/jumbo v2, "usb-accessory"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_76

    .line 859
    invoke-static {v1}, Lcom/android/server/usb/UsbProfileGroupSettingsManager$AccessoryFilter;->read(Lorg/xmlpull/v1/XmlPullParser;)Lcom/android/server/usb/UsbProfileGroupSettingsManager$AccessoryFilter;

    move-result-object v0

    .line 860
    invoke-virtual {v0, p4}, Lcom/android/server/usb/UsbProfileGroupSettingsManager$AccessoryFilter;->matches(Landroid/hardware/usb/UsbAccessory;)Z
    :try_end_6d
    .catch Ljava/lang/Exception; {:try_start_5d .. :try_end_6d} :catch_7a
    .catchall {:try_start_5d .. :try_end_6d} :catchall_a4

    move-result v0

    if-eqz v0, :cond_76

    .line 869
    if-eqz v1, :cond_75

    invoke-interface {v1}, Landroid/content/res/XmlResourceParser;->close()V

    .line 861
    :cond_75
    return v3

    .line 864
    :cond_76
    :try_start_76
    invoke-static {v1}, Lcom/android/internal/util/XmlUtils;->nextElement(Lorg/xmlpull/v1/XmlPullParser;)V
    :try_end_79
    .catch Ljava/lang/Exception; {:try_start_76 .. :try_end_79} :catch_7a
    .catchall {:try_start_76 .. :try_end_79} :catchall_a4

    goto :goto_36

    .line 866
    :catch_7a
    move-exception v0

    .line 867
    :try_start_7b
    sget-object v2, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "Unable to load component info "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p1}, Landroid/content/pm/ResolveInfo;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v0}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_98
    .catchall {:try_start_7b .. :try_end_98} :catchall_a4

    .line 869
    if-eqz v1, :cond_9d

    invoke-interface {v1}, Landroid/content/res/XmlResourceParser;->close()V

    .line 871
    :cond_9d
    :goto_9d
    return v5

    .line 869
    :cond_9e
    if-eqz v1, :cond_9d

    invoke-interface {v1}, Landroid/content/res/XmlResourceParser;->close()V

    goto :goto_9d

    .line 868
    :catchall_a4
    move-exception v0

    .line 869
    if-eqz v1, :cond_aa

    invoke-interface {v1}, Landroid/content/res/XmlResourceParser;->close()V

    .line 868
    :cond_aa
    throw v0
.end method

.method private preferHighPriority(Ljava/util/ArrayList;)Ljava/util/ArrayList;
    .registers 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/content/pm/ResolveInfo;",
            ">;)",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/content/pm/ResolveInfo;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 915
    new-instance v4, Landroid/util/SparseArray;

    invoke-direct {v4}, Landroid/util/SparseArray;-><init>()V

    .line 916
    new-instance v5, Landroid/util/SparseIntArray;

    invoke-direct {v5}, Landroid/util/SparseIntArray;-><init>()V

    .line 917
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 920
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v7

    move v3, v2

    .line 921
    :goto_15
    if-ge v3, v7, :cond_6b

    .line 922
    invoke-virtual {p1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/pm/ResolveInfo;

    .line 926
    invoke-direct {p0, v0}, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->isForwardMatch(Landroid/content/pm/ResolveInfo;)Z

    move-result v1

    if-eqz v1, :cond_2a

    .line 927
    invoke-virtual {v6, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 921
    :cond_26
    :goto_26
    add-int/lit8 v0, v3, 0x1

    move v3, v0

    goto :goto_15

    .line 932
    :cond_2a
    iget v1, v0, Landroid/content/pm/ResolveInfo;->targetUserId:I

    invoke-virtual {v5, v1}, Landroid/util/SparseIntArray;->indexOfKey(I)I

    move-result v1

    if-gez v1, :cond_43

    .line 933
    iget v1, v0, Landroid/content/pm/ResolveInfo;->targetUserId:I

    const/high16 v8, -0x80000000

    invoke-virtual {v5, v1, v8}, Landroid/util/SparseIntArray;->put(II)V

    .line 934
    iget v1, v0, Landroid/content/pm/ResolveInfo;->targetUserId:I

    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v4, v1, v8}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 938
    :cond_43
    iget v1, v0, Landroid/content/pm/ResolveInfo;->targetUserId:I

    invoke-virtual {v5, v1}, Landroid/util/SparseIntArray;->get(I)I

    move-result v8

    .line 940
    iget v1, v0, Landroid/content/pm/ResolveInfo;->targetUserId:I

    .line 939
    invoke-virtual {v4, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/ArrayList;

    .line 942
    iget v9, v0, Landroid/content/pm/ResolveInfo;->priority:I

    if-ne v9, v8, :cond_59

    .line 943
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_26

    .line 944
    :cond_59
    iget v9, v0, Landroid/content/pm/ResolveInfo;->priority:I

    if-le v9, v8, :cond_26

    .line 945
    iget v8, v0, Landroid/content/pm/ResolveInfo;->targetUserId:I

    iget v9, v0, Landroid/content/pm/ResolveInfo;->priority:I

    invoke-virtual {v5, v8, v9}, Landroid/util/SparseIntArray;->put(II)V

    .line 947
    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    .line 948
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_26

    .line 955
    :cond_6b
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3, v6}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 956
    invoke-virtual {v4}, Landroid/util/SparseArray;->size()I

    move-result v5

    move v1, v2

    .line 957
    :goto_75
    if-ge v1, v5, :cond_84

    .line 958
    invoke-virtual {v4, v1}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Collection;

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 957
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_75

    .line 961
    :cond_84
    return-object v3
.end method

.method private queryIntentActivitiesForAllProfiles(Landroid/content/Intent;)Ljava/util/ArrayList;
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Intent;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/content/pm/ResolveInfo;",
            ">;"
        }
    .end annotation

    .prologue
    .line 883
    iget-object v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->mUserManager:Landroid/os/UserManager;

    iget-object v1, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->mParentUser:Landroid/os/UserHandle;

    invoke-virtual {v1}, Landroid/os/UserHandle;->getIdentifier()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/os/UserManager;->getEnabledProfiles(I)Ljava/util/List;

    move-result-object v2

    .line 885
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 886
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v4

    .line 887
    const/4 v0, 0x0

    move v1, v0

    :goto_17
    if-ge v1, v4, :cond_30

    .line 888
    iget-object v5, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->mPackageManager:Landroid/content/pm/PackageManager;

    .line 889
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/pm/UserInfo;

    iget v0, v0, Landroid/content/pm/UserInfo;->id:I

    const/16 v6, 0x80

    .line 888
    invoke-virtual {v5, p1, v6, v0}, Landroid/content/pm/PackageManager;->queryIntentActivitiesAsUser(Landroid/content/Intent;II)Ljava/util/List;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 887
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_17

    .line 892
    :cond_30
    return-object v3
.end method

.method private readPreference(Lorg/xmlpull/v1/XmlPullParser;)V
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 670
    iget-object v1, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->mParentUser:Landroid/os/UserHandle;

    .line 672
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeCount()I

    move-result v4

    .line 673
    const/4 v0, 0x0

    move v2, v0

    move-object v0, v3

    :goto_a
    if-ge v2, v4, :cond_3c

    .line 674
    const-string/jumbo v5, "package"

    invoke-interface {p1, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeName(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1d

    .line 675
    invoke-interface {p1, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(I)Ljava/lang/String;

    move-result-object v0

    .line 677
    :cond_1d
    const-string/jumbo v5, "user"

    invoke-interface {p1, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeName(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_39

    .line 679
    iget-object v1, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->mUserManager:Landroid/os/UserManager;

    .line 680
    invoke-interface {p1, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    int-to-long v6, v5

    .line 679
    invoke-virtual {v1, v6, v7}, Landroid/os/UserManager;->getUserForSerialNumber(J)Landroid/os/UserHandle;

    move-result-object v1

    .line 673
    :cond_39
    add-int/lit8 v2, v2, 0x1

    goto :goto_a

    .line 684
    :cond_3c
    invoke-static {p1}, Lcom/android/internal/util/XmlUtils;->nextElement(Lorg/xmlpull/v1/XmlPullParser;)V

    .line 685
    const-string/jumbo v2, "usb-device"

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_60

    .line 686
    invoke-static {p1}, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->read(Lorg/xmlpull/v1/XmlPullParser;)Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;

    move-result-object v2

    .line 687
    if-eqz v1, :cond_5c

    .line 688
    iget-object v4, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->mDevicePreferenceMap:Ljava/util/HashMap;

    new-instance v5, Lcom/android/server/usb/UsbProfileGroupSettingsManager$UserPackage;

    invoke-direct {v5, v0, v1, v3}, Lcom/android/server/usb/UsbProfileGroupSettingsManager$UserPackage;-><init>(Ljava/lang/String;Landroid/os/UserHandle;Lcom/android/server/usb/UsbProfileGroupSettingsManager$UserPackage;)V

    invoke-virtual {v4, v2, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 696
    :cond_5c
    :goto_5c
    invoke-static {p1}, Lcom/android/internal/util/XmlUtils;->nextElement(Lorg/xmlpull/v1/XmlPullParser;)V

    .line 697
    return-void

    .line 690
    :cond_60
    const-string/jumbo v2, "usb-accessory"

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5c

    .line 691
    invoke-static {p1}, Lcom/android/server/usb/UsbProfileGroupSettingsManager$AccessoryFilter;->read(Lorg/xmlpull/v1/XmlPullParser;)Lcom/android/server/usb/UsbProfileGroupSettingsManager$AccessoryFilter;

    move-result-object v2

    .line 692
    if-eqz v1, :cond_5c

    .line 693
    iget-object v4, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->mAccessoryPreferenceMap:Ljava/util/HashMap;

    new-instance v5, Lcom/android/server/usb/UsbProfileGroupSettingsManager$UserPackage;

    invoke-direct {v5, v0, v1, v3}, Lcom/android/server/usb/UsbProfileGroupSettingsManager$UserPackage;-><init>(Ljava/lang/String;Landroid/os/UserHandle;Lcom/android/server/usb/UsbProfileGroupSettingsManager$UserPackage;)V

    invoke-virtual {v4, v2, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_5c
.end method

.method private readSettingsLocked()V
    .registers 5

    .prologue
    .line 739
    iget-object v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->mDevicePreferenceMap:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 740
    iget-object v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->mAccessoryPreferenceMap:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 742
    const/4 v1, 0x0

    .line 744
    :try_start_b
    iget-object v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->mSettingsFile:Landroid/util/AtomicFile;

    invoke-virtual {v0}, Landroid/util/AtomicFile;->openRead()Ljava/io/FileInputStream;

    move-result-object v1

    .line 745
    invoke-static {}, Landroid/util/Xml;->newPullParser()Lorg/xmlpull/v1/XmlPullParser;

    move-result-object v0

    .line 746
    sget-object v2, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v2}, Ljava/nio/charset/Charset;->name()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lorg/xmlpull/v1/XmlPullParser;->setInput(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 748
    invoke-static {v0}, Lcom/android/internal/util/XmlUtils;->nextElement(Lorg/xmlpull/v1/XmlPullParser;)V

    .line 749
    :goto_21
    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v2

    const/4 v3, 0x1

    if-eq v2, v3, :cond_54

    .line 750
    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v2

    .line 751
    const-string/jumbo v3, "preference"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3e

    .line 752
    invoke-direct {p0, v0}, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->readPreference(Lorg/xmlpull/v1/XmlPullParser;)V
    :try_end_38
    .catch Ljava/io/FileNotFoundException; {:try_start_b .. :try_end_38} :catch_39
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_38} :catch_42
    .catchall {:try_start_b .. :try_end_38} :catchall_58

    goto :goto_21

    .line 757
    :catch_39
    move-exception v0

    .line 763
    invoke-static {v1}, Llibcore/io/IoUtils;->closeQuietly(Ljava/lang/AutoCloseable;)V

    .line 765
    :goto_3d
    return-void

    .line 754
    :cond_3e
    :try_start_3e
    invoke-static {v0}, Lcom/android/internal/util/XmlUtils;->nextElement(Lorg/xmlpull/v1/XmlPullParser;)V
    :try_end_41
    .catch Ljava/io/FileNotFoundException; {:try_start_3e .. :try_end_41} :catch_39
    .catch Ljava/lang/Exception; {:try_start_3e .. :try_end_41} :catch_42
    .catchall {:try_start_3e .. :try_end_41} :catchall_58

    goto :goto_21

    .line 759
    :catch_42
    move-exception v0

    .line 760
    :try_start_43
    sget-object v2, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->TAG:Ljava/lang/String;

    const-string/jumbo v3, "error reading settings file, deleting to start fresh"

    invoke-static {v2, v3, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 761
    iget-object v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->mSettingsFile:Landroid/util/AtomicFile;

    invoke-virtual {v0}, Landroid/util/AtomicFile;->delete()V
    :try_end_50
    .catchall {:try_start_43 .. :try_end_50} :catchall_58

    .line 763
    invoke-static {v1}, Llibcore/io/IoUtils;->closeQuietly(Ljava/lang/AutoCloseable;)V

    goto :goto_3d

    :cond_54
    invoke-static {v1}, Llibcore/io/IoUtils;->closeQuietly(Ljava/lang/AutoCloseable;)V

    goto :goto_3d

    .line 762
    :catchall_58
    move-exception v0

    .line 763
    invoke-static {v1}, Llibcore/io/IoUtils;->closeQuietly(Ljava/lang/AutoCloseable;)V

    .line 762
    throw v0
.end method

.method private removeForwardIntentIfNotNeeded(Ljava/util/ArrayList;)Ljava/util/ArrayList;
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/content/pm/ResolveInfo;",
            ">;)",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/content/pm/ResolveInfo;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 973
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v5

    move v4, v3

    move v1, v3

    move v2, v3

    .line 979
    :goto_8
    if-ge v4, v5, :cond_37

    .line 980
    invoke-virtual {p1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/pm/ResolveInfo;

    .line 981
    invoke-direct {p0, v0}, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->isForwardMatch(Landroid/content/pm/ResolveInfo;)Z

    move-result v6

    if-nez v6, :cond_5a

    .line 983
    iget-object v0, v0, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v0, v0, Landroid/content/pm/ActivityInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget v0, v0, Landroid/content/pm/ApplicationInfo;->uid:I

    .line 982
    invoke-static {v0}, Landroid/os/UserHandle;->getUserHandleForUid(I)Landroid/os/UserHandle;

    move-result-object v0

    .line 983
    iget-object v6, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->mParentUser:Landroid/os/UserHandle;

    .line 982
    invoke-virtual {v0, v6}, Landroid/os/UserHandle;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_33

    .line 984
    add-int/lit8 v0, v2, 0x1

    move v7, v1

    move v1, v0

    move v0, v7

    .line 979
    :goto_2d
    add-int/lit8 v2, v4, 0x1

    move v4, v2

    move v2, v1

    move v1, v0

    goto :goto_8

    .line 986
    :cond_33
    add-int/lit8 v0, v1, 0x1

    move v1, v2

    goto :goto_2d

    .line 992
    :cond_37
    if-eqz v2, :cond_3b

    if-nez v1, :cond_59

    .line 993
    :cond_3b
    new-instance v4, Ljava/util/ArrayList;

    .line 994
    add-int v0, v2, v1

    .line 993
    invoke-direct {v4, v0}, Ljava/util/ArrayList;-><init>(I)V

    move v1, v3

    .line 996
    :goto_43
    if-ge v1, v5, :cond_58

    .line 997
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/pm/ResolveInfo;

    .line 998
    invoke-direct {p0, v0}, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->isForwardMatch(Landroid/content/pm/ResolveInfo;)Z

    move-result v2

    if-nez v2, :cond_54

    .line 999
    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 996
    :cond_54
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_43

    .line 1002
    :cond_58
    return-object v4

    .line 1005
    :cond_59
    return-object p1

    :cond_5a
    move v0, v1

    move v1, v2

    goto :goto_2d
.end method

.method private resolveActivity(Landroid/content/Intent;Landroid/hardware/usb/UsbDevice;Z)V
    .registers 10

    .prologue
    const/4 v5, 0x0

    .line 1050
    iget-object v1, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 1051
    :try_start_4
    invoke-direct {p0, p2, p1}, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->getDeviceMatchesLocked(Landroid/hardware/usb/UsbDevice;Landroid/content/Intent;)Ljava/util/ArrayList;

    move-result-object v2

    .line 1053
    iget-object v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->mDevicePreferenceMap:Ljava/util/HashMap;

    new-instance v3, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;

    invoke-direct {v3, p2}, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;-><init>(Landroid/hardware/usb/UsbDevice;)V

    invoke-virtual {v0, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$UserPackage;

    .line 1052
    invoke-direct {p0, v2, v0}, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->getDefaultActivityLocked(Ljava/util/ArrayList;Lcom/android/server/usb/UsbProfileGroupSettingsManager$UserPackage;)Landroid/content/pm/ActivityInfo;
    :try_end_18
    .catchall {:try_start_4 .. :try_end_18} :catchall_2c

    move-result-object v3

    monitor-exit v1

    .line 1056
    if-eqz p3, :cond_2f

    .line 1057
    iget-object v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->mPackageManager:Landroid/content/pm/PackageManager;

    .line 1056
    invoke-static {v0, p2}, Lcom/android/server/usb/MtpNotificationManager;->shouldShowNotification(Landroid/content/pm/PackageManager;Landroid/hardware/usb/UsbDevice;)Z

    move-result v0

    if-eqz v0, :cond_2f

    .line 1057
    if-nez v3, :cond_2f

    .line 1059
    iget-object v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->mMtpNotificationManager:Lcom/android/server/usb/MtpNotificationManager;

    invoke-virtual {v0, p2}, Lcom/android/server/usb/MtpNotificationManager;->showNotification(Landroid/hardware/usb/UsbDevice;)V

    .line 1060
    return-void

    .line 1050
    :catchall_2c
    move-exception v0

    monitor-exit v1

    throw v0

    :cond_2f
    move-object v0, p0

    move-object v1, p1

    move-object v4, p2

    .line 1064
    invoke-direct/range {v0 .. v5}, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->resolveActivity(Landroid/content/Intent;Ljava/util/ArrayList;Landroid/content/pm/ActivityInfo;Landroid/hardware/usb/UsbDevice;Landroid/hardware/usb/UsbAccessory;)V

    .line 1065
    return-void
.end method

.method private resolveActivity(Landroid/content/Intent;Ljava/util/ArrayList;Landroid/content/pm/ActivityInfo;Landroid/hardware/usb/UsbDevice;Landroid/hardware/usb/UsbAccessory;)V
    .registers 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Intent;",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/content/pm/ResolveInfo;",
            ">;",
            "Landroid/content/pm/ActivityInfo;",
            "Landroid/hardware/usb/UsbDevice;",
            "Landroid/hardware/usb/UsbAccessory;",
            ")V"
        }
    .end annotation

    .prologue
    const/high16 v4, 0x10000000

    const/4 v3, 0x0

    .line 1136
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-nez v0, :cond_46

    .line 1137
    if-eqz p5, :cond_3b

    .line 1138
    invoke-virtual {p5}, Landroid/hardware/usb/UsbAccessory;->getUri()Ljava/lang/String;

    move-result-object v0

    .line 1139
    if-eqz v0, :cond_3b

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_3b

    .line 1141
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 1142
    const-string/jumbo v2, "com.android.systemui"

    .line 1143
    const-string/jumbo v3, "com.android.systemui.usb.UsbAccessoryUriActivity"

    .line 1142
    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1144
    invoke-virtual {v1, v4}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 1145
    const-string/jumbo v2, "accessory"

    invoke-virtual {v1, v2, p5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 1146
    const-string/jumbo v2, "uri"

    invoke-virtual {v1, v2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1148
    :try_start_34
    iget-object v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->mParentUser:Landroid/os/UserHandle;

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->startActivityAsUser(Landroid/content/Intent;Landroid/os/UserHandle;)V
    :try_end_3b
    .catch Landroid/content/ActivityNotFoundException; {:try_start_34 .. :try_end_3b} :catch_3c

    .line 1156
    :cond_3b
    :goto_3b
    return-void

    .line 1149
    :catch_3c
    move-exception v0

    .line 1150
    sget-object v0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "unable to start UsbAccessoryUriActivity"

    invoke-static {v0, v1}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_3b

    .line 1159
    :cond_46
    if-eqz p3, :cond_8d

    .line 1160
    iget-object v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->mSettingsManager:Lcom/android/server/usb/UsbSettingsManager;

    .line 1161
    iget-object v1, p3, Landroid/content/pm/ActivityInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget v1, v1, Landroid/content/pm/ApplicationInfo;->uid:I

    invoke-static {v1}, Landroid/os/UserHandle;->getUserId(I)I

    move-result v1

    .line 1160
    invoke-virtual {v0, v1}, Lcom/android/server/usb/UsbSettingsManager;->getSettingsForUser(I)Lcom/android/server/usb/UsbUserSettingsManager;

    move-result-object v0

    .line 1163
    if-eqz p4, :cond_79

    .line 1165
    iget-object v1, p3, Landroid/content/pm/ActivityInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget v1, v1, Landroid/content/pm/ApplicationInfo;->uid:I

    .line 1164
    invoke-virtual {v0, p4, v1}, Lcom/android/server/usb/UsbUserSettingsManager;->grantDevicePermission(Landroid/hardware/usb/UsbDevice;I)V

    .line 1174
    :cond_5f
    :goto_5f
    :try_start_5f
    new-instance v0, Landroid/content/ComponentName;

    iget-object v1, p3, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    iget-object v2, p3, Landroid/content/pm/ActivityInfo;->name:Ljava/lang/String;

    invoke-direct {v0, v1, v2}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 1173
    invoke-virtual {p1, v0}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 1177
    iget-object v0, p3, Landroid/content/pm/ActivityInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget v0, v0, Landroid/content/pm/ApplicationInfo;->uid:I

    .line 1176
    invoke-static {v0}, Landroid/os/UserHandle;->getUserHandleForUid(I)Landroid/os/UserHandle;

    move-result-object v0

    .line 1178
    iget-object v1, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->mContext:Landroid/content/Context;

    invoke-virtual {v1, p1, v0}, Landroid/content/Context;->startActivityAsUser(Landroid/content/Intent;Landroid/os/UserHandle;)V
    :try_end_78
    .catch Landroid/content/ActivityNotFoundException; {:try_start_5f .. :try_end_78} :catch_83

    .line 1216
    :goto_78
    return-void

    .line 1166
    :cond_79
    if-eqz p5, :cond_5f

    .line 1168
    iget-object v1, p3, Landroid/content/pm/ActivityInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget v1, v1, Landroid/content/pm/ApplicationInfo;->uid:I

    .line 1167
    invoke-virtual {v0, p5, v1}, Lcom/android/server/usb/UsbUserSettingsManager;->grantAccessoryPermission(Landroid/hardware/usb/UsbAccessory;I)V

    goto :goto_5f

    .line 1179
    :catch_83
    move-exception v0

    .line 1180
    sget-object v1, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->TAG:Ljava/lang/String;

    const-string/jumbo v2, "startActivity failed"

    invoke-static {v1, v2, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_78

    .line 1183
    :cond_8d
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 1184
    invoke-virtual {v1, v4}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 1187
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v2, 0x1

    if-ne v0, v2, :cond_eb

    .line 1188
    invoke-virtual {p2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/pm/ResolveInfo;

    .line 1191
    const-string/jumbo v2, "com.android.systemui"

    .line 1192
    const-string/jumbo v3, "com.android.systemui.usb.UsbConfirmActivity"

    .line 1191
    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1193
    const-string/jumbo v2, "rinfo"

    invoke-virtual {v1, v2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 1194
    iget-object v0, v0, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v0, v0, Landroid/content/pm/ActivityInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget v0, v0, Landroid/content/pm/ApplicationInfo;->uid:I

    invoke-static {v0}, Landroid/os/UserHandle;->getUserHandleForUid(I)Landroid/os/UserHandle;

    move-result-object v0

    .line 1196
    if-eqz p4, :cond_e4

    .line 1197
    const-string/jumbo v2, "device"

    invoke-virtual {v1, v2, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 1211
    :goto_c3
    :try_start_c3
    iget-object v2, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->mContext:Landroid/content/Context;

    invoke-virtual {v2, v1, v0}, Landroid/content/Context;->startActivityAsUser(Landroid/content/Intent;Landroid/os/UserHandle;)V
    :try_end_c8
    .catch Landroid/content/ActivityNotFoundException; {:try_start_c3 .. :try_end_c8} :catch_c9

    goto :goto_78

    .line 1212
    :catch_c9
    move-exception v0

    .line 1213
    sget-object v2, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "unable to start activity "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_78

    .line 1199
    :cond_e4
    const-string/jumbo v2, "accessory"

    invoke-virtual {v1, v2, p5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    goto :goto_c3

    .line 1202
    :cond_eb
    iget-object v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->mParentUser:Landroid/os/UserHandle;

    .line 1205
    const-string/jumbo v2, "com.android.systemui"

    .line 1206
    const-string/jumbo v3, "com.android.systemui.usb.UsbResolverActivity"

    .line 1205
    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1207
    const-string/jumbo v2, "rlist"

    invoke-virtual {v1, v2, p2}, Landroid/content/Intent;->putParcelableArrayListExtra(Ljava/lang/String;Ljava/util/ArrayList;)Landroid/content/Intent;

    .line 1208
    const-string/jumbo v2, "android.intent.extra.INTENT"

    invoke-virtual {v1, v2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    goto :goto_c3
.end method

.method private scheduleWriteSettingsLocked()V
    .registers 3

    .prologue
    const/4 v1, 0x1

    .line 776
    iget-boolean v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->mIsWriteSettingsScheduled:Z

    if-eqz v0, :cond_6

    .line 777
    return-void

    .line 779
    :cond_6
    iput-boolean v1, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->mIsWriteSettingsScheduled:Z

    .line 782
    new-instance v0, Lcom/android/server/usb/-$Lambda$ATEm4_U2eaRn21cN0eCfdiUt5-k;

    invoke-direct {v0, v1, p0}, Lcom/android/server/usb/-$Lambda$ATEm4_U2eaRn21cN0eCfdiUt5-k;-><init>(BLjava/lang/Object;)V

    invoke-static {v0}, Landroid/os/AsyncTask;->execute(Ljava/lang/Runnable;)V

    .line 829
    return-void
.end method

.method private upgradeSingleUserLocked()V
    .registers 5

    .prologue
    .line 704
    sget-object v0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->sSingleUserSettingsFile:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_56

    .line 705
    iget-object v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->mDevicePreferenceMap:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 706
    iget-object v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->mAccessoryPreferenceMap:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 708
    const/4 v2, 0x0

    .line 710
    :try_start_13
    new-instance v1, Ljava/io/FileInputStream;

    sget-object v0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->sSingleUserSettingsFile:Ljava/io/File;

    invoke-direct {v1, v0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_1a
    .catch Ljava/io/IOException; {:try_start_13 .. :try_end_1a} :catch_67
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_13 .. :try_end_1a} :catch_67
    .catchall {:try_start_13 .. :try_end_1a} :catchall_64

    .line 711
    :try_start_1a
    invoke-static {}, Landroid/util/Xml;->newPullParser()Lorg/xmlpull/v1/XmlPullParser;

    move-result-object v0

    .line 712
    sget-object v2, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v2}, Ljava/nio/charset/Charset;->name()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lorg/xmlpull/v1/XmlPullParser;->setInput(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 714
    invoke-static {v0}, Lcom/android/internal/util/XmlUtils;->nextElement(Lorg/xmlpull/v1/XmlPullParser;)V

    .line 715
    :goto_2a
    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v2

    const/4 v3, 0x1

    if-eq v2, v3, :cond_60

    .line 716
    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v2

    .line 717
    const-string/jumbo v3, "preference"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_57

    .line 718
    invoke-direct {p0, v0}, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->readPreference(Lorg/xmlpull/v1/XmlPullParser;)V
    :try_end_41
    .catch Ljava/io/IOException; {:try_start_1a .. :try_end_41} :catch_42
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_1a .. :try_end_41} :catch_42
    .catchall {:try_start_1a .. :try_end_41} :catchall_5b

    goto :goto_2a

    .line 723
    :catch_42
    move-exception v0

    .line 724
    :goto_43
    :try_start_43
    sget-object v2, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->TAG:Ljava/lang/String;

    const-string/jumbo v3, "Failed to read single-user settings"

    invoke-static {v2, v3, v0}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_4b
    .catchall {:try_start_43 .. :try_end_4b} :catchall_5b

    .line 726
    invoke-static {v1}, Llibcore/io/IoUtils;->closeQuietly(Ljava/lang/AutoCloseable;)V

    .line 729
    :goto_4e
    invoke-direct {p0}, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->scheduleWriteSettingsLocked()V

    .line 732
    sget-object v0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->sSingleUserSettingsFile:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 734
    :cond_56
    return-void

    .line 720
    :cond_57
    :try_start_57
    invoke-static {v0}, Lcom/android/internal/util/XmlUtils;->nextElement(Lorg/xmlpull/v1/XmlPullParser;)V
    :try_end_5a
    .catch Ljava/io/IOException; {:try_start_57 .. :try_end_5a} :catch_42
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_57 .. :try_end_5a} :catch_42
    .catchall {:try_start_57 .. :try_end_5a} :catchall_5b

    goto :goto_2a

    .line 725
    :catchall_5b
    move-exception v0

    .line 726
    :goto_5c
    invoke-static {v1}, Llibcore/io/IoUtils;->closeQuietly(Ljava/lang/AutoCloseable;)V

    .line 725
    throw v0

    .line 726
    :cond_60
    invoke-static {v1}, Llibcore/io/IoUtils;->closeQuietly(Ljava/lang/AutoCloseable;)V

    goto :goto_4e

    .line 725
    :catchall_64
    move-exception v0

    move-object v1, v2

    goto :goto_5c

    .line 723
    :catch_67
    move-exception v0

    move-object v1, v2

    goto :goto_43
.end method


# virtual methods
.method public accessoryAttached(Landroid/hardware/usb/UsbAccessory;)V
    .registers 8

    .prologue
    .line 1106
    new-instance v1, Landroid/content/Intent;

    const-string/jumbo v0, "android.hardware.usb.action.USB_ACCESSORY_ATTACHED"

    invoke-direct {v1, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1107
    const-string/jumbo v0, "accessory"

    invoke-virtual {v1, v0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 1109
    const/high16 v0, 0x11000000

    .line 1108
    invoke-virtual {v1, v0}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 1114
    iget-object v4, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->mLock:Ljava/lang/Object;

    monitor-enter v4

    .line 1115
    :try_start_16
    invoke-direct {p0, p1, v1}, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->getAccessoryMatchesLocked(Landroid/hardware/usb/UsbAccessory;Landroid/content/Intent;)Ljava/util/ArrayList;

    move-result-object v2

    .line 1117
    iget-object v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->mAccessoryPreferenceMap:Ljava/util/HashMap;

    new-instance v3, Lcom/android/server/usb/UsbProfileGroupSettingsManager$AccessoryFilter;

    invoke-direct {v3, p1}, Lcom/android/server/usb/UsbProfileGroupSettingsManager$AccessoryFilter;-><init>(Landroid/hardware/usb/UsbAccessory;)V

    invoke-virtual {v0, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$UserPackage;

    .line 1116
    invoke-direct {p0, v2, v0}, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->getDefaultActivityLocked(Ljava/util/ArrayList;Lcom/android/server/usb/UsbProfileGroupSettingsManager$UserPackage;)Landroid/content/pm/ActivityInfo;
    :try_end_2a
    .catchall {:try_start_16 .. :try_end_2a} :catchall_33

    move-result-object v3

    monitor-exit v4

    .line 1120
    const/4 v4, 0x0

    move-object v0, p0

    move-object v5, p1

    invoke-direct/range {v0 .. v5}, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->resolveActivity(Landroid/content/Intent;Ljava/util/ArrayList;Landroid/content/pm/ActivityInfo;Landroid/hardware/usb/UsbDevice;Landroid/hardware/usb/UsbAccessory;)V

    .line 1121
    return-void

    .line 1114
    :catchall_33
    move-exception v0

    monitor-exit v4

    throw v0
.end method

.method clearDefaults(Ljava/lang/String;Landroid/os/UserHandle;)V
    .registers 5

    .prologue
    .line 1465
    new-instance v0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$UserPackage;

    const/4 v1, 0x0

    invoke-direct {v0, p1, p2, v1}, Lcom/android/server/usb/UsbProfileGroupSettingsManager$UserPackage;-><init>(Ljava/lang/String;Landroid/os/UserHandle;Lcom/android/server/usb/UsbProfileGroupSettingsManager$UserPackage;)V

    .line 1467
    iget-object v1, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 1468
    :try_start_9
    invoke-direct {p0, v0}, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->clearPackageDefaultsLocked(Lcom/android/server/usb/UsbProfileGroupSettingsManager$UserPackage;)Z

    move-result v0

    if-eqz v0, :cond_12

    .line 1469
    invoke-direct {p0}, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->scheduleWriteSettingsLocked()V
    :try_end_12
    .catchall {:try_start_9 .. :try_end_12} :catchall_14

    :cond_12
    monitor-exit v1

    .line 1472
    return-void

    .line 1467
    :catchall_14
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public deviceAttached(Landroid/hardware/usb/UsbDevice;)V
    .registers 5

    .prologue
    .line 1039
    invoke-static {p1}, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->createDeviceAttachedIntent(Landroid/hardware/usb/UsbDevice;)Landroid/content/Intent;

    move-result-object v0

    .line 1042
    iget-object v1, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->mContext:Landroid/content/Context;

    sget-object v2, Landroid/os/UserHandle;->ALL:Landroid/os/UserHandle;

    invoke-virtual {v1, v0, v2}, Landroid/content/Context;->sendBroadcastAsUser(Landroid/content/Intent;Landroid/os/UserHandle;)V

    .line 1044
    const/4 v1, 0x1

    invoke-direct {p0, v0, p1, v1}, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->resolveActivity(Landroid/content/Intent;Landroid/hardware/usb/UsbDevice;Z)V

    .line 1045
    return-void
.end method

.method public deviceAttachedForFixedHandler(Landroid/hardware/usb/UsbDevice;Landroid/content/ComponentName;)V
    .registers 8

    .prologue
    .line 1068
    invoke-static {p1}, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->createDeviceAttachedIntent(Landroid/hardware/usb/UsbDevice;)Landroid/content/Intent;

    move-result-object v0

    .line 1071
    iget-object v1, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->mContext:Landroid/content/Context;

    invoke-virtual {v1, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 1076
    :try_start_9
    iget-object v1, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->mPackageManager:Landroid/content/pm/PackageManager;

    invoke-virtual {p2}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v2

    .line 1077
    iget-object v3, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->mParentUser:Landroid/os/UserHandle;

    invoke-virtual {v3}, Landroid/os/UserHandle;->getIdentifier()I

    move-result v3

    .line 1076
    const/4 v4, 0x0

    invoke-virtual {v1, v2, v4, v3}, Landroid/content/pm/PackageManager;->getApplicationInfoAsUser(Ljava/lang/String;II)Landroid/content/pm/ApplicationInfo;
    :try_end_19
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_9 .. :try_end_19} :catch_3b

    move-result-object v1

    .line 1084
    iget-object v2, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->mSettingsManager:Lcom/android/server/usb/UsbSettingsManager;

    iget v3, v1, Landroid/content/pm/ApplicationInfo;->uid:I

    invoke-static {v3}, Landroid/os/UserHandle;->getUserId(I)I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/android/server/usb/UsbSettingsManager;->getSettingsForUser(I)Lcom/android/server/usb/UsbUserSettingsManager;

    move-result-object v2

    .line 1085
    iget v1, v1, Landroid/content/pm/ApplicationInfo;->uid:I

    .line 1084
    invoke-virtual {v2, p1, v1}, Lcom/android/server/usb/UsbUserSettingsManager;->grantDevicePermission(Landroid/hardware/usb/UsbDevice;I)V

    .line 1087
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1, v0}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    .line 1088
    invoke-virtual {v1, p2}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 1090
    :try_start_33
    iget-object v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->mParentUser:Landroid/os/UserHandle;

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->startActivityAsUser(Landroid/content/Intent;Landroid/os/UserHandle;)V
    :try_end_3a
    .catch Landroid/content/ActivityNotFoundException; {:try_start_33 .. :try_end_3a} :catch_67

    .line 1094
    :goto_3a
    return-void

    .line 1078
    :catch_3b
    move-exception v0

    .line 1079
    sget-object v0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Default USB handling package ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p2}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 1080
    const-string/jumbo v2, ") not found  for user "

    .line 1079
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 1080
    iget-object v2, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->mParentUser:Landroid/os/UserHandle;

    .line 1079
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1081
    return-void

    .line 1091
    :catch_67
    move-exception v0

    .line 1092
    sget-object v0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "unable to start activity "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_3a
.end method

.method public dump(Lcom/android/internal/util/IndentingPrintWriter;)V
    .registers 7

    .prologue
    .line 1512
    iget-object v1, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 1513
    :try_start_3
    const-string/jumbo v0, "Device preferences:"

    invoke-virtual {p1, v0}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V

    .line 1514
    iget-object v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->mDevicePreferenceMap:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_13
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4b

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;

    .line 1515
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "  "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, ": "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->mDevicePreferenceMap:Ljava/util/HashMap;

    invoke-virtual {v4, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V
    :try_end_47
    .catchall {:try_start_3 .. :try_end_47} :catchall_48

    goto :goto_13

    .line 1512
    :catchall_48
    move-exception v0

    monitor-exit v1

    throw v0

    .line 1517
    :cond_4b
    :try_start_4b
    const-string/jumbo v0, "Accessory preferences:"

    invoke-virtual {p1, v0}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V

    .line 1518
    iget-object v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->mAccessoryPreferenceMap:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_5b
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_90

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$AccessoryFilter;

    .line 1519
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "  "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, ": "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->mAccessoryPreferenceMap:Ljava/util/HashMap;

    invoke-virtual {v4, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V
    :try_end_8f
    .catchall {:try_start_4b .. :try_end_8f} :catchall_48

    goto :goto_5b

    :cond_90
    monitor-exit v1

    .line 1522
    return-void
.end method

.method hasDefaults(Ljava/lang/String;Landroid/os/UserHandle;)Z
    .registers 6

    .prologue
    .line 1451
    new-instance v0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$UserPackage;

    const/4 v1, 0x0

    invoke-direct {v0, p1, p2, v1}, Lcom/android/server/usb/UsbProfileGroupSettingsManager$UserPackage;-><init>(Ljava/lang/String;Landroid/os/UserHandle;Lcom/android/server/usb/UsbProfileGroupSettingsManager$UserPackage;)V

    .line 1452
    iget-object v1, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 1453
    :try_start_9
    iget-object v2, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->mDevicePreferenceMap:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2, v0}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z
    :try_end_12
    .catchall {:try_start_9 .. :try_end_12} :catchall_24

    move-result v2

    if-eqz v2, :cond_18

    const/4 v0, 0x1

    monitor-exit v1

    return v0

    .line 1454
    :cond_18
    :try_start_18
    iget-object v2, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->mAccessoryPreferenceMap:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2, v0}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z
    :try_end_21
    .catchall {:try_start_18 .. :try_end_21} :catchall_24

    move-result v0

    monitor-exit v1

    return v0

    .line 1452
    :catchall_24
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method synthetic lambda$-com_android_server_usb_UsbProfileGroupSettingsManager_25456(Landroid/hardware/usb/UsbDevice;)V
    .registers 4

    .prologue
    .line 625
    invoke-static {p1}, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->createDeviceAttachedIntent(Landroid/hardware/usb/UsbDevice;)Landroid/content/Intent;

    move-result-object v0

    .line 626
    const/4 v1, 0x0

    .line 625
    invoke-direct {p0, v0, p1, v1}, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->resolveActivity(Landroid/content/Intent;Landroid/hardware/usb/UsbDevice;Z)V

    return-void
.end method

.method synthetic lambda$-com_android_server_usb_UsbProfileGroupSettingsManager_31409()V
    .registers 9

    .prologue
    const/4 v1, 0x0

    .line 783
    iget-object v3, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->mLock:Ljava/lang/Object;

    monitor-enter v3

    .line 786
    :try_start_4
    iget-object v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->mSettingsFile:Landroid/util/AtomicFile;

    invoke-virtual {v0}, Landroid/util/AtomicFile;->startWrite()Ljava/io/FileOutputStream;
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_9} :catch_fc
    .catchall {:try_start_4 .. :try_end_9} :catchall_e9

    move-result-object v2

    .line 788
    :try_start_a
    new-instance v4, Lcom/android/internal/util/FastXmlSerializer;

    invoke-direct {v4}, Lcom/android/internal/util/FastXmlSerializer;-><init>()V

    .line 789
    sget-object v0, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v0}, Ljava/nio/charset/Charset;->name()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v2, v0}, Lcom/android/internal/util/FastXmlSerializer;->setOutput(Ljava/io/OutputStream;Ljava/lang/String;)V

    .line 790
    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v4, v1, v0}, Lcom/android/internal/util/FastXmlSerializer;->startDocument(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 791
    const-string/jumbo v0, "http://xmlpull.org/v1/doc/features.html#indent-output"

    .line 792
    const/4 v1, 0x1

    .line 791
    invoke-virtual {v4, v0, v1}, Lcom/android/internal/util/FastXmlSerializer;->setFeature(Ljava/lang/String;Z)V

    .line 793
    const-string/jumbo v0, "settings"

    const/4 v1, 0x0

    invoke-virtual {v4, v1, v0}, Lcom/android/internal/util/FastXmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 795
    iget-object v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->mDevicePreferenceMap:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_39
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_97

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;

    .line 796
    const-string/jumbo v1, "preference"

    const/4 v6, 0x0

    invoke-virtual {v4, v6, v1}, Lcom/android/internal/util/FastXmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 797
    const-string/jumbo v6, "package"

    .line 798
    iget-object v1, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->mDevicePreferenceMap:Ljava/util/HashMap;

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/server/usb/UsbProfileGroupSettingsManager$UserPackage;

    iget-object v1, v1, Lcom/android/server/usb/UsbProfileGroupSettingsManager$UserPackage;->packageName:Ljava/lang/String;

    .line 797
    const/4 v7, 0x0

    invoke-virtual {v4, v7, v6, v1}, Lcom/android/internal/util/FastXmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 799
    const-string/jumbo v6, "user"

    .line 800
    iget-object v1, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->mDevicePreferenceMap:Ljava/util/HashMap;

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/server/usb/UsbProfileGroupSettingsManager$UserPackage;

    iget-object v1, v1, Lcom/android/server/usb/UsbProfileGroupSettingsManager$UserPackage;->user:Landroid/os/UserHandle;

    invoke-direct {p0, v1}, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->getSerial(Landroid/os/UserHandle;)I

    move-result v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    .line 799
    const/4 v7, 0x0

    invoke-virtual {v4, v7, v6, v1}, Lcom/android/internal/util/FastXmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 801
    invoke-virtual {v0, v4}, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->write(Lorg/xmlpull/v1/XmlSerializer;)V

    .line 802
    const-string/jumbo v0, "preference"

    const/4 v1, 0x0

    invoke-virtual {v4, v1, v0}, Lcom/android/internal/util/FastXmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;
    :try_end_80
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_80} :catch_81
    .catchall {:try_start_a .. :try_end_80} :catchall_e9

    goto :goto_39

    .line 819
    :catch_81
    move-exception v0

    move-object v1, v2

    .line 820
    :goto_83
    :try_start_83
    sget-object v2, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->TAG:Ljava/lang/String;

    const-string/jumbo v4, "Failed to write settings"

    invoke-static {v2, v4, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 821
    if-eqz v1, :cond_92

    .line 822
    iget-object v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->mSettingsFile:Landroid/util/AtomicFile;

    invoke-virtual {v0, v1}, Landroid/util/AtomicFile;->failWrite(Ljava/io/FileOutputStream;)V

    .line 826
    :cond_92
    :goto_92
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->mIsWriteSettingsScheduled:Z
    :try_end_95
    .catchall {:try_start_83 .. :try_end_95} :catchall_e9

    monitor-exit v3

    return-void

    .line 805
    :cond_97
    :try_start_97
    iget-object v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->mAccessoryPreferenceMap:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_a1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_ec

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$AccessoryFilter;

    .line 806
    const-string/jumbo v1, "preference"

    const/4 v6, 0x0

    invoke-virtual {v4, v6, v1}, Lcom/android/internal/util/FastXmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 807
    const-string/jumbo v6, "package"

    .line 808
    iget-object v1, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->mAccessoryPreferenceMap:Ljava/util/HashMap;

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/server/usb/UsbProfileGroupSettingsManager$UserPackage;

    iget-object v1, v1, Lcom/android/server/usb/UsbProfileGroupSettingsManager$UserPackage;->packageName:Ljava/lang/String;

    .line 807
    const/4 v7, 0x0

    invoke-virtual {v4, v7, v6, v1}, Lcom/android/internal/util/FastXmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 809
    const-string/jumbo v6, "user"

    .line 810
    iget-object v1, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->mAccessoryPreferenceMap:Ljava/util/HashMap;

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/server/usb/UsbProfileGroupSettingsManager$UserPackage;

    iget-object v1, v1, Lcom/android/server/usb/UsbProfileGroupSettingsManager$UserPackage;->user:Landroid/os/UserHandle;

    invoke-direct {p0, v1}, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->getSerial(Landroid/os/UserHandle;)I

    move-result v1

    .line 809
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    const/4 v7, 0x0

    invoke-virtual {v4, v7, v6, v1}, Lcom/android/internal/util/FastXmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 811
    invoke-virtual {v0, v4}, Lcom/android/server/usb/UsbProfileGroupSettingsManager$AccessoryFilter;->write(Lorg/xmlpull/v1/XmlSerializer;)V

    .line 812
    const-string/jumbo v0, "preference"

    const/4 v1, 0x0

    invoke-virtual {v4, v1, v0}, Lcom/android/internal/util/FastXmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;
    :try_end_e8
    .catch Ljava/io/IOException; {:try_start_97 .. :try_end_e8} :catch_81
    .catchall {:try_start_97 .. :try_end_e8} :catchall_e9

    goto :goto_a1

    .line 783
    :catchall_e9
    move-exception v0

    monitor-exit v3

    throw v0

    .line 815
    :cond_ec
    :try_start_ec
    const-string/jumbo v0, "settings"

    const/4 v1, 0x0

    invoke-virtual {v4, v1, v0}, Lcom/android/internal/util/FastXmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 816
    invoke-virtual {v4}, Lcom/android/internal/util/FastXmlSerializer;->endDocument()V

    .line 818
    iget-object v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->mSettingsFile:Landroid/util/AtomicFile;

    invoke-virtual {v0, v2}, Landroid/util/AtomicFile;->finishWrite(Ljava/io/FileOutputStream;)V
    :try_end_fb
    .catch Ljava/io/IOException; {:try_start_ec .. :try_end_fb} :catch_81
    .catchall {:try_start_ec .. :try_end_fb} :catchall_e9

    goto :goto_92

    .line 819
    :catch_fc
    move-exception v0

    goto :goto_83
.end method

.method removeAllDefaultsForUser(Landroid/os/UserHandle;)V
    .registers 7

    .prologue
    const/4 v1, 0x1

    .line 635
    iget-object v3, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->mLock:Ljava/lang/Object;

    monitor-enter v3

    .line 636
    const/4 v2, 0x0

    .line 637
    :try_start_5
    iget-object v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->mDevicePreferenceMap:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .line 639
    :goto_f
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2f

    .line 640
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 642
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$UserPackage;

    iget-object v0, v0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$UserPackage;->user:Landroid/os/UserHandle;

    invoke-virtual {v0, p1}, Landroid/os/UserHandle;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_65

    .line 643
    invoke-interface {v4}, Ljava/util/Iterator;->remove()V

    move v0, v1

    :goto_2d
    move v2, v0

    goto :goto_f

    .line 649
    :cond_2f
    iget-object v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->mAccessoryPreferenceMap:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .line 650
    :goto_39
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_59

    .line 651
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 653
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$UserPackage;

    iget-object v0, v0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$UserPackage;->user:Landroid/os/UserHandle;

    invoke-virtual {v0, p1}, Landroid/os/UserHandle;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_63

    .line 654
    invoke-interface {v4}, Ljava/util/Iterator;->remove()V

    move v0, v1

    :goto_57
    move v2, v0

    goto :goto_39

    .line 659
    :cond_59
    if-eqz v2, :cond_5e

    .line 660
    invoke-direct {p0}, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->scheduleWriteSettingsLocked()V
    :try_end_5e
    .catchall {:try_start_5 .. :try_end_5e} :catchall_60

    :cond_5e
    monitor-exit v3

    .line 663
    return-void

    .line 635
    :catchall_60
    move-exception v0

    monitor-exit v3

    throw v0

    :cond_63
    move v0, v2

    goto :goto_57

    :cond_65
    move v0, v2

    goto :goto_2d
.end method

.method setAccessoryPackage(Landroid/hardware/usb/UsbAccessory;Ljava/lang/String;Landroid/os/UserHandle;)V
    .registers 9

    .prologue
    .line 1423
    new-instance v1, Lcom/android/server/usb/UsbProfileGroupSettingsManager$AccessoryFilter;

    invoke-direct {v1, p1}, Lcom/android/server/usb/UsbProfileGroupSettingsManager$AccessoryFilter;-><init>(Landroid/hardware/usb/UsbAccessory;)V

    .line 1425
    iget-object v2, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->mLock:Ljava/lang/Object;

    monitor-enter v2

    .line 1426
    if-nez p2, :cond_1c

    .line 1427
    :try_start_a
    iget-object v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->mAccessoryPreferenceMap:Ljava/util/HashMap;

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_1a

    const/4 v0, 0x1

    .line 1436
    :cond_13
    :goto_13
    if-eqz v0, :cond_18

    .line 1437
    invoke-direct {p0}, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->scheduleWriteSettingsLocked()V
    :try_end_18
    .catchall {:try_start_a .. :try_end_18} :catchall_36

    :cond_18
    monitor-exit v2

    .line 1440
    return-void

    .line 1427
    :cond_1a
    const/4 v0, 0x0

    goto :goto_13

    .line 1429
    :cond_1c
    :try_start_1c
    new-instance v3, Lcom/android/server/usb/UsbProfileGroupSettingsManager$UserPackage;

    const/4 v0, 0x0

    invoke-direct {v3, p2, p3, v0}, Lcom/android/server/usb/UsbProfileGroupSettingsManager$UserPackage;-><init>(Ljava/lang/String;Landroid/os/UserHandle;Lcom/android/server/usb/UsbProfileGroupSettingsManager$UserPackage;)V

    .line 1431
    iget-object v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->mAccessoryPreferenceMap:Ljava/util/HashMap;

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v3, v0}, Lcom/android/server/usb/UsbProfileGroupSettingsManager$UserPackage;->equals(Ljava/lang/Object;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    .line 1432
    if-eqz v0, :cond_13

    .line 1433
    iget-object v4, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->mAccessoryPreferenceMap:Ljava/util/HashMap;

    invoke-virtual {v4, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_35
    .catchall {:try_start_1c .. :try_end_35} :catchall_36

    goto :goto_13

    .line 1425
    :catchall_36
    move-exception v0

    monitor-exit v2

    throw v0
.end method

.method setDevicePackage(Landroid/hardware/usb/UsbDevice;Ljava/lang/String;Landroid/os/UserHandle;)V
    .registers 9

    .prologue
    .line 1395
    new-instance v1, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;

    invoke-direct {v1, p1}, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;-><init>(Landroid/hardware/usb/UsbDevice;)V

    .line 1397
    iget-object v2, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->mLock:Ljava/lang/Object;

    monitor-enter v2

    .line 1398
    if-nez p2, :cond_1c

    .line 1399
    :try_start_a
    iget-object v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->mDevicePreferenceMap:Ljava/util/HashMap;

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_1a

    const/4 v0, 0x1

    .line 1408
    :cond_13
    :goto_13
    if-eqz v0, :cond_18

    .line 1409
    invoke-direct {p0}, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->scheduleWriteSettingsLocked()V
    :try_end_18
    .catchall {:try_start_a .. :try_end_18} :catchall_36

    :cond_18
    monitor-exit v2

    .line 1412
    return-void

    .line 1399
    :cond_1a
    const/4 v0, 0x0

    goto :goto_13

    .line 1401
    :cond_1c
    :try_start_1c
    new-instance v3, Lcom/android/server/usb/UsbProfileGroupSettingsManager$UserPackage;

    const/4 v0, 0x0

    invoke-direct {v3, p2, p3, v0}, Lcom/android/server/usb/UsbProfileGroupSettingsManager$UserPackage;-><init>(Ljava/lang/String;Landroid/os/UserHandle;Lcom/android/server/usb/UsbProfileGroupSettingsManager$UserPackage;)V

    .line 1403
    iget-object v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->mDevicePreferenceMap:Ljava/util/HashMap;

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v3, v0}, Lcom/android/server/usb/UsbProfileGroupSettingsManager$UserPackage;->equals(Ljava/lang/Object;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    .line 1404
    if-eqz v0, :cond_13

    .line 1405
    iget-object v4, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->mDevicePreferenceMap:Ljava/util/HashMap;

    invoke-virtual {v4, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_35
    .catchall {:try_start_1c .. :try_end_35} :catchall_36

    goto :goto_13

    .line 1397
    :catchall_36
    move-exception v0

    monitor-exit v2

    throw v0
.end method

.method usbDeviceRemoved(Landroid/hardware/usb/UsbDevice;)V
    .registers 4

    .prologue
    .line 1102
    iget-object v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->mMtpNotificationManager:Lcom/android/server/usb/MtpNotificationManager;

    invoke-virtual {p1}, Landroid/hardware/usb/UsbDevice;->getDeviceId()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/android/server/usb/MtpNotificationManager;->hideNotification(I)V

    .line 1103
    return-void
.end method
