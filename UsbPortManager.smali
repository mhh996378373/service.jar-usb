.class public Lcom/android/server/usb/UsbPortManager;
.super Ljava/lang/Object;
.source "UsbPortManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/server/usb/UsbPortManager$1;,
        Lcom/android/server/usb/UsbPortManager$DeathRecipient;,
        Lcom/android/server/usb/UsbPortManager$HALCallback;,
        Lcom/android/server/usb/UsbPortManager$PortInfo;,
        Lcom/android/server/usb/UsbPortManager$RawPortInfo;,
        Lcom/android/server/usb/UsbPortManager$ServiceNotification;
    }
.end annotation


# static fields
.field private static final COMBO_SINK_DEVICE:I

.field private static final COMBO_SINK_HOST:I

.field private static final COMBO_SOURCE_DEVICE:I

.field private static final COMBO_SOURCE_HOST:I

.field private static final MSG_UPDATE_PORTS:I = 0x1

.field private static final PORT_INFO:Ljava/lang/String; = "port_info"

.field private static final TAG:Ljava/lang/String; = "UsbPortManager"

.field private static final USB_HAL_DEATH_COOKIE:I = 0x3e8


# instance fields
.field private final mContext:Landroid/content/Context;

.field private mHALCallback:Lcom/android/server/usb/UsbPortManager$HALCallback;

.field private final mHandler:Landroid/os/Handler;

.field private final mLock:Ljava/lang/Object;

.field private final mPorts:Landroid/util/ArrayMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/ArrayMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/android/server/usb/UsbPortManager$PortInfo;",
            ">;"
        }
    .end annotation
.end field

.field private mProxy:Landroid/hardware/usb/V1_0/IUsb;
    .annotation build Lcom/android/internal/annotations/GuardedBy;
        value = "mLock"
    .end annotation
.end field

.field private final mSimulatedPorts:Landroid/util/ArrayMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/ArrayMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/android/server/usb/UsbPortManager$RawPortInfo;",
            ">;"
        }
    .end annotation
.end field

.field private mSystemReady:Z


# direct methods
.method static synthetic -get0(Lcom/android/server/usb/UsbPortManager;)Landroid/os/Handler;
    .registers 2

    iget-object v0, p0, Lcom/android/server/usb/UsbPortManager;->mHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic -get1(Lcom/android/server/usb/UsbPortManager;)Ljava/lang/Object;
    .registers 2

    iget-object v0, p0, Lcom/android/server/usb/UsbPortManager;->mLock:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic -get2(Lcom/android/server/usb/UsbPortManager;)Z
    .registers 2

    iget-boolean v0, p0, Lcom/android/server/usb/UsbPortManager;->mSystemReady:Z

    return v0
.end method

.method static synthetic -set0(Lcom/android/server/usb/UsbPortManager;Landroid/hardware/usb/V1_0/IUsb;)Landroid/hardware/usb/V1_0/IUsb;
    .registers 2

    iput-object p1, p0, Lcom/android/server/usb/UsbPortManager;->mProxy:Landroid/hardware/usb/V1_0/IUsb;

    return-object p1
.end method

.method static synthetic -wrap0(Lcom/android/server/usb/UsbPortManager;Lcom/android/internal/util/IndentingPrintWriter;)V
    .registers 2

    invoke-direct {p0, p1}, Lcom/android/server/usb/UsbPortManager;->connectToProxy(Lcom/android/internal/util/IndentingPrintWriter;)V

    return-void
.end method

