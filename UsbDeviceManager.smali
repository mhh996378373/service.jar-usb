.class public Lcom/android/server/usb/UsbDeviceManager;
.super Ljava/lang/Object;
.source "UsbDeviceManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/server/usb/UsbDeviceManager$1;,
        Lcom/android/server/usb/UsbDeviceManager$AdbSettingsObserver;,
        Lcom/android/server/usb/UsbDeviceManager$UsbHandler;
    }
.end annotation


# static fields
.field private static final ACCESSORY_REQUEST_TIMEOUT:I = 0x2710

.field private static final ACCESSORY_START_MATCH:Ljava/lang/String; = "DEVPATH=/devices/virtual/misc/usb_accessory"

.field private static final ADB_NOTIFICATION_CHANNEL_ID_TV:Ljava/lang/String; = "usbdevicemanager.adb.tv"

.field private static final AUDIO_MODE_SOURCE:I = 0x1

.field private static final AUDIO_SOURCE_PCM_PATH:Ljava/lang/String; = "/sys/class/android_usb/android0/f_audio_source/pcm"

.field private static final BOOT_MODE_PROPERTY:Ljava/lang/String; = "ro.bootmode"

.field private static final DEBUG:Z = false

.field private static final FUNCTIONS_PATH:Ljava/lang/String; = "/sys/class/android_usb/android0/functions"

.field private static final MIDI_ALSA_PATH:Ljava/lang/String; = "/sys/class/android_usb/android0/f_midi/alsa"

.field private static final MSG_ACCESSORY_MODE_ENTER_TIMEOUT:I = 0x8

.field private static final MSG_BOOT_COMPLETED:I = 0x4

.field private static final MSG_ENABLE_ADB:I = 0x1

.field private static final MSG_LOCALE_CHANGED:I = 0xb

.field private static final MSG_SET_CURRENT_FUNCTIONS:I = 0x2

.field private static final MSG_SYSTEM_READY:I = 0x3

.field private static final MSG_UPDATE_CHARGING_STATE:I = 0x9

.field private static final MSG_UPDATE_HOST_STATE:I = 0xa

.field private static final MSG_UPDATE_PORT_STATE:I = 0x7

.field private static final MSG_UPDATE_STATE:I = 0x0

.field private static final MSG_UPDATE_USER_RESTRICTIONS:I = 0x6

.field private static final MSG_USER_SWITCHED:I = 0x5

.field private static final NORMAL_BOOT:Ljava/lang/String; = "normal"

.field private static final RNDIS_ETH_ADDR_PATH:Ljava/lang/String; = "/sys/class/android_usb/android0/f_rndis/ethaddr"

.field private static final STATE_PATH:Ljava/lang/String; = "/sys/class/android_usb/android0/state"

.field private static final TAG:Ljava/lang/String; = "UsbDeviceManager"

.field private static final UPDATE_DELAY:I = 0x3e8

.field private static final USB_CONFIG_PROPERTY:Ljava/lang/String; = "sys.usb.config"

.field private static final USB_PERSISTENT_CONFIG_PROPERTY:Ljava/lang/String; = "persist.sys.usb.config"

.field private static final USB_STATE_MATCH:Ljava/lang/String; = "DEVPATH=/devices/virtual/android_usb/android0"

.field private static final USB_STATE_PROPERTY:Ljava/lang/String; = "sys.usb.state"

.field private static sBlackListedInterfaces:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mAccessoryStrings:[Ljava/lang/String;

.field private mAdbEnabled:Z

.field private mAudioSourceEnabled:Z

.field private mBootCompleted:Z

.field private mBroadcastedIntent:Landroid/content/Intent;

.field private final mContentResolver:Landroid/content/ContentResolver;

.field private final mContext:Landroid/content/Context;

.field private mCurrentSettings:Lcom/android/server/usb/UsbProfileGroupSettingsManager;
    .annotation build Lcom/android/internal/annotations/GuardedBy;
        value = "mLock"
    .end annotation
.end field

.field private mDebuggingManager:Lcom/android/server/usb/UsbDebuggingManager;

.field private mHandler:Lcom/android/server/usb/UsbDeviceManager$UsbHandler;

.field private final mHasUsbAccessory:Z

.field private final mLock:Ljava/lang/Object;

.field private mMidiCard:I

.field private mMidiDevice:I

.field private mMidiEnabled:Z

.field private mNotificationManager:Landroid/app/NotificationManager;

.field private mOemModeMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Landroid/util/Pair",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;>;"
        }
    .end annotation
.end field

.field private mPendingBootBroadcast:Z

.field private final mSettingsManager:Lcom/android/server/usb/UsbSettingsManager;

.field private final mUEventObserver:Landroid/os/UEventObserver;

.field private final mUsbAlsaManager:Lcom/android/server/usb/UsbAlsaManager;

.field private mUseUsbNotification:Z