.method static synthetic -wrap1(ILcom/android/internal/util/IndentingPrintWriter;Ljava/lang/String;)V
    .registers 3

    invoke-static {p0, p1, p2}, Lcom/android/server/usb/UsbPortManager;->logAndPrint(ILcom/android/internal/util/IndentingPrintWriter;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic -wrap2(Lcom/android/server/usb/UsbPortManager;Lcom/android/internal/util/IndentingPrintWriter;Ljava/util/ArrayList;)V
    .registers 3

    invoke-direct {p0, p1, p2}, Lcom/android/server/usb/UsbPortManager;->updatePortsLocked(Lcom/android/internal/util/IndentingPrintWriter;Ljava/util/ArrayList;)V

    return-void
.end method

.method static constructor <clinit>()V
    .registers 3

    .prologue
    const/4 v2, 0x2

    const/4 v1, 0x1

    .line 71
    invoke-static {v1, v1}, Landroid/hardware/usb/UsbPort;->combineRolesAsBit(II)I

    move-result v0

    .line 70
    sput v0, Lcom/android/server/usb/UsbPortManager;->COMBO_SOURCE_HOST:I

    .line 73
    invoke-static {v1, v2}, Landroid/hardware/usb/UsbPort;->combineRolesAsBit(II)I

    move-result v0

    .line 72
    sput v0, Lcom/android/server/usb/UsbPortManager;->COMBO_SOURCE_DEVICE:I

    .line 75
    invoke-static {v2, v1}, Landroid/hardware/usb/UsbPort;->combineRolesAsBit(II)I

    move-result v0

    .line 74
    sput v0, Lcom/android/server/usb/UsbPortManager;->COMBO_SINK_HOST:I

    .line 77
    invoke-static {v2, v2}, Landroid/hardware/usb/UsbPort;->combineRolesAsBit(II)I

    move-result v0

    .line 76
    sput v0, Lcom/android/server/usb/UsbPortManager;->COMBO_SINK_DEVICE:I

    .line 64
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 7

    .prologue
    const/4 v4, 0x0

    .line 113
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 84
    iput-object v4, p0, Lcom/android/server/usb/UsbPortManager;->mProxy:Landroid/hardware/usb/V1_0/IUsb;

    .line 88
    new-instance v0, Lcom/android/server/usb/UsbPortManager$HALCallback;

    invoke-direct {v0, v4, p0}, Lcom/android/server/usb/UsbPortManager$HALCallback;-><init>(Lcom/android/internal/util/IndentingPrintWriter;Lcom/android/server/usb/UsbPortManager;)V

    iput-object v0, p0, Lcom/android/server/usb/UsbPortManager;->mHALCallback:Lcom/android/server/usb/UsbPortManager$HALCallback;

    .line 101
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/android/server/usb/UsbPortManager;->mLock:Ljava/lang/Object;

    .line 107
    new-instance v0, Landroid/util/ArrayMap;

    invoke-direct {v0}, Landroid/util/ArrayMap;-><init>()V

    iput-object v0, p0, Lcom/android/server/usb/UsbPortManager;->mPorts:Landroid/util/ArrayMap;

    .line 111
    new-instance v0, Landroid/util/ArrayMap;

    invoke-direct {v0}, Landroid/util/ArrayMap;-><init>()V

    .line 110
    iput-object v0, p0, Lcom/android/server/usb/UsbPortManager;->mSimulatedPorts:Landroid/util/ArrayMap;

    .line 712
    new-instance v0, Lcom/android/server/usb/UsbPortManager$1;

    invoke-static {}, Lcom/android/server/FgThread;->get()Lcom/android/server/FgThread;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/server/FgThread;->getLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/android/server/usb/UsbPortManager$1;-><init>(Lcom/android/server/usb/UsbPortManager;Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/android/server/usb/UsbPortManager;->mHandler:Landroid/os/Handler;

    .line 114
    iput-object p1, p0, Lcom/android/server/usb/UsbPortManager;->mContext:Landroid/content/Context;

    .line 116
    :try_start_33
    new-instance v0, Lcom/android/server/usb/UsbPortManager$ServiceNotification;

    invoke-direct {v0, p0}, Lcom/android/server/usb/UsbPortManager$ServiceNotification;-><init>(Lcom/android/server/usb/UsbPortManager;)V

    .line 118
    invoke-static {}, Landroid/hidl/manager/V1_0/IServiceManager;->getService()Landroid/hidl/manager/V1_0/IServiceManager;

    move-result-object v1

    .line 119
    const-string/jumbo v2, "android.hardware.usb@1.0::IUsb"

    .line 120
    const-string/jumbo v3, ""

    .line 118
    invoke-interface {v1, v2, v3, v0}, Landroid/hidl/manager/V1_0/IServiceManager;->registerForNotifications(Ljava/lang/String;Ljava/lang/String;Landroid/hidl/manager/V1_0/IServiceNotification;)Z

    move-result v0

    .line 121
    if-nez v0, :cond_50

    .line 123
    const-string/jumbo v0, "Failed to register service start notification"

    .line 122
    const/4 v1, 0x6

    const/4 v2, 0x0

    invoke-static {v1, v2, v0}, Lcom/android/server/usb/UsbPortManager;->logAndPrint(ILcom/android/internal/util/IndentingPrintWriter;Ljava/lang/String;)V
    :try_end_50
    .catch Landroid/os/RemoteException; {:try_start_33 .. :try_end_50} :catch_54

    .line 130
    :cond_50
    invoke-direct {p0, v4}, Lcom/android/server/usb/UsbPortManager;->connectToProxy(Lcom/android/internal/util/IndentingPrintWriter;)V

    .line 131
    return-void

    .line 125
    :catch_54
    move-exception v0

    .line 127
    const-string/jumbo v1, "Failed to register service start notification"

    .line 126
    invoke-static {v4, v1, v0}, Lcom/android/server/usb/UsbPortManager;->logAndPrintException(Lcom/android/internal/util/IndentingPrintWriter;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 128
    return-void
.end method

.method private addOrUpdatePortLocked(Ljava/lang/String;IIZIZIZLcom/android/internal/util/IndentingPrintWriter;)V
    .registers 19

    .prologue
    .line 596
    and-int/lit8 v1, p2, 0x3

    const/4 v2, 0x3

    if-eq v1, v2, :cond_f1

    .line 597
    const/4 v3, 0x0

    .line 598
    if-eqz p3, :cond_73

    if-eq p3, p2, :cond_73

    .line 599
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Ignoring inconsistent current mode from USB port driver: supportedModes="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 600
    invoke-static {p2}, Landroid/hardware/usb/UsbPort;->modeToString(I)Ljava/lang/String;

    move-result-object v2

    .line 599
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 601
    const-string/jumbo v2, ", currentMode="

    .line 599
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 601
    invoke-static {p3}, Landroid/hardware/usb/UsbPort;->modeToString(I)Ljava/lang/String;

    move-result-object v2

    .line 599
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x5

    move-object/from16 v0, p9

    invoke-static {v2, v0, v1}, Lcom/android/server/usb/UsbPortManager;->logAndPrint(ILcom/android/internal/util/IndentingPrintWriter;Ljava/lang/String;)V

    .line 602
    const/4 p3, 0x0

    move v2, p3

    .line 609
    :goto_39
    move/from16 v0, p7

    invoke-static {p5, v0}, Landroid/hardware/usb/UsbPort;->combineRolesAsBit(II)I

    move-result v8

    .line 611
    if-eqz v2, :cond_55

    if-eqz p5, :cond_55

    if-eqz p7, :cond_55

    .line 612
    if-eqz p6, :cond_75

    if-eqz p8, :cond_75

    .line 616
    sget v1, Lcom/android/server/usb/UsbPortManager;->COMBO_SOURCE_HOST:I

    sget v4, Lcom/android/server/usb/UsbPortManager;->COMBO_SOURCE_DEVICE:I

    or-int/2addr v1, v4

    .line 617
    sget v4, Lcom/android/server/usb/UsbPortManager;->COMBO_SINK_HOST:I

    .line 616
    or-int/2addr v1, v4

    .line 617
    sget v4, Lcom/android/server/usb/UsbPortManager;->COMBO_SINK_DEVICE:I

    .line 616
    or-int/2addr v1, v4

    .line 615
    or-int/2addr v8, v1

    .line 641
    :cond_55
    :goto_55
    iget-object v1, p0, Lcom/android/server/usb/UsbPortManager;->mPorts:Landroid/util/ArrayMap;

    invoke-virtual {v1, p1}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/server/usb/UsbPortManager$PortInfo;

    .line 642
    if-nez v1, :cond_a2

    .line 643
    new-instance v1, Lcom/android/server/usb/UsbPortManager$PortInfo;

    invoke-direct {v1, p1, p2}, Lcom/android/server/usb/UsbPortManager$PortInfo;-><init>(Ljava/lang/String;I)V

    move v4, p5

    move v5, p6

    move/from16 v6, p7

    move/from16 v7, p8

    .line 644
    invoke-virtual/range {v1 .. v8}, Lcom/android/server/usb/UsbPortManager$PortInfo;->setStatus(IZIZIZI)Z

    .line 648
    iget-object v2, p0, Lcom/android/server/usb/UsbPortManager;->mPorts:Landroid/util/ArrayMap;

    invoke-virtual {v2, p1, v1}, Landroid/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 668
    :goto_72
    return-void

    :cond_73
    move v2, p3

    .line 598
    goto :goto_39

    .line 618
    :cond_75
    if-eqz p6, :cond_89

    .line 622
    const/4 v1, 0x1

    .line 621
    move/from16 v0, p7

    invoke-static {v1, v0}, Landroid/hardware/usb/UsbPort;->combineRolesAsBit(II)I

    move-result v1

    or-int/2addr v1, v8

    .line 624
    const/4 v4, 0x2

    .line 623
    move/from16 v0, p7

    invoke-static {v4, v0}, Landroid/hardware/usb/UsbPort;->combineRolesAsBit(II)I

    move-result v4

    or-int v8, v1, v4

    goto :goto_55

    .line 625
    :cond_89
    if-eqz p8, :cond_99

    .line 629
    const/4 v1, 0x1

    .line 628
    invoke-static {p5, v1}, Landroid/hardware/usb/UsbPort;->combineRolesAsBit(II)I

    move-result v1

    or-int/2addr v1, v8

    .line 631
    const/4 v4, 0x2

    .line 630
    invoke-static {p5, v4}, Landroid/hardware/usb/UsbPort;->combineRolesAsBit(II)I

    move-result v4

    or-int v8, v1, v4

    goto :goto_55

    .line 632
    :cond_99
    if-eqz v3, :cond_55

    .line 636
    sget v1, Lcom/android/server/usb/UsbPortManager;->COMBO_SOURCE_HOST:I

    sget v4, Lcom/android/server/usb/UsbPortManager;->COMBO_SINK_DEVICE:I

    or-int/2addr v1, v4

    or-int/2addr v8, v1

    goto :goto_55

    .line 651
    :cond_a2
    iget-object v4, v1, Lcom/android/server/usb/UsbPortManager$PortInfo;->mUsbPort:Landroid/hardware/usb/UsbPort;

    invoke-virtual {v4}, Landroid/hardware/usb/UsbPort;->getSupportedModes()I

    move-result v4

    if-eq p2, v4, :cond_dd

    .line 652
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "Ignoring inconsistent list of supported modes from USB port driver (should be immutable): previous="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 655
    iget-object v5, v1, Lcom/android/server/usb/UsbPortManager$PortInfo;->mUsbPort:Landroid/hardware/usb/UsbPort;

    invoke-virtual {v5}, Landroid/hardware/usb/UsbPort;->getSupportedModes()I

    move-result v5

    .line 654
    invoke-static {v5}, Landroid/hardware/usb/UsbPort;->modeToString(I)Ljava/lang/String;

    move-result-object v5

    .line 652
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 656
    const-string/jumbo v5, ", current="

    .line 652
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 656
    invoke-static {p2}, Landroid/hardware/usb/UsbPort;->modeToString(I)Ljava/lang/String;

    move-result-object v5

    .line 652
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x5

    move-object/from16 v0, p9

    invoke-static {v5, v0, v4}, Lcom/android/server/usb/UsbPortManager;->logAndPrint(ILcom/android/internal/util/IndentingPrintWriter;Ljava/lang/String;)V

    :cond_dd
    move v4, p5

    move v5, p6

    move/from16 v6, p7

    move/from16 v7, p8

    .line 659
    invoke-virtual/range {v1 .. v8}, Lcom/android/server/usb/UsbPortManager$PortInfo;->setStatus(IZIZIZI)Z

    move-result v2

    if-eqz v2, :cond_ed

    .line 663
    const/4 v2, 0x1

    iput v2, v1, Lcom/android/server/usb/UsbPortManager$PortInfo;->mDisposition:I

    goto :goto_72

    .line 665
    :cond_ed
    const/4 v2, 0x2

    iput v2, v1, Lcom/android/server/usb/UsbPortManager$PortInfo;->mDisposition:I

    goto :goto_72

    :cond_f1
    move v3, p4

    move v2, p3

    goto/16 :goto_39
.end method

.method private connectToProxy(Lcom/android/internal/util/IndentingPrintWriter;)V
    .registers 8

    .prologue
    .line 518
    iget-object v1, p0, Lcom/android/server/usb/UsbPortManager;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 519
    :try_start_3
    iget-object v0, p0, Lcom/android/server/usb/UsbPortManager;->mProxy:Landroid/hardware/usb/V1_0/IUsb;
    :try_end_5
    .catchall {:try_start_3 .. :try_end_5} :catchall_31

    if-eqz v0, :cond_9

    monitor-exit v1

    .line 520
    return-void

    .line 524
    :cond_9
    :try_start_9
    invoke-static {}, Landroid/hardware/usb/V1_0/IUsb;->getService()Landroid/hardware/usb/V1_0/IUsb;

    move-result-object v0

    iput-object v0, p0, Lcom/android/server/usb/UsbPortManager;->mProxy:Landroid/hardware/usb/V1_0/IUsb;

    .line 525
    iget-object v0, p0, Lcom/android/server/usb/UsbPortManager;->mProxy:Landroid/hardware/usb/V1_0/IUsb;

    new-instance v2, Lcom/android/server/usb/UsbPortManager$DeathRecipient;

    invoke-direct {v2, p0, p1}, Lcom/android/server/usb/UsbPortManager$DeathRecipient;-><init>(Lcom/android/server/usb/UsbPortManager;Lcom/android/internal/util/IndentingPrintWriter;)V

    const-wide/16 v4, 0x3e8

    invoke-interface {v0, v2, v4, v5}, Landroid/hardware/usb/V1_0/IUsb;->linkToDeath(Landroid/os/IHwBinder$DeathRecipient;J)Z

    .line 526
    iget-object v0, p0, Lcom/android/server/usb/UsbPortManager;->mProxy:Landroid/hardware/usb/V1_0/IUsb;

    iget-object v2, p0, Lcom/android/server/usb/UsbPortManager;->mHALCallback:Lcom/android/server/usb/UsbPortManager$HALCallback;

    invoke-interface {v0, v2}, Landroid/hardware/usb/V1_0/IUsb;->setCallback(Landroid/hardware/usb/V1_0/IUsbCallback;)V

    .line 527
    iget-object v0, p0, Lcom/android/server/usb/UsbPortManager;->mProxy:Landroid/hardware/usb/V1_0/IUsb;

    invoke-interface {v0}, Landroid/hardware/usb/V1_0/IUsb;->queryPortStatus()V
    :try_end_27
    .catch Ljava/util/NoSuchElementException; {:try_start_9 .. :try_end_27} :catch_34
    .catch Landroid/os/RemoteException; {:try_start_9 .. :try_end_27} :catch_29
    .catchall {:try_start_9 .. :try_end_27} :catchall_31

    :goto_27
    monitor-exit v1

    .line 535
    return-void

    .line 531
    :catch_29
    move-exception v0

    .line 532
    :try_start_2a
    const-string/jumbo v2, "connectToProxy: usb hal service not responding"

    invoke-static {p1, v2, v0}, Lcom/android/server/usb/UsbPortManager;->logAndPrintException(Lcom/android/internal/util/IndentingPrintWriter;Ljava/lang/String;Ljava/lang/Exception;)V
    :try_end_30
    .catchall {:try_start_2a .. :try_end_30} :catchall_31

    goto :goto_27

    .line 518
    :catchall_31
    move-exception v0

    monitor-exit v1

    throw v0

    .line 528
    :catch_34
    move-exception v0

    .line 529
    :try_start_35
    const-string/jumbo v2, "connectToProxy: usb hal service not found. Did the service fail to start?"

    invoke-static {p1, v2, v0}, Lcom/android/server/usb/UsbPortManager;->logAndPrintException(Lcom/android/internal/util/IndentingPrintWriter;Ljava/lang/String;Ljava/lang/Exception;)V
    :try_end_3b
    .catchall {:try_start_35 .. :try_end_3b} :catchall_31

    goto :goto_27
.end method

.method private handlePortAddedLocked(Lcom/android/server/usb/UsbPortManager$PortInfo;Lcom/android/internal/util/IndentingPrintWriter;)V
    .registers 5

    .prologue
    .line 671
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "USB port added: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x4

    invoke-static {v1, p2, v0}, Lcom/android/server/usb/UsbPortManager;->logAndPrint(ILcom/android/internal/util/IndentingPrintWriter;Ljava/lang/String;)V

    .line 672
    invoke-direct {p0, p1}, Lcom/android/server/usb/UsbPortManager;->sendPortChangedBroadcastLocked(Lcom/android/server/usb/UsbPortManager$PortInfo;)V

    .line 673
    return-void
.end method

.method private handlePortChangedLocked(Lcom/android/server/usb/UsbPortManager$PortInfo;Lcom/android/internal/util/IndentingPrintWriter;)V
    .registers 5

    .prologue
    .line 676
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "USB port changed: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x4

    invoke-static {v1, p2, v0}, Lcom/android/server/usb/UsbPortManager;->logAndPrint(ILcom/android/internal/util/IndentingPrintWriter;Ljava/lang/String;)V

    .line 677
    invoke-direct {p0, p1}, Lcom/android/server/usb/UsbPortManager;->sendPortChangedBroadcastLocked(Lcom/android/server/usb/UsbPortManager$PortInfo;)V

    .line 678
    return-void
.end method

.method private handlePortRemovedLocked(Lcom/android/server/usb/UsbPortManager$PortInfo;Lcom/android/internal/util/IndentingPrintWriter;)V
    .registers 5

    .prologue
    .line 681
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "USB port removed: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x4

    invoke-static {v1, p2, v0}, Lcom/android/server/usb/UsbPortManager;->logAndPrint(ILcom/android/internal/util/IndentingPrintWriter;Ljava/lang/String;)V

    .line 682
    invoke-direct {p0, p1}, Lcom/android/server/usb/UsbPortManager;->sendPortChangedBroadcastLocked(Lcom/android/server/usb/UsbPortManager$PortInfo;)V

    .line 683
    return-void
.end method

.method private static logAndPrint(ILcom/android/internal/util/IndentingPrintWriter;Ljava/lang/String;)V
    .registers 4

    .prologue
    .line 699
    const-string/jumbo v0, "UsbPortManager"

    invoke-static {p0, v0, p2}, Landroid/util/Slog;->println(ILjava/lang/String;Ljava/lang/String;)I

    .line 700
    if-eqz p1, :cond_b

    .line 701
    invoke-virtual {p1, p2}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V

    .line 703
    :cond_b
    return-void
.end method

.method private static logAndPrintException(Lcom/android/internal/util/IndentingPrintWriter;Ljava/lang/String;Ljava/lang/Exception;)V
    .registers 4

    .prologue
    .line 706
    const-string/jumbo v0, "UsbPortManager"

    invoke-static {v0, p1, p2}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 707
    if-eqz p0, :cond_1c

    .line 708
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V

    .line 710
    :cond_1c
    return-void
.end method

.method private sendPortChangedBroadcastLocked(Lcom/android/server/usb/UsbPortManager$PortInfo;)V
    .registers 5

    .prologue
    .line 686
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v1, "android.hardware.usb.action.USB_PORT_CHANGED"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 688
    const/high16 v1, 0x11000000

    .line 687
    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 690
    const-string/jumbo v1, "port"

    iget-object v2, p1, Lcom/android/server/usb/UsbPortManager$PortInfo;->mUsbPort:Landroid/hardware/usb/UsbPort;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 691
    const-string/jumbo v1, "portStatus"

    iget-object v2, p1, Lcom/android/server/usb/UsbPortManager$PortInfo;->mUsbPortStatus:Landroid/hardware/usb/UsbPortStatus;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 695
    iget-object v1, p0, Lcom/android/server/usb/UsbPortManager;->mHandler:Landroid/os/Handler;

    new-instance v2, Lcom/android/server/usb/-$Lambda$A9zkc-u4LaET6cVKd0uc6IuE4_s;

    invoke-direct {v2, p0, v0}, Lcom/android/server/usb/-$Lambda$A9zkc-u4LaET6cVKd0uc6IuE4_s;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 696
    return-void
.end method

.method private updatePortsLocked(Lcom/android/internal/util/IndentingPrintWriter;Ljava/util/ArrayList;)V
    .registers 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/internal/util/IndentingPrintWriter;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/server/usb/UsbPortManager$RawPortInfo;",
            ">;)V"
        }
    .end annotation

    .prologue
    const/4 v12, 0x2

    const/4 v1, 0x0

    .line 542
    iget-object v0, p0, Lcom/android/server/usb/UsbPortManager;->mPorts:Landroid/util/ArrayMap;

    invoke-virtual {v0}, Landroid/util/ArrayMap;->size()I

    move-result v0

    :goto_8
    add-int/lit8 v2, v0, -0x1

    if-lez v0, :cond_19

    .line 543
    iget-object v0, p0, Lcom/android/server/usb/UsbPortManager;->mPorts:Landroid/util/ArrayMap;

    invoke-virtual {v0, v2}, Landroid/util/ArrayMap;->valueAt(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/usb/UsbPortManager$PortInfo;

    const/4 v3, 0x3

    iput v3, v0, Lcom/android/server/usb/UsbPortManager$PortInfo;->mDisposition:I

    move v0, v2

    goto :goto_8

    .line 547
    :cond_19
    iget-object v0, p0, Lcom/android/server/usb/UsbPortManager;->mSimulatedPorts:Landroid/util/ArrayMap;

    invoke-virtual {v0}, Landroid/util/ArrayMap;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_4b

    .line 548
    iget-object v0, p0, Lcom/android/server/usb/UsbPortManager;->mSimulatedPorts:Landroid/util/ArrayMap;

    invoke-virtual {v0}, Landroid/util/ArrayMap;->size()I

    move-result v11

    move v10, v1

    .line 549
    :goto_28
    if-ge v10, v11, :cond_71

    .line 550
    iget-object v0, p0, Lcom/android/server/usb/UsbPortManager;->mSimulatedPorts:Landroid/util/ArrayMap;

    invoke-virtual {v0, v10}, Landroid/util/ArrayMap;->valueAt(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/usb/UsbPortManager$RawPortInfo;

    .line 551
    iget-object v1, v0, Lcom/android/server/usb/UsbPortManager$RawPortInfo;->portId:Ljava/lang/String;

    iget v2, v0, Lcom/android/server/usb/UsbPortManager$RawPortInfo;->supportedModes:I

    .line 552
    iget v3, v0, Lcom/android/server/usb/UsbPortManager$RawPortInfo;->currentMode:I

    iget-boolean v4, v0, Lcom/android/server/usb/UsbPortManager$RawPortInfo;->canChangeMode:Z

    .line 553
    iget v5, v0, Lcom/android/server/usb/UsbPortManager$RawPortInfo;->currentPowerRole:I

    iget-boolean v6, v0, Lcom/android/server/usb/UsbPortManager$RawPortInfo;->canChangePowerRole:Z

    .line 554
    iget v7, v0, Lcom/android/server/usb/UsbPortManager$RawPortInfo;->currentDataRole:I

    iget-boolean v8, v0, Lcom/android/server/usb/UsbPortManager$RawPortInfo;->canChangeDataRole:Z

    move-object v0, p0

    move-object v9, p1

    .line 551
    invoke-direct/range {v0 .. v9}, Lcom/android/server/usb/UsbPortManager;->addOrUpdatePortLocked(Ljava/lang/String;IIZIZIZLcom/android/internal/util/IndentingPrintWriter;)V

    .line 549
    add-int/lit8 v0, v10, 0x1

    move v10, v0

    goto :goto_28

    .line 557
    :cond_4b
    invoke-interface {p2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :goto_4f
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_71

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/usb/UsbPortManager$RawPortInfo;

    .line 558
    iget-object v1, v0, Lcom/android/server/usb/UsbPortManager$RawPortInfo;->portId:Ljava/lang/String;

    iget v2, v0, Lcom/android/server/usb/UsbPortManager$RawPortInfo;->supportedModes:I

    .line 559
    iget v3, v0, Lcom/android/server/usb/UsbPortManager$RawPortInfo;->currentMode:I

    iget-boolean v4, v0, Lcom/android/server/usb/UsbPortManager$RawPortInfo;->canChangeMode:Z

    .line 560
    iget v5, v0, Lcom/android/server/usb/UsbPortManager$RawPortInfo;->currentPowerRole:I

    iget-boolean v6, v0, Lcom/android/server/usb/UsbPortManager$RawPortInfo;->canChangePowerRole:Z

    .line 561
    iget v7, v0, Lcom/android/server/usb/UsbPortManager$RawPortInfo;->currentDataRole:I

    iget-boolean v8, v0, Lcom/android/server/usb/UsbPortManager$RawPortInfo;->canChangeDataRole:Z

    move-object v0, p0

    move-object v9, p1

    .line 558
    invoke-direct/range {v0 .. v9}, Lcom/android/server/usb/UsbPortManager;->addOrUpdatePortLocked(Ljava/lang/String;IIZIZIZLcom/android/internal/util/IndentingPrintWriter;)V

    goto :goto_4f

    .line 567
    :cond_71
    iget-object v0, p0, Lcom/android/server/usb/UsbPortManager;->mPorts:Landroid/util/ArrayMap;

    invoke-virtual {v0}, Landroid/util/ArrayMap;->size()I

    move-result v0

    :goto_77
    add-int/lit8 v1, v0, -0x1

    if-lez v0, :cond_a2

    .line 568
    iget-object v0, p0, Lcom/android/server/usb/UsbPortManager;->mPorts:Landroid/util/ArrayMap;

    invoke-virtual {v0, v1}, Landroid/util/ArrayMap;->valueAt(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/usb/UsbPortManager$PortInfo;

    .line 569
    iget v2, v0, Lcom/android/server/usb/UsbPortManager$PortInfo;->mDisposition:I

    packed-switch v2, :pswitch_data_a4

    :goto_88
    :pswitch_88  #0x2
    move v0, v1

    goto :goto_77

    .line 571
    :pswitch_8a  #0x0
    invoke-direct {p0, v0, p1}, Lcom/android/server/usb/UsbPortManager;->handlePortAddedLocked(Lcom/android/server/usb/UsbPortManager$PortInfo;Lcom/android/internal/util/IndentingPrintWriter;)V

    .line 572
    iput v12, v0, Lcom/android/server/usb/UsbPortManager$PortInfo;->mDisposition:I

    goto :goto_88

    .line 575
    :pswitch_90  #0x1
    invoke-direct {p0, v0, p1}, Lcom/android/server/usb/UsbPortManager;->handlePortChangedLocked(Lcom/android/server/usb/UsbPortManager$PortInfo;Lcom/android/internal/util/IndentingPrintWriter;)V

    .line 576
    iput v12, v0, Lcom/android/server/usb/UsbPortManager$PortInfo;->mDisposition:I

    goto :goto_88

    .line 579
    :pswitch_96  #0x3
    iget-object v2, p0, Lcom/android/server/usb/UsbPortManager;->mPorts:Landroid/util/ArrayMap;

    invoke-virtual {v2, v1}, Landroid/util/ArrayMap;->removeAt(I)Ljava/lang/Object;

    .line 580
    const/4 v2, 0x0

    iput-object v2, v0, Lcom/android/server/usb/UsbPortManager$PortInfo;->mUsbPortStatus:Landroid/hardware/usb/UsbPortStatus;

    .line 581
    invoke-direct {p0, v0, p1}, Lcom/android/server/usb/UsbPortManager;->handlePortRemovedLocked(Lcom/android/server/usb/UsbPortManager$PortInfo;Lcom/android/internal/util/IndentingPrintWriter;)V

    goto :goto_88

    .line 585
    :cond_a2
    return-void

    .line 569
    nop

    :pswitch_data_a4
    .packed-switch 0x0
        :pswitch_8a  #00000000
        :pswitch_90  #00000001
        :pswitch_88  #00000002
        :pswitch_96  #00000003
    .end packed-switch
.end method


# virtual methods
.method public addSimulatedPort(Ljava/lang/String;ILcom/android/internal/util/IndentingPrintWriter;)V
    .registers 7

    .prologue
    .line 298
    iget-object v1, p0, Lcom/android/server/usb/UsbPortManager;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 299
    :try_start_3
    iget-object v0, p0, Lcom/android/server/usb/UsbPortManager;->mSimulatedPorts:Landroid/util/ArrayMap;

    invoke-virtual {v0, p1}, Landroid/util/ArrayMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_13

    .line 300
    const-string/jumbo v0, "Port with same name already exists.  Please remove it first."

    invoke-virtual {p3, v0}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V
    :try_end_11
    .catchall {:try_start_3 .. :try_end_11} :catchall_49

    monitor-exit v1

    .line 301
    return-void

    .line 304
    :cond_13
    :try_start_13
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Adding simulated port: portId="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 305
    const-string/jumbo v2, ", supportedModes="

    .line 304
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 305
    invoke-static {p2}, Landroid/hardware/usb/UsbPort;->modeToString(I)Ljava/lang/String;

    move-result-object v2

    .line 304
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, v0}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V

    .line 306
    iget-object v0, p0, Lcom/android/server/usb/UsbPortManager;->mSimulatedPorts:Landroid/util/ArrayMap;

    .line 307
    new-instance v2, Lcom/android/server/usb/UsbPortManager$RawPortInfo;

    invoke-direct {v2, p1, p2}, Lcom/android/server/usb/UsbPortManager$RawPortInfo;-><init>(Ljava/lang/String;I)V

    .line 306
    invoke-virtual {v0, p1, v2}, Landroid/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 308
    const/4 v0, 0x0

    invoke-direct {p0, p3, v0}, Lcom/android/server/usb/UsbPortManager;->updatePortsLocked(Lcom/android/internal/util/IndentingPrintWriter;Ljava/util/ArrayList;)V
    :try_end_47
    .catchall {:try_start_13 .. :try_end_47} :catchall_49

    monitor-exit v1

    .line 310
    return-void

    .line 298
    :catchall_49
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public connectSimulatedPort(Ljava/lang/String;IZIZIZLcom/android/internal/util/IndentingPrintWriter;)V
    .registers 13

    .prologue
    .line 315
    iget-object v1, p0, Lcom/android/server/usb/UsbPortManager;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 316
    :try_start_3
    iget-object v0, p0, Lcom/android/server/usb/UsbPortManager;->mSimulatedPorts:Landroid/util/ArrayMap;

    invoke-virtual {v0, p1}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/usb/UsbPortManager$RawPortInfo;

    .line 317
    if-nez v0, :cond_15

    .line 318
    const-string/jumbo v0, "Cannot connect simulated port which does not exist."

    invoke-virtual {p8, v0}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V
    :try_end_13
    .catchall {:try_start_3 .. :try_end_13} :catchall_bc

    monitor-exit v1

    .line 319
    return-void

    .line 322
    :cond_15
    if-eqz p2, :cond_19

    if-nez p4, :cond_21

    .line 323
    :cond_19
    :try_start_19
    const-string/jumbo v0, "Cannot connect simulated port in null mode, power role, or data role."

    invoke-virtual {p8, v0}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V
    :try_end_1f
    .catchall {:try_start_19 .. :try_end_1f} :catchall_bc

    monitor-exit v1

    .line 325
    return-void

    .line 322
    :cond_21
    if-eqz p6, :cond_19

    .line 328
    :try_start_23
    iget v2, v0, Lcom/android/server/usb/UsbPortManager$RawPortInfo;->supportedModes:I

    and-int/2addr v2, p2

    if-nez v2, :cond_45

    .line 329
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Simulated port does not support mode: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p2}, Landroid/hardware/usb/UsbPort;->modeToString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p8, v0}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V
    :try_end_43
    .catchall {:try_start_23 .. :try_end_43} :catchall_bc

    monitor-exit v1

    .line 330
    return-void

    .line 333
    :cond_45
    :try_start_45
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Connecting simulated port: portId="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 334
    const-string/jumbo v3, ", mode="

    .line 333
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 334
    invoke-static {p2}, Landroid/hardware/usb/UsbPort;->modeToString(I)Ljava/lang/String;

    move-result-object v3

    .line 333
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 335
    const-string/jumbo v3, ", canChangeMode="

    .line 333
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 336
    const-string/jumbo v3, ", powerRole="

    .line 333
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 336
    invoke-static {p4}, Landroid/hardware/usb/UsbPort;->powerRoleToString(I)Ljava/lang/String;

    move-result-object v3

    .line 333
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 337
    const-string/jumbo v3, ", canChangePowerRole="

    .line 333
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 338
    const-string/jumbo v3, ", dataRole="

    .line 333
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 338
    invoke-static {p6}, Landroid/hardware/usb/UsbPort;->dataRoleToString(I)Ljava/lang/String;

    move-result-object v3

    .line 333
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 339
    const-string/jumbo v3, ", canChangeDataRole="

    .line 333
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p7}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p8, v2}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V

    .line 340
    iput p2, v0, Lcom/android/server/usb/UsbPortManager$RawPortInfo;->currentMode:I

    .line 341
    iput-boolean p3, v0, Lcom/android/server/usb/UsbPortManager$RawPortInfo;->canChangeMode:Z

    .line 342
    iput p4, v0, Lcom/android/server/usb/UsbPortManager$RawPortInfo;->currentPowerRole:I

    .line 343
    iput-boolean p5, v0, Lcom/android/server/usb/UsbPortManager$RawPortInfo;->canChangePowerRole:Z

    .line 344
    iput p6, v0, Lcom/android/server/usb/UsbPortManager$RawPortInfo;->currentDataRole:I

    .line 345
    iput-boolean p7, v0, Lcom/android/server/usb/UsbPortManager$RawPortInfo;->canChangeDataRole:Z

    .line 346
    const/4 v0, 0x0

    invoke-direct {p0, p8, v0}, Lcom/android/server/usb/UsbPortManager;->updatePortsLocked(Lcom/android/internal/util/IndentingPrintWriter;Ljava/util/ArrayList;)V
    :try_end_ba
    .catchall {:try_start_45 .. :try_end_ba} :catchall_bc

    monitor-exit v1

    .line 348
    return-void

    .line 315
    :catchall_bc
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public disconnectSimulatedPort(Ljava/lang/String;Lcom/android/internal/util/IndentingPrintWriter;)V
    .registers 7

    .prologue
    .line 351
    iget-object v1, p0, Lcom/android/server/usb/UsbPortManager;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 352
    :try_start_3
    iget-object v0, p0, Lcom/android/server/usb/UsbPortManager;->mSimulatedPorts:Landroid/util/ArrayMap;

    invoke-virtual {v0, p1}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/usb/UsbPortManager$RawPortInfo;

    .line 353
    if-nez v0, :cond_15

    .line 354
    const-string/jumbo v0, "Cannot disconnect simulated port which does not exist."

    invoke-virtual {p2, v0}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V
    :try_end_13
    .catchall {:try_start_3 .. :try_end_13} :catchall_44

    monitor-exit v1

    .line 355
    return-void

    .line 358
    :cond_15
    :try_start_15
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Disconnecting simulated port: portId="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p2, v2}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V

    .line 359
    const/4 v2, 0x0

    iput v2, v0, Lcom/android/server/usb/UsbPortManager$RawPortInfo;->currentMode:I

    .line 360
    const/4 v2, 0x0

    iput-boolean v2, v0, Lcom/android/server/usb/UsbPortManager$RawPortInfo;->canChangeMode:Z

    .line 361
    const/4 v2, 0x0

    iput v2, v0, Lcom/android/server/usb/UsbPortManager$RawPortInfo;->currentPowerRole:I

    .line 362
    const/4 v2, 0x0

    iput-boolean v2, v0, Lcom/android/server/usb/UsbPortManager$RawPortInfo;->canChangePowerRole:Z

    .line 363
    const/4 v2, 0x0

    iput v2, v0, Lcom/android/server/usb/UsbPortManager$RawPortInfo;->currentDataRole:I

    .line 364
    const/4 v2, 0x0

    iput-boolean v2, v0, Lcom/android/server/usb/UsbPortManager$RawPortInfo;->canChangeDataRole:Z

    .line 365
    const/4 v0, 0x0

    invoke-direct {p0, p2, v0}, Lcom/android/server/usb/UsbPortManager;->updatePortsLocked(Lcom/android/internal/util/IndentingPrintWriter;Ljava/util/ArrayList;)V
    :try_end_42
    .catchall {:try_start_15 .. :try_end_42} :catchall_44

    monitor-exit v1

    .line 367
    return-void

    .line 351
    :catchall_44
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public dump(Lcom/android/internal/util/IndentingPrintWriter;)V
    .registers 7

    .prologue
    .line 394
    iget-object v1, p0, Lcom/android/server/usb/UsbPortManager;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 395
    :try_start_3
    const-string/jumbo v0, "USB Port State:"

    invoke-virtual {p1, v0}, Lcom/android/internal/util/IndentingPrintWriter;->print(Ljava/lang/String;)V

    .line 396
    iget-object v0, p0, Lcom/android/server/usb/UsbPortManager;->mSimulatedPorts:Landroid/util/ArrayMap;

    invoke-virtual {v0}, Landroid/util/ArrayMap;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_17

    .line 397
    const-string/jumbo v0, " (simulation active; end with \'dumpsys usb reset\')"

    invoke-virtual {p1, v0}, Lcom/android/internal/util/IndentingPrintWriter;->print(Ljava/lang/String;)V

    .line 399
    :cond_17
    invoke-virtual {p1}, Lcom/android/internal/util/IndentingPrintWriter;->println()V

    .line 401
    iget-object v0, p0, Lcom/android/server/usb/UsbPortManager;->mPorts:Landroid/util/ArrayMap;

    invoke-virtual {v0}, Landroid/util/ArrayMap;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_2a

    .line 402
    const-string/jumbo v0, "  <no ports>"

    invoke-virtual {p1, v0}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V
    :try_end_28
    .catchall {:try_start_3 .. :try_end_28} :catchall_69

    :cond_28
    monitor-exit v1

    .line 409
    return-void

    .line 404
    :cond_2a
    :try_start_2a
    iget-object v0, p0, Lcom/android/server/usb/UsbPortManager;->mPorts:Landroid/util/ArrayMap;

    invoke-virtual {v0}, Landroid/util/ArrayMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_34
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_28

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/usb/UsbPortManager$PortInfo;

    .line 405
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "  "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, v0, Lcom/android/server/usb/UsbPortManager$PortInfo;->mUsbPort:Landroid/hardware/usb/UsbPort;

    invoke-virtual {v4}, Landroid/hardware/usb/UsbPort;->getId()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, ": "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V
    :try_end_68
    .catchall {:try_start_2a .. :try_end_68} :catchall_69

    goto :goto_34

    .line 394
    :catchall_69
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public getPortStatus(Ljava/lang/String;)Landroid/hardware/usb/UsbPortStatus;
    .registers 5

    .prologue
    const/4 v1, 0x0

    .line 157
    iget-object v2, p0, Lcom/android/server/usb/UsbPortManager;->mLock:Ljava/lang/Object;

    monitor-enter v2

    .line 158
    :try_start_4
    iget-object v0, p0, Lcom/android/server/usb/UsbPortManager;->mPorts:Landroid/util/ArrayMap;

    invoke-virtual {v0, p1}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/usb/UsbPortManager$PortInfo;

    .line 159
    if-eqz v0, :cond_12

    iget-object v0, v0, Lcom/android/server/usb/UsbPortManager$PortInfo;->mUsbPortStatus:Landroid/hardware/usb/UsbPortStatus;
    :try_end_10
    .catchall {:try_start_4 .. :try_end_10} :catchall_14

    :goto_10
    monitor-exit v2

    return-object v0

    :cond_12
    move-object v0, v1

    goto :goto_10

    .line 157
    :catchall_14
    move-exception v0

    monitor-exit v2

    throw v0
.end method

.method public getPorts()[Landroid/hardware/usb/UsbPort;
    .registers 6

    .prologue
    .line 146
    iget-object v2, p0, Lcom/android/server/usb/UsbPortManager;->mLock:Ljava/lang/Object;

    monitor-enter v2

    .line 147
    :try_start_3
    iget-object v0, p0, Lcom/android/server/usb/UsbPortManager;->mPorts:Landroid/util/ArrayMap;

    invoke-virtual {v0}, Landroid/util/ArrayMap;->size()I

    move-result v3

    .line 148
    new-array v4, v3, [Landroid/hardware/usb/UsbPort;

    .line 149
    const/4 v0, 0x0

    move v1, v0

    :goto_d
    if-ge v1, v3, :cond_1f

    .line 150
    iget-object v0, p0, Lcom/android/server/usb/UsbPortManager;->mPorts:Landroid/util/ArrayMap;

    invoke-virtual {v0, v1}, Landroid/util/ArrayMap;->valueAt(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/usb/UsbPortManager$PortInfo;

    iget-object v0, v0, Lcom/android/server/usb/UsbPortManager$PortInfo;->mUsbPort:Landroid/hardware/usb/UsbPort;

    aput-object v0, v4, v1
    :try_end_1b
    .catchall {:try_start_3 .. :try_end_1b} :catchall_21

    .line 149
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_d

    :cond_1f
    monitor-exit v2

    .line 152
    return-object v4

    .line 146
    :catchall_21
    move-exception v0

    monitor-exit v2

    throw v0
.end method

.method synthetic lambda$-com_android_server_usb_UsbPortManager_30586(Landroid/content/Intent;)V
    .registers 4

    .prologue
    .line 695
    iget-object v0, p0, Lcom/android/server/usb/UsbPortManager;->mContext:Landroid/content/Context;

    sget-object v1, Landroid/os/UserHandle;->ALL:Landroid/os/UserHandle;

    invoke-virtual {v0, p1, v1}, Landroid/content/Context;->sendBroadcastAsUser(Landroid/content/Intent;Landroid/os/UserHandle;)V

    return-void
.end method

.method public removeSimulatedPort(Ljava/lang/String;Lcom/android/internal/util/IndentingPrintWriter;)V
    .registers 7

    .prologue
    .line 370
    iget-object v1, p0, Lcom/android/server/usb/UsbPortManager;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 371
    :try_start_3
    iget-object v0, p0, Lcom/android/server/usb/UsbPortManager;->mSimulatedPorts:Landroid/util/ArrayMap;

    invoke-virtual {v0, p1}, Landroid/util/ArrayMap;->indexOfKey(Ljava/lang/Object;)I

    move-result v0

    .line 372
    if-gez v0, :cond_13

    .line 373
    const-string/jumbo v0, "Cannot remove simulated port which does not exist."

    invoke-virtual {p2, v0}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V
    :try_end_11
    .catchall {:try_start_3 .. :try_end_11} :catchall_35

    monitor-exit v1

    .line 374
    return-void

    .line 377
    :cond_13
    :try_start_13
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Disconnecting simulated port: portId="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p2, v2}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V

    .line 378
    iget-object v2, p0, Lcom/android/server/usb/UsbPortManager;->mSimulatedPorts:Landroid/util/ArrayMap;

    invoke-virtual {v2, v0}, Landroid/util/ArrayMap;->removeAt(I)Ljava/lang/Object;

    .line 379
    const/4 v0, 0x0

    invoke-direct {p0, p2, v0}, Lcom/android/server/usb/UsbPortManager;->updatePortsLocked(Lcom/android/internal/util/IndentingPrintWriter;Ljava/util/ArrayList;)V
    :try_end_33
    .catchall {:try_start_13 .. :try_end_33} :catchall_35

    monitor-exit v1

    .line 381
    return-void

    .line 370
    :catchall_35
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public resetSimulation(Lcom/android/internal/util/IndentingPrintWriter;)V
    .registers 4

    .prologue
    .line 384
    iget-object v1, p0, Lcom/android/server/usb/UsbPortManager;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 385
    :try_start_3
    const-string/jumbo v0, "Removing all simulated ports and ending simulation."

    invoke-virtual {p1, v0}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V

    .line 386
    iget-object v0, p0, Lcom/android/server/usb/UsbPortManager;->mSimulatedPorts:Landroid/util/ArrayMap;

    invoke-virtual {v0}, Landroid/util/ArrayMap;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1a

    .line 387
    iget-object v0, p0, Lcom/android/server/usb/UsbPortManager;->mSimulatedPorts:Landroid/util/ArrayMap;

    invoke-virtual {v0}, Landroid/util/ArrayMap;->clear()V

    .line 388
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/android/server/usb/UsbPortManager;->updatePortsLocked(Lcom/android/internal/util/IndentingPrintWriter;Ljava/util/ArrayList;)V
    :try_end_1a
    .catchall {:try_start_3 .. :try_end_1a} :catchall_1c

    :cond_1a
    monitor-exit v1

    .line 391
    return-void

    .line 384
    :catchall_1c
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public setPortRoles(Ljava/lang/String;IILcom/android/internal/util/IndentingPrintWriter;)V
    .registers 15

    .prologue
    const/4 v1, 0x2

    const/4 v2, 0x1

    .line 165
    iget-object v4, p0, Lcom/android/server/usb/UsbPortManager;->mLock:Ljava/lang/Object;

    monitor-enter v4

    .line 166
    :try_start_5
    iget-object v0, p0, Lcom/android/server/usb/UsbPortManager;->mPorts:Landroid/util/ArrayMap;

    invoke-virtual {v0, p1}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/usb/UsbPortManager$PortInfo;

    .line 167
    if-nez v0, :cond_2a

    .line 168
    if-eqz p4, :cond_28

    .line 169
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "No such USB port: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p4, v0}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V
    :try_end_28
    .catchall {:try_start_5 .. :try_end_28} :catchall_1d5

    :cond_28
    monitor-exit v4

    .line 171
    return-void

    .line 175
    :cond_2a
    :try_start_2a
    iget-object v3, v0, Lcom/android/server/usb/UsbPortManager$PortInfo;->mUsbPortStatus:Landroid/hardware/usb/UsbPortStatus;

    invoke-virtual {v3, p2, p3}, Landroid/hardware/usb/UsbPortStatus;->isRoleCombinationSupported(II)Z

    move-result v3

    if-nez v3, :cond_6a

    .line 176
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "Attempted to set USB port into unsupported role combination: portId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 178
    const-string/jumbo v1, ", newPowerRole="

    .line 176
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 178
    invoke-static {p2}, Landroid/hardware/usb/UsbPort;->powerRoleToString(I)Ljava/lang/String;

    move-result-object v1

    .line 176
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 179
    const-string/jumbo v1, ", newDataRole="

    .line 176
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 179
    invoke-static {p3}, Landroid/hardware/usb/UsbPort;->dataRoleToString(I)Ljava/lang/String;

    move-result-object v1

    .line 176
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x6

    invoke-static {v1, p4, v0}, Lcom/android/server/usb/UsbPortManager;->logAndPrint(ILcom/android/internal/util/IndentingPrintWriter;Ljava/lang/String;)V
    :try_end_68
    .catchall {:try_start_2a .. :try_end_68} :catchall_1d5

    monitor-exit v4

    .line 180
    return-void

    .line 184
    :cond_6a
    :try_start_6a
    iget-object v3, v0, Lcom/android/server/usb/UsbPortManager$PortInfo;->mUsbPortStatus:Landroid/hardware/usb/UsbPortStatus;

    invoke-virtual {v3}, Landroid/hardware/usb/UsbPortStatus;->getCurrentDataRole()I

    move-result v5

    .line 185
    iget-object v3, v0, Lcom/android/server/usb/UsbPortManager$PortInfo;->mUsbPortStatus:Landroid/hardware/usb/UsbPortStatus;

    invoke-virtual {v3}, Landroid/hardware/usb/UsbPortStatus;->getCurrentPowerRole()I

    move-result v6

    .line 186
    if-ne v5, p3, :cond_84

    if-ne v6, p2, :cond_84

    .line 187
    if-eqz p4, :cond_82

    .line 188
    const-string/jumbo v0, "No change."

    invoke-virtual {p4, v0}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V
    :try_end_82
    .catchall {:try_start_6a .. :try_end_82} :catchall_1d5

    :cond_82
    monitor-exit v4

    .line 190
    return-void

    .line 199
    :cond_84
    :try_start_84
    iget-boolean v7, v0, Lcom/android/server/usb/UsbPortManager$PortInfo;->mCanChangeMode:Z

    .line 200
    iget-boolean v8, v0, Lcom/android/server/usb/UsbPortManager$PortInfo;->mCanChangePowerRole:Z

    .line 201
    iget-boolean v9, v0, Lcom/android/server/usb/UsbPortManager$PortInfo;->mCanChangeDataRole:Z

    .line 202
    iget-object v3, v0, Lcom/android/server/usb/UsbPortManager$PortInfo;->mUsbPortStatus:Landroid/hardware/usb/UsbPortStatus;

    invoke-virtual {v3}, Landroid/hardware/usb/UsbPortStatus;->getCurrentMode()I

    move-result v3

    .line 204
    if-nez v8, :cond_124

    if-eq v6, p2, :cond_124

    .line 206
    :cond_94
    if-eqz v7, :cond_12b

    if-ne p2, v2, :cond_12b

    .line 207
    if-ne p3, v2, :cond_12b

    move v0, v1

    :goto_9b
    move v1, v0

    .line 224
    :goto_9c
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Setting USB port mode and role: portId="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 225
    const-string/jumbo v2, ", currentMode="

    .line 224
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 225
    invoke-static {v3}, Landroid/hardware/usb/UsbPort;->modeToString(I)Ljava/lang/String;

    move-result-object v2

    .line 224
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 226
    const-string/jumbo v2, ", currentPowerRole="

    .line 224
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 226
    invoke-static {v6}, Landroid/hardware/usb/UsbPort;->powerRoleToString(I)Ljava/lang/String;

    move-result-object v2

    .line 224
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 227
    const-string/jumbo v2, ", currentDataRole="

    .line 224
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 227
    invoke-static {v5}, Landroid/hardware/usb/UsbPort;->dataRoleToString(I)Ljava/lang/String;

    move-result-object v2

    .line 224
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 228
    const-string/jumbo v2, ", newMode="

    .line 224
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 228
    invoke-static {v1}, Landroid/hardware/usb/UsbPort;->modeToString(I)Ljava/lang/String;

    move-result-object v2

    .line 224
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 229
    const-string/jumbo v2, ", newPowerRole="

    .line 224
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 229
    invoke-static {p2}, Landroid/hardware/usb/UsbPort;->powerRoleToString(I)Ljava/lang/String;

    move-result-object v2

    .line 224
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 230
    const-string/jumbo v2, ", newDataRole="

    .line 224
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 230
    invoke-static {p3}, Landroid/hardware/usb/UsbPort;->dataRoleToString(I)Ljava/lang/String;

    move-result-object v2

    .line 224
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v2, 0x4

    invoke-static {v2, p4, v0}, Lcom/android/server/usb/UsbPortManager;->logAndPrint(ILcom/android/internal/util/IndentingPrintWriter;Ljava/lang/String;)V

    .line 232
    iget-object v0, p0, Lcom/android/server/usb/UsbPortManager;->mSimulatedPorts:Landroid/util/ArrayMap;

    invoke-virtual {v0, p1}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/usb/UsbPortManager$RawPortInfo;

    .line 233
    if-eqz v0, :cond_16c

    .line 235
    iput v1, v0, Lcom/android/server/usb/UsbPortManager$RawPortInfo;->currentMode:I

    .line 236
    iput p2, v0, Lcom/android/server/usb/UsbPortManager$RawPortInfo;->currentPowerRole:I

    .line 237
    iput p3, v0, Lcom/android/server/usb/UsbPortManager$RawPortInfo;->currentDataRole:I

    .line 238
    const/4 v0, 0x0

    invoke-direct {p0, p4, v0}, Lcom/android/server/usb/UsbPortManager;->updatePortsLocked(Lcom/android/internal/util/IndentingPrintWriter;Ljava/util/ArrayList;)V
    :try_end_122
    .catchall {:try_start_84 .. :try_end_122} :catchall_1d5

    :cond_122
    :goto_122
    monitor-exit v4

    .line 295
    return-void

    .line 205
    :cond_124
    if-nez v9, :cond_128

    if-ne v5, p3, :cond_94

    :cond_128
    move v1, v3

    .line 220
    goto/16 :goto_9c

    .line 209
    :cond_12b
    if-eqz v7, :cond_134

    if-ne p2, v1, :cond_134

    .line 210
    if-ne p3, v1, :cond_134

    move v0, v2

    goto/16 :goto_9b

    .line 213
    :cond_134
    :try_start_134
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Found mismatch in supported USB role combinations while attempting to change role: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 215
    const-string/jumbo v1, ", newPowerRole="

    .line 213
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 215
    invoke-static {p2}, Landroid/hardware/usb/UsbPort;->powerRoleToString(I)Ljava/lang/String;

    move-result-object v1

    .line 213
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 216
    const-string/jumbo v1, ", newDataRole="

    .line 213
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 216
    invoke-static {p3}, Landroid/hardware/usb/UsbPort;->dataRoleToString(I)Ljava/lang/String;

    move-result-object v1

    .line 213
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x6

    invoke-static {v1, p4, v0}, Lcom/android/server/usb/UsbPortManager;->logAndPrint(ILcom/android/internal/util/IndentingPrintWriter;Ljava/lang/String;)V
    :try_end_16a
    .catchall {:try_start_134 .. :try_end_16a} :catchall_1d5

    monitor-exit v4

    .line 217
    return-void

    .line 239
    :cond_16c
    :try_start_16c
    iget-object v0, p0, Lcom/android/server/usb/UsbPortManager;->mProxy:Landroid/hardware/usb/V1_0/IUsb;

    if-eqz v0, :cond_122

    .line 240
    if-eq v3, v1, :cond_1d8

    .line 248
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Trying to set the USB port mode: portId="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 250
    const-string/jumbo v2, ", newMode="

    .line 248
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 250
    invoke-static {v1}, Landroid/hardware/usb/UsbPort;->modeToString(I)Ljava/lang/String;

    move-result-object v2

    .line 248
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v2, 0x6

    invoke-static {v2, p4, v0}, Lcom/android/server/usb/UsbPortManager;->logAndPrint(ILcom/android/internal/util/IndentingPrintWriter;Ljava/lang/String;)V

    .line 251
    new-instance v2, Landroid/hardware/usb/V1_0/PortRole;

    invoke-direct {v2}, Landroid/hardware/usb/V1_0/PortRole;-><init>()V

    .line 252
    const/4 v0, 0x2

    iput v0, v2, Landroid/hardware/usb/V1_0/PortRole;->type:I

    .line 253
    iput v1, v2, Landroid/hardware/usb/V1_0/PortRole;->role:I
    :try_end_1a3
    .catchall {:try_start_16c .. :try_end_1a3} :catchall_1d5

    .line 255
    :try_start_1a3
    iget-object v0, p0, Lcom/android/server/usb/UsbPortManager;->mProxy:Landroid/hardware/usb/V1_0/IUsb;

    invoke-interface {v0, p1, v2}, Landroid/hardware/usb/V1_0/IUsb;->switchRole(Ljava/lang/String;Landroid/hardware/usb/V1_0/PortRole;)V
    :try_end_1a8
    .catch Landroid/os/RemoteException; {:try_start_1a3 .. :try_end_1a8} :catch_1aa
    .catchall {:try_start_1a3 .. :try_end_1a8} :catchall_1d5

    goto/16 :goto_122

    .line 256
    :catch_1aa
    move-exception v0

    .line 257
    :try_start_1ab
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Failed to set the USB port mode: portId="

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 259
    const-string/jumbo v3, ", newMode="

    .line 257
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 259
    iget v2, v2, Landroid/hardware/usb/V1_0/PortRole;->role:I

    invoke-static {v2}, Landroid/hardware/usb/UsbPort;->modeToString(I)Ljava/lang/String;

    move-result-object v2

    .line 257
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p4, v1, v0}, Lcom/android/server/usb/UsbPortManager;->logAndPrintException(Lcom/android/internal/util/IndentingPrintWriter;Ljava/lang/String;Ljava/lang/Exception;)V
    :try_end_1d3
    .catchall {:try_start_1ab .. :try_end_1d3} :catchall_1d5

    goto/16 :goto_122

    .line 165
    :catchall_1d5
    move-exception v0

    monitor-exit v4

    throw v0

    .line 263
    :cond_1d8
    if-eq v6, p2, :cond_1e9

    .line 264
    :try_start_1da
    new-instance v1, Landroid/hardware/usb/V1_0/PortRole;

    invoke-direct {v1}, Landroid/hardware/usb/V1_0/PortRole;-><init>()V

    .line 265
    const/4 v0, 0x1

    iput v0, v1, Landroid/hardware/usb/V1_0/PortRole;->type:I

    .line 266
    iput p2, v1, Landroid/hardware/usb/V1_0/PortRole;->role:I
    :try_end_1e4
    .catchall {:try_start_1da .. :try_end_1e4} :catchall_1d5

    .line 268
    :try_start_1e4
    iget-object v0, p0, Lcom/android/server/usb/UsbPortManager;->mProxy:Landroid/hardware/usb/V1_0/IUsb;

    invoke-interface {v0, p1, v1}, Landroid/hardware/usb/V1_0/IUsb;->switchRole(Ljava/lang/String;Landroid/hardware/usb/V1_0/PortRole;)V
    :try_end_1e9
    .catch Landroid/os/RemoteException; {:try_start_1e4 .. :try_end_1e9} :catch_227
    .catchall {:try_start_1e4 .. :try_end_1e9} :catchall_1d5

    .line 278
    :cond_1e9
    if-eq v5, p3, :cond_122

    .line 279
    :try_start_1eb
    new-instance v1, Landroid/hardware/usb/V1_0/PortRole;

    invoke-direct {v1}, Landroid/hardware/usb/V1_0/PortRole;-><init>()V

    .line 280
    const/4 v0, 0x0

    iput v0, v1, Landroid/hardware/usb/V1_0/PortRole;->type:I

    .line 281
    iput p3, v1, Landroid/hardware/usb/V1_0/PortRole;->role:I
    :try_end_1f5
    .catchall {:try_start_1eb .. :try_end_1f5} :catchall_1d5

    .line 283
    :try_start_1f5
    iget-object v0, p0, Lcom/android/server/usb/UsbPortManager;->mProxy:Landroid/hardware/usb/V1_0/IUsb;

    invoke-interface {v0, p1, v1}, Landroid/hardware/usb/V1_0/IUsb;->switchRole(Ljava/lang/String;Landroid/hardware/usb/V1_0/PortRole;)V
    :try_end_1fa
    .catch Landroid/os/RemoteException; {:try_start_1f5 .. :try_end_1fa} :catch_1fc
    .catchall {:try_start_1f5 .. :try_end_1fa} :catchall_1d5

    goto/16 :goto_122

    .line 284
    :catch_1fc
    move-exception v0

    .line 285
    :try_start_1fd
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Failed to set the USB port data role: portId="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 287
    const-string/jumbo v3, ", newDataRole="

    .line 285
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 287
    iget v1, v1, Landroid/hardware/usb/V1_0/PortRole;->role:I

    invoke-static {v1}, Landroid/hardware/usb/UsbPort;->dataRoleToString(I)Ljava/lang/String;

    move-result-object v1

    .line 285
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p4, v1, v0}, Lcom/android/server/usb/UsbPortManager;->logAndPrintException(Lcom/android/internal/util/IndentingPrintWriter;Ljava/lang/String;Ljava/lang/Exception;)V

    goto/16 :goto_122

    .line 269
    :catch_227
    move-exception v0

    .line 270
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Failed to set the USB port power role: portId="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 272
    const-string/jumbo v3, ", newPowerRole="

    .line 270
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 273
    iget v1, v1, Landroid/hardware/usb/V1_0/PortRole;->role:I

    .line 272
    invoke-static {v1}, Landroid/hardware/usb/UsbPort;->powerRoleToString(I)Ljava/lang/String;

    move-result-object v1

    .line 270
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p4, v1, v0}, Lcom/android/server/usb/UsbPortManager;->logAndPrintException(Lcom/android/internal/util/IndentingPrintWriter;Ljava/lang/String;Ljava/lang/Exception;)V
    :try_end_250
    .catchall {:try_start_1fd .. :try_end_250} :catchall_1d5

    monitor-exit v4

    .line 275
    return-void
.end method

.method public systemReady()V
    .registers 4

    .prologue
    const/4 v2, 0x0

    .line 134
    iget-object v0, p0, Lcom/android/server/usb/UsbPortManager;->mProxy:Landroid/hardware/usb/V1_0/IUsb;

    if-eqz v0, :cond_a

    .line 136
    :try_start_5
    iget-object v0, p0, Lcom/android/server/usb/UsbPortManager;->mProxy:Landroid/hardware/usb/V1_0/IUsb;

    invoke-interface {v0}, Landroid/hardware/usb/V1_0/IUsb;->queryPortStatus()V
    :try_end_a
    .catch Landroid/os/RemoteException; {:try_start_5 .. :try_end_a} :catch_e

    .line 142
    :cond_a
    :goto_a
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/server/usb/UsbPortManager;->mSystemReady:Z

    .line 143
    return-void

    .line 137
    :catch_e
    move-exception v0

    .line 139
    const-string/jumbo v1, "ServiceStart: Failed to query port status"

    .line 138
    invoke-static {v2, v1, v0}, Lcom/android/server/usb/UsbPortManager;->logAndPrintException(Lcom/android/internal/util/IndentingPrintWriter;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_a
.end method