# direct methods
.method static synthetic -get0(Lcom/android/server/usb/UsbDeviceManager;)[Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/android/server/usb/UsbDeviceManager;->mAccessoryStrings:[Ljava/lang/String;

    return-object v0
.end method

.method static synthetic -get1(Lcom/android/server/usb/UsbDeviceManager;)Z
    .registers 2

    iget-boolean v0, p0, Lcom/android/server/usb/UsbDeviceManager;->mAdbEnabled:Z

    return v0
.end method

.method static synthetic -get10(Lcom/android/server/usb/UsbDeviceManager;)I
    .registers 2

    iget v0, p0, Lcom/android/server/usb/UsbDeviceManager;->mMidiDevice:I

    return v0
.end method

.method static synthetic -get11(Lcom/android/server/usb/UsbDeviceManager;)Z
    .registers 2

    iget-boolean v0, p0, Lcom/android/server/usb/UsbDeviceManager;->mMidiEnabled:Z

    return v0
.end method

.method static synthetic -get12(Lcom/android/server/usb/UsbDeviceManager;)Landroid/app/NotificationManager;
    .registers 2

    iget-object v0, p0, Lcom/android/server/usb/UsbDeviceManager;->mNotificationManager:Landroid/app/NotificationManager;

    return-object v0
.end method

.method static synthetic -get13(Lcom/android/server/usb/UsbDeviceManager;)Z
    .registers 2

    iget-boolean v0, p0, Lcom/android/server/usb/UsbDeviceManager;->mPendingBootBroadcast:Z

    return v0
.end method

.method static synthetic -get14(Lcom/android/server/usb/UsbDeviceManager;)Lcom/android/server/usb/UsbSettingsManager;
    .registers 2

    iget-object v0, p0, Lcom/android/server/usb/UsbDeviceManager;->mSettingsManager:Lcom/android/server/usb/UsbSettingsManager;

    return-object v0
.end method

.method static synthetic -get15(Lcom/android/server/usb/UsbDeviceManager;)Landroid/os/UEventObserver;
    .registers 2

    iget-object v0, p0, Lcom/android/server/usb/UsbDeviceManager;->mUEventObserver:Landroid/os/UEventObserver;

    return-object v0
.end method

.method static synthetic -get16(Lcom/android/server/usb/UsbDeviceManager;)Lcom/android/server/usb/UsbAlsaManager;
    .registers 2

    iget-object v0, p0, Lcom/android/server/usb/UsbDeviceManager;->mUsbAlsaManager:Lcom/android/server/usb/UsbAlsaManager;

    return-object v0
.end method

.method static synthetic -get17(Lcom/android/server/usb/UsbDeviceManager;)Z
    .registers 2

    iget-boolean v0, p0, Lcom/android/server/usb/UsbDeviceManager;->mUseUsbNotification:Z

    return v0
.end method

.method static synthetic -get18()Ljava/util/Set;
    .registers 1

    sget-object v0, Lcom/android/server/usb/UsbDeviceManager;->sBlackListedInterfaces:Ljava/util/Set;

    return-object v0
.end method

.method static synthetic -get2(Lcom/android/server/usb/UsbDeviceManager;)Z
    .registers 2

    iget-boolean v0, p0, Lcom/android/server/usb/UsbDeviceManager;->mAudioSourceEnabled:Z

    return v0
.end method

.method static synthetic -get3(Lcom/android/server/usb/UsbDeviceManager;)Z
    .registers 2

    iget-boolean v0, p0, Lcom/android/server/usb/UsbDeviceManager;->mBootCompleted:Z

    return v0
.end method

.method static synthetic -get4(Lcom/android/server/usb/UsbDeviceManager;)Landroid/content/Intent;
    .registers 2

    iget-object v0, p0, Lcom/android/server/usb/UsbDeviceManager;->mBroadcastedIntent:Landroid/content/Intent;

    return-object v0
.end method

.method static synthetic -get5(Lcom/android/server/usb/UsbDeviceManager;)Landroid/content/ContentResolver;
    .registers 2

    iget-object v0, p0, Lcom/android/server/usb/UsbDeviceManager;->mContentResolver:Landroid/content/ContentResolver;

    return-object v0
.end method

.method static synthetic -get6(Lcom/android/server/usb/UsbDeviceManager;)Landroid/content/Context;
    .registers 2

    iget-object v0, p0, Lcom/android/server/usb/UsbDeviceManager;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic -get7(Lcom/android/server/usb/UsbDeviceManager;)Lcom/android/server/usb/UsbDebuggingManager;
    .registers 2

    iget-object v0, p0, Lcom/android/server/usb/UsbDeviceManager;->mDebuggingManager:Lcom/android/server/usb/UsbDebuggingManager;

    return-object v0
.end method

.method static synthetic -get8(Lcom/android/server/usb/UsbDeviceManager;)Lcom/android/server/usb/UsbDeviceManager$UsbHandler;
    .registers 2

    iget-object v0, p0, Lcom/android/server/usb/UsbDeviceManager;->mHandler:Lcom/android/server/usb/UsbDeviceManager$UsbHandler;

    return-object v0
.end method

.method static synthetic -get9(Lcom/android/server/usb/UsbDeviceManager;)I
    .registers 2

    iget v0, p0, Lcom/android/server/usb/UsbDeviceManager;->mMidiCard:I

    return v0
.end method

.method static synthetic -set0(Lcom/android/server/usb/UsbDeviceManager;[Ljava/lang/String;)[Ljava/lang/String;
    .registers 2

    iput-object p1, p0, Lcom/android/server/usb/UsbDeviceManager;->mAccessoryStrings:[Ljava/lang/String;

    return-object p1
.end method

.method static synthetic -set1(Lcom/android/server/usb/UsbDeviceManager;Z)Z
    .registers 2

    iput-boolean p1, p0, Lcom/android/server/usb/UsbDeviceManager;->mAdbEnabled:Z

    return p1
.end method

.method static synthetic -set2(Lcom/android/server/usb/UsbDeviceManager;Z)Z
    .registers 2

    iput-boolean p1, p0, Lcom/android/server/usb/UsbDeviceManager;->mAudioSourceEnabled:Z

    return p1
.end method

.method static synthetic -set3(Lcom/android/server/usb/UsbDeviceManager;Z)Z
    .registers 2

    iput-boolean p1, p0, Lcom/android/server/usb/UsbDeviceManager;->mBootCompleted:Z

    return p1
.end method

.method static synthetic -set4(Lcom/android/server/usb/UsbDeviceManager;Landroid/content/Intent;)Landroid/content/Intent;
    .registers 2

    iput-object p1, p0, Lcom/android/server/usb/UsbDeviceManager;->mBroadcastedIntent:Landroid/content/Intent;

    return-object p1
.end method

.method static synthetic -set5(Lcom/android/server/usb/UsbDeviceManager;I)I
    .registers 2

    iput p1, p0, Lcom/android/server/usb/UsbDeviceManager;->mMidiCard:I

    return p1
.end method

.method static synthetic -set6(Lcom/android/server/usb/UsbDeviceManager;I)I
    .registers 2

    iput p1, p0, Lcom/android/server/usb/UsbDeviceManager;->mMidiDevice:I

    return p1
.end method

.method static synthetic -set7(Lcom/android/server/usb/UsbDeviceManager;Z)Z
    .registers 2

    iput-boolean p1, p0, Lcom/android/server/usb/UsbDeviceManager;->mMidiEnabled:Z

    return p1
.end method

.method static synthetic -set8(Lcom/android/server/usb/UsbDeviceManager;Z)Z
    .registers 2

    iput-boolean p1, p0, Lcom/android/server/usb/UsbDeviceManager;->mPendingBootBroadcast:Z

    return p1
.end method

.method static synthetic -wrap0(Lcom/android/server/usb/UsbDeviceManager;)Lcom/android/server/usb/UsbProfileGroupSettingsManager;
    .registers 2

    invoke-direct {p0}, Lcom/android/server/usb/UsbDeviceManager;->getCurrentSettings()Lcom/android/server/usb/UsbProfileGroupSettingsManager;

    move-result-object v0

    return-object v0
.end method

.method static synthetic -wrap1(Lcom/android/server/usb/UsbDeviceManager;Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    invoke-direct {p0, p1}, Lcom/android/server/usb/UsbDeviceManager;->applyOemOverrideFunction(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic -wrap2(Lcom/android/server/usb/UsbDeviceManager;)V
    .registers 1

    invoke-direct {p0}, Lcom/android/server/usb/UsbDeviceManager;->startAccessoryMode()V

    return-void
.end method

.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 174
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    sput-object v0, Lcom/android/server/usb/UsbDeviceManager;->sBlackListedInterfaces:Ljava/util/Set;

    .line 175
    sget-object v0, Lcom/android/server/usb/UsbDeviceManager;->sBlackListedInterfaces:Ljava/util/Set;

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 176
    sget-object v0, Lcom/android/server/usb/UsbDeviceManager;->sBlackListedInterfaces:Ljava/util/Set;

    const/4 v1, 0x2

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 177
    sget-object v0, Lcom/android/server/usb/UsbDeviceManager;->sBlackListedInterfaces:Ljava/util/Set;

    const/4 v1, 0x3

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 178
    sget-object v0, Lcom/android/server/usb/UsbDeviceManager;->sBlackListedInterfaces:Ljava/util/Set;

    const/4 v1, 0x7

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 179
    sget-object v0, Lcom/android/server/usb/UsbDeviceManager;->sBlackListedInterfaces:Ljava/util/Set;

    const/16 v1, 0x8

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 180
    sget-object v0, Lcom/android/server/usb/UsbDeviceManager;->sBlackListedInterfaces:Ljava/util/Set;

    const/16 v1, 0x9

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 181
    sget-object v0, Lcom/android/server/usb/UsbDeviceManager;->sBlackListedInterfaces:Ljava/util/Set;

    const/16 v1, 0xa

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 182
    sget-object v0, Lcom/android/server/usb/UsbDeviceManager;->sBlackListedInterfaces:Ljava/util/Set;

    const/16 v1, 0xb

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 183
    sget-object v0, Lcom/android/server/usb/UsbDeviceManager;->sBlackListedInterfaces:Ljava/util/Set;

    const/16 v1, 0xd

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 184
    sget-object v0, Lcom/android/server/usb/UsbDeviceManager;->sBlackListedInterfaces:Ljava/util/Set;

    const/16 v1, 0xe

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 185
    sget-object v0, Lcom/android/server/usb/UsbDeviceManager;->sBlackListedInterfaces:Ljava/util/Set;

    const/16 v1, 0xe0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 78
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/android/server/usb/UsbAlsaManager;Lcom/android/server/usb/UsbSettingsManager;)V
    .registers 11

    .prologue
    .line 220
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 150
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/android/server/usb/UsbDeviceManager;->mLock:Ljava/lang/Object;

    .line 204
    new-instance v0, Lcom/android/server/usb/UsbDeviceManager$1;

    invoke-direct {v0, p0}, Lcom/android/server/usb/UsbDeviceManager$1;-><init>(Lcom/android/server/usb/UsbDeviceManager;)V

    iput-object v0, p0, Lcom/android/server/usb/UsbDeviceManager;->mUEventObserver:Landroid/os/UEventObserver;

    .line 222
    iput-object p1, p0, Lcom/android/server/usb/UsbDeviceManager;->mContext:Landroid/content/Context;

    .line 223
    iput-object p2, p0, Lcom/android/server/usb/UsbDeviceManager;->mUsbAlsaManager:Lcom/android/server/usb/UsbAlsaManager;

    .line 224
    iput-object p3, p0, Lcom/android/server/usb/UsbDeviceManager;->mSettingsManager:Lcom/android/server/usb/UsbSettingsManager;

    .line 225
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iput-object v0, p0, Lcom/android/server/usb/UsbDeviceManager;->mContentResolver:Landroid/content/ContentResolver;

    .line 226
    iget-object v0, p0, Lcom/android/server/usb/UsbDeviceManager;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    .line 227
    const-string/jumbo v1, "android.hardware.usb.accessory"

    invoke-virtual {v0, v1}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/server/usb/UsbDeviceManager;->mHasUsbAccessory:Z

    .line 228
    invoke-static {}, Lcom/android/server/usb/UsbDeviceManager;->initRndisAddress()V

    .line 230
    invoke-direct {p0}, Lcom/android/server/usb/UsbDeviceManager;->readOemUsbOverrideConfig()V

    .line 232
    new-instance v0, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;

    invoke-static {}, Lcom/android/server/FgThread;->get()Lcom/android/server/FgThread;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/server/FgThread;->getLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;-><init>(Lcom/android/server/usb/UsbDeviceManager;Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/android/server/usb/UsbDeviceManager;->mHandler:Lcom/android/server/usb/UsbDeviceManager$UsbHandler;

    .line 234
    invoke-direct {p0}, Lcom/android/server/usb/UsbDeviceManager;->nativeIsStartRequested()Z

    move-result v0

    if-eqz v0, :cond_4a

    .line 236
    invoke-direct {p0}, Lcom/android/server/usb/UsbDeviceManager;->startAccessoryMode()V

    .line 239
    :cond_4a
    const-string/jumbo v0, "ro.adb.secure"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    .line 240
    const-string/jumbo v1, "1"

    const-string/jumbo v2, "vold.decrypt"

    invoke-static {v2}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    .line 241
    if-eqz v0, :cond_6d

    xor-int/lit8 v0, v1, 0x1

    if-eqz v0, :cond_6d

    .line 242
    new-instance v0, Lcom/android/server/usb/UsbDebuggingManager;

    invoke-direct {v0, p1}, Lcom/android/server/usb/UsbDebuggingManager;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/android/server/usb/UsbDeviceManager;->mDebuggingManager:Lcom/android/server/usb/UsbDebuggingManager;

    .line 245
    :cond_6d
    new-instance v0, Lcom/android/server/usb/UsbDeviceManager$2;

    invoke-direct {v0, p0}, Lcom/android/server/usb/UsbDeviceManager$2;-><init>(Lcom/android/server/usb/UsbDeviceManager;)V

    .line 254
    new-instance v1, Lcom/android/server/usb/UsbDeviceManager$3;

    invoke-direct {v1, p0}, Lcom/android/server/usb/UsbDeviceManager$3;-><init>(Lcom/android/server/usb/UsbDeviceManager;)V

    .line 263
    new-instance v2, Lcom/android/server/usb/UsbDeviceManager$4;

    invoke-direct {v2, p0}, Lcom/android/server/usb/UsbDeviceManager$4;-><init>(Lcom/android/server/usb/UsbDeviceManager;)V

    .line 276
    new-instance v3, Lcom/android/server/usb/UsbDeviceManager$5;

    invoke-direct {v3, p0}, Lcom/android/server/usb/UsbDeviceManager$5;-><init>(Lcom/android/server/usb/UsbDeviceManager;)V

    .line 283
    iget-object v4, p0, Lcom/android/server/usb/UsbDeviceManager;->mContext:Landroid/content/Context;

    .line 284
    new-instance v5, Landroid/content/IntentFilter;

    const-string/jumbo v6, "android.hardware.usb.action.USB_PORT_CHANGED"

    invoke-direct {v5, v6}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 283
    invoke-virtual {v4, v0, v5}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 285
    iget-object v0, p0, Lcom/android/server/usb/UsbDeviceManager;->mContext:Landroid/content/Context;

    .line 286
    new-instance v4, Landroid/content/IntentFilter;

    const-string/jumbo v5, "android.intent.action.BATTERY_CHANGED"

    invoke-direct {v4, v5}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 285
    invoke-virtual {v0, v1, v4}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 289
    new-instance v0, Landroid/content/IntentFilter;

    const-string/jumbo v1, "android.hardware.usb.action.USB_DEVICE_ATTACHED"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 290
    const-string/jumbo v1, "android.hardware.usb.action.USB_DEVICE_DETACHED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 291
    iget-object v1, p0, Lcom/android/server/usb/UsbDeviceManager;->mContext:Landroid/content/Context;

    invoke-virtual {v1, v2, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 293
    iget-object v0, p0, Lcom/android/server/usb/UsbDeviceManager;->mContext:Landroid/content/Context;

    .line 294
    new-instance v1, Landroid/content/IntentFilter;

    const-string/jumbo v2, "android.intent.action.LOCALE_CHANGED"

    invoke-direct {v1, v2}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 293
    invoke-virtual {v0, v3, v1}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 295
    return-void
.end method

.method private applyOemOverrideFunction(Ljava/lang/String;)Ljava/lang/String;
    .registers 8

    .prologue
    const/4 v5, 0x0

    .line 1343
    if-eqz p1, :cond_7

    iget-object v0, p0, Lcom/android/server/usb/UsbDeviceManager;->mOemModeMap:Ljava/util/HashMap;

    if-nez v0, :cond_8

    .line 1344
    :cond_7
    return-object p1

    .line 1347
    :cond_8
    const-string/jumbo v0, "ro.bootmode"

    const-string/jumbo v1, "unknown"

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 1348
    const-string/jumbo v0, "UsbDeviceManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "applyOemOverride usbfunctions="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, " bootmode="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1351
    iget-object v0, p0, Lcom/android/server/usb/UsbDeviceManager;->mOemModeMap:Ljava/util/HashMap;

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    .line 1354
    if-eqz v0, :cond_103

    const-string/jumbo v2, "normal"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_e6

    .line 1355
    const-string/jumbo v2, "unknown"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    .line 1354
    :goto_51
    xor-int/lit8 v1, v1, 0x1

    if-eqz v1, :cond_103

    .line 1357
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/util/Pair;

    .line 1358
    if-eqz v0, :cond_ee

    .line 1359
    const-string/jumbo v2, "UsbDeviceManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "OEM USB override: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 1360
    const-string/jumbo v3, " ==> "

    .line 1359
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 1360
    iget-object v1, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    .line 1359
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 1361
    const-string/jumbo v3, " persist across reboot "

    .line 1359
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 1362
    iget-object v1, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    .line 1359
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1363
    iget-object v1, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    const-string/jumbo v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_e1

    .line 1365
    iget-boolean v1, p0, Lcom/android/server/usb/UsbDeviceManager;->mAdbEnabled:Z

    if-eqz v1, :cond_e9

    .line 1366
    iget-object v1, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    .line 1367
    const-string/jumbo v2, "adb"

    .line 1366
    invoke-static {v1, v2}, Landroid/hardware/usb/UsbManager;->addFunction(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 1371
    :goto_b1
    const-string/jumbo v2, "UsbDeviceManager"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "OEM USB override persisting: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "in prop: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 1372
    invoke-static {v5}, Lcom/android/server/usb/UsbDeviceManager;->getPersistProp(Z)Ljava/lang/String;

    move-result-object v4

    .line 1371
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1373
    invoke-static {v5}, Lcom/android/server/usb/UsbDeviceManager;->getPersistProp(Z)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, v1}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 1376
    :cond_e1
    iget-object v0, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    return-object v0

    .line 1354
    :cond_e6
    const/4 v1, 0x1

    goto/16 :goto_51

    .line 1369
    :cond_e9
    iget-object v1, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    goto :goto_b1

    .line 1377
    :cond_ee
    iget-boolean v0, p0, Lcom/android/server/usb/UsbDeviceManager;->mAdbEnabled:Z

    if-eqz v0, :cond_104

    .line 1378
    const-string/jumbo v0, "none"

    .line 1379
    const-string/jumbo v1, "adb"

    .line 1378
    invoke-static {v0, v1}, Landroid/hardware/usb/UsbManager;->addFunction(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1380
    invoke-static {v5}, Lcom/android/server/usb/UsbDeviceManager;->getPersistProp(Z)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, v0}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 1388
    :cond_103
    :goto_103
    return-object p1

    .line 1383
    :cond_104
    invoke-static {v5}, Lcom/android/server/usb/UsbDeviceManager;->getPersistProp(Z)Ljava/lang/String;

    move-result-object v0

    .line 1384
    const-string/jumbo v1, "none"

    .line 1383
    invoke-static {v0, v1}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_103
.end method

.method private getCurrentSettings()Lcom/android/server/usb/UsbProfileGroupSettingsManager;
    .registers 3

    .prologue
    .line 298
    iget-object v0, p0, Lcom/android/server/usb/UsbDeviceManager;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 299
    :try_start_3
    iget-object v1, p0, Lcom/android/server/usb/UsbDeviceManager;->mCurrentSettings:Lcom/android/server/usb/UsbProfileGroupSettingsManager;
    :try_end_5
    .catchall {:try_start_3 .. :try_end_5} :catchall_7

    monitor-exit v0

    return-object v1

    .line 298
    :catchall_7
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method public static getPersistProp(Z)Ljava/lang/String;
    .registers 4

    .prologue
    .line 1392
    const-string/jumbo v0, "ro.bootmode"

    const-string/jumbo v1, "unknown"

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1393
    const-string/jumbo v0, "persist.sys.usb.config"

    .line 1394
    const-string/jumbo v1, "normal"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3d

    const-string/jumbo v1, "unknown"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    :goto_1d
    if-nez v1, :cond_3c

    .line 1395
    if-eqz p0, :cond_3f

    .line 1396
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "persist.sys.usb."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ".func"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1402
    :cond_3c
    :goto_3c
    return-object v0

    .line 1394
    :cond_3d
    const/4 v1, 0x1

    goto :goto_1d

    .line 1398
    :cond_3f
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "persist.sys.usb."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ".config"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_3c
.end method

.method private static initRndisAddress()V
    .registers 12

    .prologue
    const/4 v11, 0x3

    const/4 v10, 0x1

    const/4 v9, 0x6

    const/4 v8, 0x2

    const/4 v1, 0x0

    .line 387
    new-array v2, v9, [I

    .line 389
    aput v8, v2, v1

    .line 391
    const-string/jumbo v0, "ro.serialno"

    const-string/jumbo v3, "1234567890ABCDEF"

    invoke-static {v0, v3}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 392
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v4

    move v0, v1

    .line 394
    :goto_18
    if-ge v0, v4, :cond_2a

    .line 395
    rem-int/lit8 v5, v0, 0x5

    add-int/lit8 v5, v5, 0x1

    aget v6, v2, v5

    invoke-virtual {v3, v0}, Ljava/lang/String;->charAt(I)C

    move-result v7

    xor-int/2addr v6, v7

    aput v6, v2, v5

    .line 394
    add-int/lit8 v0, v0, 0x1

    goto :goto_18

    .line 397
    :cond_2a
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string/jumbo v3, "%02X:%02X:%02X:%02X:%02X:%02X"

    new-array v4, v9, [Ljava/lang/Object;

    .line 398
    aget v5, v2, v1

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v1

    aget v1, v2, v10

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v4, v10

    aget v1, v2, v8

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v4, v8

    aget v1, v2, v11

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v4, v11

    const/4 v1, 0x4

    aget v1, v2, v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v5, 0x4

    aput-object v1, v4, v5

    const/4 v1, 0x5

    aget v1, v2, v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v2, 0x5

    aput-object v1, v4, v2

    .line 397
    invoke-static {v0, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 400
    :try_start_69
    const-string/jumbo v1, "/sys/class/android_usb/android0/f_rndis/ethaddr"

    invoke-static {v1, v0}, Landroid/os/FileUtils;->stringToFile(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_6f
    .catch Ljava/io/IOException; {:try_start_69 .. :try_end_6f} :catch_70

    .line 404
    :goto_6f
    return-void

    .line 401
    :catch_70
    move-exception v0

    .line 402
    const-string/jumbo v0, "UsbDeviceManager"

    const-string/jumbo v1, "failed to write to /sys/class/android_usb/android0/f_rndis/ethaddr"

    invoke-static {v0, v1}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_6f
.end method

.method private isTv()Z
    .registers 3

    .prologue
    .line 407
    iget-object v0, p0, Lcom/android/server/usb/UsbDeviceManager;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    const-string/jumbo v1, "android.software.leanback"

    invoke-virtual {v0, v1}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method private native nativeGetAccessoryStrings()[Ljava/lang/String;
.end method

.method private native nativeGetAudioMode()I
.end method

.method private native nativeIsStartRequested()Z
.end method

.method private native nativeOpenAccessory()Landroid/os/ParcelFileDescriptor;
.end method

.method private readOemUsbOverrideConfig()V
    .registers 13

    .prologue
    const/4 v11, 0x2

    const/4 v10, 0x3

    const/4 v9, 0x1

    const/4 v2, 0x0

    .line 1312
    iget-object v0, p0, Lcom/android/server/usb/UsbDeviceManager;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 1313
    const v1, 0x1070034

    .line 1312
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v3

    .line 1315
    if-eqz v3, :cond_77

    .line 1316
    array-length v4, v3

    move v1, v2

    :goto_15
    if-ge v1, v4, :cond_77

    aget-object v0, v3, v1

    .line 1317
    const-string/jumbo v5, ":"

    invoke-virtual {v0, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    .line 1318
    array-length v0, v5

    if-eq v0, v10, :cond_27

    array-length v0, v5

    const/4 v6, 0x4

    if-ne v0, v6, :cond_64

    .line 1319
    :cond_27
    iget-object v0, p0, Lcom/android/server/usb/UsbDeviceManager;->mOemModeMap:Ljava/util/HashMap;

    if-nez v0, :cond_32

    .line 1320
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/android/server/usb/UsbDeviceManager;->mOemModeMap:Ljava/util/HashMap;

    .line 1323
    :cond_32
    iget-object v0, p0, Lcom/android/server/usb/UsbDeviceManager;->mOemModeMap:Ljava/util/HashMap;

    aget-object v6, v5, v2

    invoke-virtual {v0, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    .line 1324
    if-nez v0, :cond_4a

    .line 1325
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 1326
    iget-object v6, p0, Lcom/android/server/usb/UsbDeviceManager;->mOemModeMap:Ljava/util/HashMap;

    aget-object v7, v5, v2

    invoke-virtual {v6, v7, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1330
    :cond_4a
    aget-object v6, v5, v9

    invoke-virtual {v0, v6}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_64

    .line 1331
    array-length v6, v5

    if-ne v6, v10, :cond_68

    .line 1332
    aget-object v6, v5, v9

    new-instance v7, Landroid/util/Pair;

    aget-object v5, v5, v11

    const-string/jumbo v8, ""

    invoke-direct {v7, v5, v8}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v0, v6, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1316
    :cond_64
    :goto_64
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_15

    .line 1334
    :cond_68
    aget-object v6, v5, v9

    new-instance v7, Landroid/util/Pair;

    aget-object v8, v5, v11

    aget-object v5, v5, v10

    invoke-direct {v7, v8, v5}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v0, v6, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_64

    .line 1340
    :cond_77
    return-void
.end method

.method private startAccessoryMode()V
    .registers 7

    .prologue
    const/4 v1, 0x1

    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 357
    iget-boolean v0, p0, Lcom/android/server/usb/UsbDeviceManager;->mHasUsbAccessory:Z

    if-nez v0, :cond_8

    return-void

    .line 359
    :cond_8
    invoke-direct {p0}, Lcom/android/server/usb/UsbDeviceManager;->nativeGetAccessoryStrings()[Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/server/usb/UsbDeviceManager;->mAccessoryStrings:[Ljava/lang/String;

    .line 360
    invoke-direct {p0}, Lcom/android/server/usb/UsbDeviceManager;->nativeGetAudioMode()I

    move-result v0

    if-ne v0, v1, :cond_41

    move v0, v1

    .line 362
    :goto_15
    iget-object v4, p0, Lcom/android/server/usb/UsbDeviceManager;->mAccessoryStrings:[Ljava/lang/String;

    if-eqz v4, :cond_45

    .line 363
    iget-object v4, p0, Lcom/android/server/usb/UsbDeviceManager;->mAccessoryStrings:[Ljava/lang/String;

    aget-object v4, v4, v2

    if-eqz v4, :cond_45

    .line 364
    iget-object v4, p0, Lcom/android/server/usb/UsbDeviceManager;->mAccessoryStrings:[Ljava/lang/String;

    aget-object v4, v4, v1

    if-eqz v4, :cond_43

    .line 367
    :goto_25
    if-eqz v1, :cond_47

    if-eqz v0, :cond_47

    .line 368
    const-string/jumbo v0, "accessory,audio_source"

    .line 376
    :goto_2c
    if-eqz v0, :cond_40

    .line 377
    iget-object v1, p0, Lcom/android/server/usb/UsbDeviceManager;->mHandler:Lcom/android/server/usb/UsbDeviceManager$UsbHandler;

    iget-object v3, p0, Lcom/android/server/usb/UsbDeviceManager;->mHandler:Lcom/android/server/usb/UsbDeviceManager$UsbHandler;

    const/16 v4, 0x8

    invoke-virtual {v3, v4}, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v3

    .line 378
    const-wide/16 v4, 0x2710

    .line 377
    invoke-virtual {v1, v3, v4, v5}, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 379
    invoke-virtual {p0, v0, v2}, Lcom/android/server/usb/UsbDeviceManager;->setCurrentFunctions(Ljava/lang/String;Z)V

    .line 381
    :cond_40
    return-void

    :cond_41
    move v0, v2

    .line 360
    goto :goto_15

    :cond_43
    move v1, v2

    .line 364
    goto :goto_25

    :cond_45
    move v1, v2

    .line 362
    goto :goto_25

    .line 370
    :cond_47
    if-eqz v1, :cond_4d

    .line 371
    const-string/jumbo v0, "accessory"

    goto :goto_2c

    .line 372
    :cond_4d
    if-eqz v0, :cond_53

    .line 373
    const-string/jumbo v0, "audio_source"

    goto :goto_2c

    :cond_53
    move-object v0, v3

    goto :goto_2c
.end method


# virtual methods
.method public allowUsbDebugging(ZLjava/lang/String;)V
    .registers 4

    .prologue
    .line 1407
    iget-object v0, p0, Lcom/android/server/usb/UsbDeviceManager;->mDebuggingManager:Lcom/android/server/usb/UsbDebuggingManager;

    if-eqz v0, :cond_9

    .line 1408
    iget-object v0, p0, Lcom/android/server/usb/UsbDeviceManager;->mDebuggingManager:Lcom/android/server/usb/UsbDebuggingManager;

    invoke-virtual {v0, p1, p2}, Lcom/android/server/usb/UsbDebuggingManager;->allowUsbDebugging(ZLjava/lang/String;)V

    .line 1410
    :cond_9
    return-void
.end method

.method public bootCompleted()V
    .registers 3

    .prologue
    .line 342
    iget-object v0, p0, Lcom/android/server/usb/UsbDeviceManager;->mHandler:Lcom/android/server/usb/UsbDeviceManager$UsbHandler;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->sendEmptyMessage(I)Z

    .line 343
    return-void
.end method

.method public clearUsbDebuggingKeys()V
    .registers 3

    .prologue
    .line 1419
    iget-object v0, p0, Lcom/android/server/usb/UsbDeviceManager;->mDebuggingManager:Lcom/android/server/usb/UsbDebuggingManager;

    if-eqz v0, :cond_a

    .line 1420
    iget-object v0, p0, Lcom/android/server/usb/UsbDeviceManager;->mDebuggingManager:Lcom/android/server/usb/UsbDebuggingManager;

    invoke-virtual {v0}, Lcom/android/server/usb/UsbDebuggingManager;->clearUsbDebuggingKeys()V

    .line 1425
    return-void

    .line 1422
    :cond_a
    new-instance v0, Ljava/lang/RuntimeException;

    const-string/jumbo v1, "Cannot clear Usb Debugging keys, UsbDebuggingManager not enabled"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public denyUsbDebugging()V
    .registers 2

    .prologue
    .line 1413
    iget-object v0, p0, Lcom/android/server/usb/UsbDeviceManager;->mDebuggingManager:Lcom/android/server/usb/UsbDebuggingManager;

    if-eqz v0, :cond_9

    .line 1414
    iget-object v0, p0, Lcom/android/server/usb/UsbDeviceManager;->mDebuggingManager:Lcom/android/server/usb/UsbDebuggingManager;

    invoke-virtual {v0}, Lcom/android/server/usb/UsbDebuggingManager;->denyUsbDebugging()V

    .line 1416
    :cond_9
    return-void
.end method

.method public dump(Lcom/android/internal/util/IndentingPrintWriter;)V
    .registers 3

    .prologue
    .line 1428
    iget-object v0, p0, Lcom/android/server/usb/UsbDeviceManager;->mHandler:Lcom/android/server/usb/UsbDeviceManager$UsbHandler;

    if-eqz v0, :cond_9

    .line 1429
    iget-object v0, p0, Lcom/android/server/usb/UsbDeviceManager;->mHandler:Lcom/android/server/usb/UsbDeviceManager$UsbHandler;

    invoke-virtual {v0, p1}, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->dump(Lcom/android/internal/util/IndentingPrintWriter;)V

    .line 1431
    :cond_9
    iget-object v0, p0, Lcom/android/server/usb/UsbDeviceManager;->mDebuggingManager:Lcom/android/server/usb/UsbDebuggingManager;

    if-eqz v0, :cond_12

    .line 1432
    iget-object v0, p0, Lcom/android/server/usb/UsbDeviceManager;->mDebuggingManager:Lcom/android/server/usb/UsbDebuggingManager;

    invoke-virtual {v0, p1}, Lcom/android/server/usb/UsbDebuggingManager;->dump(Lcom/android/internal/util/IndentingPrintWriter;)V

    .line 1434
    :cond_12
    return-void
.end method

.method public getCurrentAccessory()Landroid/hardware/usb/UsbAccessory;
    .registers 2

    .prologue
    .line 1279
    iget-object v0, p0, Lcom/android/server/usb/UsbDeviceManager;->mHandler:Lcom/android/server/usb/UsbDeviceManager$UsbHandler;

    invoke-virtual {v0}, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->getCurrentAccessory()Landroid/hardware/usb/UsbAccessory;

    move-result-object v0

    return-object v0
.end method

.method public isFunctionEnabled(Ljava/lang/String;)Z
    .registers 3

    .prologue
    .line 1300
    const-string/jumbo v0, "sys.usb.config"

    invoke-static {v0}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p1}, Landroid/hardware/usb/UsbManager;->containsFunction(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public openAccessory(Landroid/hardware/usb/UsbAccessory;Lcom/android/server/usb/UsbUserSettingsManager;)Landroid/os/ParcelFileDescriptor;
    .registers 6

    .prologue
    .line 1285
    iget-object v0, p0, Lcom/android/server/usb/UsbDeviceManager;->mHandler:Lcom/android/server/usb/UsbDeviceManager$UsbHandler;

    invoke-virtual {v0}, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->getCurrentAccessory()Landroid/hardware/usb/UsbAccessory;

    move-result-object v0

    .line 1286
    if-nez v0, :cond_11

    .line 1287
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "no accessory attached"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1289
    :cond_11
    invoke-virtual {v0, p1}, Landroid/hardware/usb/UsbAccessory;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_39

    .line 1290
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Landroid/hardware/usb/UsbAccessory;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 1291
    const-string/jumbo v2, " does not match current accessory "

    .line 1290
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1293
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1295
    :cond_39
    invoke-virtual {p2, p1}, Lcom/android/server/usb/UsbUserSettingsManager;->checkPermission(Landroid/hardware/usb/UsbAccessory;)V

    .line 1296
    invoke-direct {p0}, Lcom/android/server/usb/UsbDeviceManager;->nativeOpenAccessory()Landroid/os/ParcelFileDescriptor;

    move-result-object v0

    return-object v0
.end method

.method public setCurrentFunctions(Ljava/lang/String;Z)V
    .registers 5

    .prologue
    .line 1308
    iget-object v0, p0, Lcom/android/server/usb/UsbDeviceManager;->mHandler:Lcom/android/server/usb/UsbDeviceManager$UsbHandler;

    const/4 v1, 0x2

    invoke-virtual {v0, v1, p1, p2}, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->sendMessage(ILjava/lang/Object;Z)V

    .line 1309
    return-void
.end method

.method public setCurrentUser(ILcom/android/server/usb/UsbProfileGroupSettingsManager;)V
    .registers 7

    .prologue
    .line 346
    iget-object v1, p0, Lcom/android/server/usb/UsbDeviceManager;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 347
    :try_start_3
    iput-object p2, p0, Lcom/android/server/usb/UsbDeviceManager;->mCurrentSettings:Lcom/android/server/usb/UsbProfileGroupSettingsManager;

    .line 348
    iget-object v0, p0, Lcom/android/server/usb/UsbDeviceManager;->mHandler:Lcom/android/server/usb/UsbDeviceManager$UsbHandler;

    const/4 v2, 0x5

    const/4 v3, 0x0

    invoke-virtual {v0, v2, p1, v3}, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->obtainMessage(III)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V
    :try_end_10
    .catchall {:try_start_3 .. :try_end_10} :catchall_12

    monitor-exit v1

    .line 350
    return-void

    .line 346
    :catchall_12
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public systemReady()V
    .registers 7

    .prologue
    const/4 v1, 0x0

    .line 307
    iget-object v0, p0, Lcom/android/server/usb/UsbDeviceManager;->mContext:Landroid/content/Context;

    const-string/jumbo v2, "notification"

    invoke-virtual {v0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 306
    check-cast v0, Landroid/app/NotificationManager;

    iput-object v0, p0, Lcom/android/server/usb/UsbDeviceManager;->mNotificationManager:Landroid/app/NotificationManager;

    .line 310
    invoke-direct {p0}, Lcom/android/server/usb/UsbDeviceManager;->isTv()Z

    move-result v0

    if-eqz v0, :cond_2b

    .line 312
    iget-object v0, p0, Lcom/android/server/usb/UsbDeviceManager;->mNotificationManager:Landroid/app/NotificationManager;

    .line 313
    new-instance v2, Landroid/app/NotificationChannel;

    const-string/jumbo v3, "usbdevicemanager.adb.tv"

    .line 314
    iget-object v4, p0, Lcom/android/server/usb/UsbDeviceManager;->mContext:Landroid/content/Context;

    .line 315
    const v5, 0x1040054

    .line 314
    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 317
    const/4 v5, 0x4

    .line 313
    invoke-direct {v2, v3, v4, v5}, Landroid/app/NotificationChannel;-><init>(Ljava/lang/String;Ljava/lang/CharSequence;I)V

    .line 312
    invoke-virtual {v0, v2}, Landroid/app/NotificationManager;->createNotificationChannel(Landroid/app/NotificationChannel;)V

    .line 323
    :cond_2b
    iget-object v0, p0, Lcom/android/server/usb/UsbDeviceManager;->mContext:Landroid/content/Context;

    invoke-static {v0}, Landroid/os/storage/StorageManager;->from(Landroid/content/Context;)Landroid/os/storage/StorageManager;

    move-result-object v0

    .line 324
    invoke-virtual {v0}, Landroid/os/storage/StorageManager;->getPrimaryVolume()Landroid/os/storage/StorageVolume;

    move-result-object v0

    .line 325
    if-eqz v0, :cond_60

    invoke-virtual {v0}, Landroid/os/storage/StorageVolume;->allowMassStorage()Z

    move-result v0

    .line 326
    :goto_3b
    if-nez v0, :cond_62

    iget-object v0, p0, Lcom/android/server/usb/UsbDeviceManager;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 327
    const v2, 0x11200b2

    .line 326
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v0

    :goto_4a
    iput-boolean v0, p0, Lcom/android/server/usb/UsbDeviceManager;->mUseUsbNotification:Z

    .line 331
    :try_start_4c
    iget-object v0, p0, Lcom/android/server/usb/UsbDeviceManager;->mContentResolver:Landroid/content/ContentResolver;

    .line 332
    const-string/jumbo v2, "adb_enabled"

    iget-boolean v3, p0, Lcom/android/server/usb/UsbDeviceManager;->mAdbEnabled:Z

    if-eqz v3, :cond_56

    const/4 v1, 0x1

    .line 331
    :cond_56
    invoke-static {v0, v2, v1}, Landroid/provider/Settings$Global;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z
    :try_end_59
    .catch Ljava/lang/SecurityException; {:try_start_4c .. :try_end_59} :catch_64

    .line 337
    :goto_59
    iget-object v0, p0, Lcom/android/server/usb/UsbDeviceManager;->mHandler:Lcom/android/server/usb/UsbDeviceManager$UsbHandler;

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->sendEmptyMessage(I)Z

    .line 338
    return-void

    :cond_60
    move v0, v1

    .line 325
    goto :goto_3b

    :cond_62
    move v0, v1

    .line 326
    goto :goto_4a

    .line 333
    :catch_64
    move-exception v0

    .line 335
    const-string/jumbo v0, "UsbDeviceManager"

    const-string/jumbo v1, "ADB_ENABLED is restricted."

    invoke-static {v0, v1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_59
.end method

.method public updateUserRestrictions()V
    .registers 3

    .prologue
    .line 353
    iget-object v0, p0, Lcom/android/server/usb/UsbDeviceManager;->mHandler:Lcom/android/server/usb/UsbDeviceManager$UsbHandler;

    const/4 v1, 0x6

    invoke-virtual {v0, v1}, Lcom/android/server/usb/UsbDeviceManager$UsbHandler;->sendEmptyMessage(I)Z

    .line 354
    return-void
.end method
