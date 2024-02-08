.class public Lcom/android/server/usb/UsbService;
.super Landroid/hardware/usb/IUsbManager$Stub;
.source "UsbService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/server/usb/UsbService$Lifecycle;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "UsbService"


# instance fields
.field private final mAlsaManager:Lcom/android/server/usb/UsbAlsaManager;

.field private final mContext:Landroid/content/Context;

.field private mCurrentUserId:I
    .annotation build Lcom/android/internal/annotations/GuardedBy;
        value = "mLock"
    .end annotation
.end field

.field private mDeviceManager:Lcom/android/server/usb/UsbDeviceManager;

.field private mHostManager:Lcom/android/server/usb/UsbHostManager;

.field private final mLock:Ljava/lang/Object;

.field private mPortManager:Lcom/android/server/usb/UsbPortManager;

.field private final mSettingsManager:Lcom/android/server/usb/UsbSettingsManager;

.field private final mUserManager:Landroid/os/UserManager;


# direct methods
.method static synthetic -get0(Lcom/android/server/usb/UsbService;)Lcom/android/server/usb/UsbDeviceManager;
    .registers 2

    iget-object v0, p0, Lcom/android/server/usb/UsbService;->mDeviceManager:Lcom/android/server/usb/UsbDeviceManager;

    return-object v0
.end method

.method static synthetic -wrap0(Lcom/android/server/usb/UsbService;Landroid/os/UserHandle;)V
    .registers 2

    invoke-direct {p0, p1}, Lcom/android/server/usb/UsbService;->onStopUser(Landroid/os/UserHandle;)V

    return-void
.end method

.method static synthetic -wrap1(Lcom/android/server/usb/UsbService;I)V
    .registers 2

    invoke-direct {p0, p1}, Lcom/android/server/usb/UsbService;->onSwitchUser(I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 6

    .prologue
    const/4 v3, 0x0

    .line 117
    invoke-direct {p0}, Landroid/hardware/usb/IUsbManager$Stub;-><init>()V

    .line 111
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/android/server/usb/UsbService;->mLock:Ljava/lang/Object;

    .line 118
    iput-object p1, p0, Lcom/android/server/usb/UsbService;->mContext:Landroid/content/Context;

    .line 120
    const-class v0, Landroid/os/UserManager;

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/UserManager;

    iput-object v0, p0, Lcom/android/server/usb/UsbService;->mUserManager:Landroid/os/UserManager;

    .line 121
    new-instance v0, Lcom/android/server/usb/UsbSettingsManager;

    invoke-direct {v0, p1}, Lcom/android/server/usb/UsbSettingsManager;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/android/server/usb/UsbService;->mSettingsManager:Lcom/android/server/usb/UsbSettingsManager;

    .line 122
    new-instance v0, Lcom/android/server/usb/UsbAlsaManager;

    invoke-direct {v0, p1}, Lcom/android/server/usb/UsbAlsaManager;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/android/server/usb/UsbService;->mAlsaManager:Lcom/android/server/usb/UsbAlsaManager;

    .line 124
    iget-object v0, p0, Lcom/android/server/usb/UsbService;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    .line 125
    const-string/jumbo v1, "android.hardware.usb.host"

    invoke-virtual {v0, v1}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3f

    .line 126
    new-instance v0, Lcom/android/server/usb/UsbHostManager;

    iget-object v1, p0, Lcom/android/server/usb/UsbService;->mAlsaManager:Lcom/android/server/usb/UsbAlsaManager;

    iget-object v2, p0, Lcom/android/server/usb/UsbService;->mSettingsManager:Lcom/android/server/usb/UsbSettingsManager;

    invoke-direct {v0, p1, v1, v2}, Lcom/android/server/usb/UsbHostManager;-><init>(Landroid/content/Context;Lcom/android/server/usb/UsbAlsaManager;Lcom/android/server/usb/UsbSettingsManager;)V

    iput-object v0, p0, Lcom/android/server/usb/UsbService;->mHostManager:Lcom/android/server/usb/UsbHostManager;

    .line 128
    :cond_3f
    new-instance v0, Ljava/io/File;

    const-string/jumbo v1, "/sys/class/android_usb"

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_58

    .line 129
    new-instance v0, Lcom/android/server/usb/UsbDeviceManager;

    iget-object v1, p0, Lcom/android/server/usb/UsbService;->mAlsaManager:Lcom/android/server/usb/UsbAlsaManager;

    iget-object v2, p0, Lcom/android/server/usb/UsbService;->mSettingsManager:Lcom/android/server/usb/UsbSettingsManager;

    invoke-direct {v0, p1, v1, v2}, Lcom/android/server/usb/UsbDeviceManager;-><init>(Landroid/content/Context;Lcom/android/server/usb/UsbAlsaManager;Lcom/android/server/usb/UsbSettingsManager;)V

    iput-object v0, p0, Lcom/android/server/usb/UsbService;->mDeviceManager:Lcom/android/server/usb/UsbDeviceManager;

    .line 131
    :cond_58
    iget-object v0, p0, Lcom/android/server/usb/UsbService;->mHostManager:Lcom/android/server/usb/UsbHostManager;

    if-nez v0, :cond_60

    iget-object v0, p0, Lcom/android/server/usb/UsbService;->mDeviceManager:Lcom/android/server/usb/UsbDeviceManager;

    if-eqz v0, :cond_67

    .line 132
    :cond_60
    new-instance v0, Lcom/android/server/usb/UsbPortManager;

    invoke-direct {v0, p1}, Lcom/android/server/usb/UsbPortManager;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/android/server/usb/UsbService;->mPortManager:Lcom/android/server/usb/UsbPortManager;

    .line 135
    :cond_67
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/android/server/usb/UsbService;->onSwitchUser(I)V

    .line 137
    new-instance v0, Lcom/android/server/usb/UsbService$1;

    invoke-direct {v0, p0}, Lcom/android/server/usb/UsbService$1;-><init>(Lcom/android/server/usb/UsbService;)V

    .line 150
    new-instance v1, Landroid/content/IntentFilter;

    invoke-direct {v1}, Landroid/content/IntentFilter;-><init>()V

    .line 151
    const/16 v2, 0x3e8

    invoke-virtual {v1, v2}, Landroid/content/IntentFilter;->setPriority(I)V

    .line 152
    const-string/jumbo v2, "android.app.action.DEVICE_POLICY_MANAGER_STATE_CHANGED"

    invoke-virtual {v1, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 153
    iget-object v2, p0, Lcom/android/server/usb/UsbService;->mContext:Landroid/content/Context;

    invoke-virtual {v2, v0, v1, v3, v3}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;)Landroid/content/Intent;

    .line 154
    return-void
.end method

.method private getSettingsForUser(I)Lcom/android/server/usb/UsbUserSettingsManager;
    .registers 3

    .prologue
    .line 114
    iget-object v0, p0, Lcom/android/server/usb/UsbService;->mSettingsManager:Lcom/android/server/usb/UsbSettingsManager;

    invoke-virtual {v0, p1}, Lcom/android/server/usb/UsbSettingsManager;->getSettingsForUser(I)Lcom/android/server/usb/UsbUserSettingsManager;

    move-result-object v0

    return-object v0
.end method

.method private isCallerInCurrentUserProfileGroupLocked()Z
    .registers 6

    .prologue
    .line 223
    invoke-static {}, Landroid/os/UserHandle;->getCallingUserId()I

    move-result v0

    .line 225
    invoke-static {}, Lcom/android/server/usb/UsbService;->clearCallingIdentity()J

    move-result-wide v2

    .line 227
    :try_start_8
    iget-object v1, p0, Lcom/android/server/usb/UsbService;->mUserManager:Landroid/os/UserManager;

    iget v4, p0, Lcom/android/server/usb/UsbService;->mCurrentUserId:I

    invoke-virtual {v1, v0, v4}, Landroid/os/UserManager;->isSameProfileGroup(II)Z
    :try_end_f
    .catchall {:try_start_8 .. :try_end_f} :catchall_14

    move-result v0

    .line 229
    invoke-static {v2, v3}, Lcom/android/server/usb/UsbService;->restoreCallingIdentity(J)V

    .line 227
    return v0

    .line 228
    :catchall_14
    move-exception v0

    .line 229
    invoke-static {v2, v3}, Lcom/android/server/usb/UsbService;->restoreCallingIdentity(J)V

    .line 228
    throw v0
.end method

.method private static isSupportedCurrentFunction(Ljava/lang/String;)Z
    .registers 3

    .prologue
    const/4 v1, 0x1

    .line 393
    if-nez p0, :cond_4

    return v1

    .line 395
    :cond_4
    const-string/jumbo v0, "none"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_e

    .line 403
    :cond_d
    return v1

    .line 395
    :cond_e
    const-string/jumbo v0, "audio_source"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_d

    const-string/jumbo v0, "midi"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_d

    const-string/jumbo v0, "mtp"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_d

    const-string/jumbo v0, "ptp"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_d

    const-string/jumbo v0, "rndis"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_d

    const-string/jumbo v0, "via_bypass"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_d

    .line 406
    const/4 v0, 0x0

    return v0
.end method

.method private onStopUser(Landroid/os/UserHandle;)V
    .registers 3

    .prologue
    .line 185
    iget-object v0, p0, Lcom/android/server/usb/UsbService;->mSettingsManager:Lcom/android/server/usb/UsbSettingsManager;

    invoke-virtual {v0, p1}, Lcom/android/server/usb/UsbSettingsManager;->remove(Landroid/os/UserHandle;)V

    .line 186
    return-void
.end method

.method private onSwitchUser(I)V
    .registers 5

    .prologue
    .line 162
    iget-object v1, p0, Lcom/android/server/usb/UsbService;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 163
    :try_start_3
    iput p1, p0, Lcom/android/server/usb/UsbService;->mCurrentUserId:I

    .line 169
    iget-object v0, p0, Lcom/android/server/usb/UsbService;->mSettingsManager:Lcom/android/server/usb/UsbSettingsManager;

    invoke-static {p1}, Landroid/os/UserHandle;->of(I)Landroid/os/UserHandle;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/android/server/usb/UsbSettingsManager;->getSettingsForProfileGroup(Landroid/os/UserHandle;)Lcom/android/server/usb/UsbProfileGroupSettingsManager;

    move-result-object v0

    .line 170
    iget-object v2, p0, Lcom/android/server/usb/UsbService;->mHostManager:Lcom/android/server/usb/UsbHostManager;

    if-eqz v2, :cond_18

    .line 171
    iget-object v2, p0, Lcom/android/server/usb/UsbService;->mHostManager:Lcom/android/server/usb/UsbHostManager;

    invoke-virtual {v2, v0}, Lcom/android/server/usb/UsbHostManager;->setCurrentUserSettings(Lcom/android/server/usb/UsbProfileGroupSettingsManager;)V

    .line 173
    :cond_18
    iget-object v2, p0, Lcom/android/server/usb/UsbService;->mDeviceManager:Lcom/android/server/usb/UsbDeviceManager;

    if-eqz v2, :cond_21

    .line 174
    iget-object v2, p0, Lcom/android/server/usb/UsbService;->mDeviceManager:Lcom/android/server/usb/UsbDeviceManager;

    invoke-virtual {v2, p1, v0}, Lcom/android/server/usb/UsbDeviceManager;->setCurrentUser(ILcom/android/server/usb/UsbProfileGroupSettingsManager;)V
    :try_end_21
    .catchall {:try_start_3 .. :try_end_21} :catchall_23

    :cond_21
    monitor-exit v1

    .line 177
    return-void

    .line 162
    :catchall_23
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method private static removeLastChar(Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    .prologue
    .line 686
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    const/4 v1, 0x0

    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public allowUsbDebugging(ZLjava/lang/String;)V
    .registers 6

    .prologue
    .line 411
    iget-object v0, p0, Lcom/android/server/usb/UsbService;->mContext:Landroid/content/Context;

    const-string/jumbo v1, "android.permission.MANAGE_USB"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    .line 412
    iget-object v0, p0, Lcom/android/server/usb/UsbService;->mDeviceManager:Lcom/android/server/usb/UsbDeviceManager;

    invoke-virtual {v0, p1, p2}, Lcom/android/server/usb/UsbDeviceManager;->allowUsbDebugging(ZLjava/lang/String;)V

    .line 413
    return-void
.end method

.method public bootCompleted()V
    .registers 2

    .prologue
    .line 203
    iget-object v0, p0, Lcom/android/server/usb/UsbService;->mDeviceManager:Lcom/android/server/usb/UsbDeviceManager;

    if-eqz v0, :cond_9

    .line 204
    iget-object v0, p0, Lcom/android/server/usb/UsbService;->mDeviceManager:Lcom/android/server/usb/UsbDeviceManager;

    invoke-virtual {v0}, Lcom/android/server/usb/UsbDeviceManager;->bootCompleted()V

    .line 206
    :cond_9
    return-void
.end method

.method public clearDefaults(Ljava/lang/String;I)V
    .registers 7

    .prologue
    .line 361
    invoke-static {p1}, Lcom/android/internal/util/Preconditions;->checkStringNotEmpty(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 363
    iget-object v1, p0, Lcom/android/server/usb/UsbService;->mContext:Landroid/content/Context;

    const-string/jumbo v2, "android.permission.MANAGE_USB"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    .line 365
    invoke-static {p2}, Landroid/os/UserHandle;->of(I)Landroid/os/UserHandle;

    move-result-object v1

    .line 366
    iget-object v2, p0, Lcom/android/server/usb/UsbService;->mSettingsManager:Lcom/android/server/usb/UsbSettingsManager;

    invoke-virtual {v2, v1}, Lcom/android/server/usb/UsbSettingsManager;->getSettingsForProfileGroup(Landroid/os/UserHandle;)Lcom/android/server/usb/UsbProfileGroupSettingsManager;

    move-result-object v2

    invoke-virtual {v2, v0, v1}, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->clearDefaults(Ljava/lang/String;Landroid/os/UserHandle;)V

    .line 367
    return-void
.end method

.method public clearUsbDebuggingKeys()V
    .registers 4

    .prologue
    .line 423
    iget-object v0, p0, Lcom/android/server/usb/UsbService;->mContext:Landroid/content/Context;

    const-string/jumbo v1, "android.permission.MANAGE_USB"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    .line 424
    iget-object v0, p0, Lcom/android/server/usb/UsbService;->mDeviceManager:Lcom/android/server/usb/UsbDeviceManager;

    invoke-virtual {v0}, Lcom/android/server/usb/UsbDeviceManager;->clearUsbDebuggingKeys()V

    .line 425
    return-void
.end method

.method public denyUsbDebugging()V
    .registers 4

    .prologue
    .line 417
    iget-object v0, p0, Lcom/android/server/usb/UsbService;->mContext:Landroid/content/Context;

    const-string/jumbo v1, "android.permission.MANAGE_USB"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    .line 418
    iget-object v0, p0, Lcom/android/server/usb/UsbService;->mDeviceManager:Lcom/android/server/usb/UsbDeviceManager;

    invoke-virtual {v0}, Lcom/android/server/usb/UsbDeviceManager;->denyUsbDebugging()V

    .line 419
    return-void
.end method

.method public dump(Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V
    .registers 16

    .prologue
    .line 485
    iget-object v0, p0, Lcom/android/server/usb/UsbService;->mContext:Landroid/content/Context;

    const-string/jumbo v1, "UsbService"

    invoke-static {v0, v1, p2}, Lcom/android/internal/util/DumpUtils;->checkDumpPermission(Landroid/content/Context;Ljava/lang/String;Ljava/io/PrintWriter;)Z

    move-result v0

    if-nez v0, :cond_c

    return-void

    .line 487
    :cond_c
    new-instance v8, Lcom/android/internal/util/IndentingPrintWriter;

    const-string/jumbo v0, "  "

    invoke-direct {v8, p2, v0}, Lcom/android/internal/util/IndentingPrintWriter;-><init>(Ljava/io/Writer;Ljava/lang/String;)V

    .line 488
    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J

    move-result-wide v10

    .line 490
    if-eqz p3, :cond_1d

    :try_start_1a
    array-length v0, p3

    if-nez v0, :cond_4f

    .line 491
    :cond_1d
    const-string/jumbo v0, "USB Manager State:"

    invoke-virtual {v8, v0}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V

    .line 492
    invoke-virtual {v8}, Lcom/android/internal/util/IndentingPrintWriter;->increaseIndent()V

    .line 493
    iget-object v0, p0, Lcom/android/server/usb/UsbService;->mDeviceManager:Lcom/android/server/usb/UsbDeviceManager;

    if-eqz v0, :cond_2f

    .line 494
    iget-object v0, p0, Lcom/android/server/usb/UsbService;->mDeviceManager:Lcom/android/server/usb/UsbDeviceManager;

    invoke-virtual {v0, v8}, Lcom/android/server/usb/UsbDeviceManager;->dump(Lcom/android/internal/util/IndentingPrintWriter;)V

    .line 496
    :cond_2f
    iget-object v0, p0, Lcom/android/server/usb/UsbService;->mHostManager:Lcom/android/server/usb/UsbHostManager;

    if-eqz v0, :cond_38

    .line 497
    iget-object v0, p0, Lcom/android/server/usb/UsbService;->mHostManager:Lcom/android/server/usb/UsbHostManager;

    invoke-virtual {v0, v8}, Lcom/android/server/usb/UsbHostManager;->dump(Lcom/android/internal/util/IndentingPrintWriter;)V

    .line 499
    :cond_38
    iget-object v0, p0, Lcom/android/server/usb/UsbService;->mPortManager:Lcom/android/server/usb/UsbPortManager;

    if-eqz v0, :cond_41

    .line 500
    iget-object v0, p0, Lcom/android/server/usb/UsbService;->mPortManager:Lcom/android/server/usb/UsbPortManager;

    invoke-virtual {v0, v8}, Lcom/android/server/usb/UsbPortManager;->dump(Lcom/android/internal/util/IndentingPrintWriter;)V

    .line 502
    :cond_41
    iget-object v0, p0, Lcom/android/server/usb/UsbService;->mAlsaManager:Lcom/android/server/usb/UsbAlsaManager;

    invoke-virtual {v0, v8}, Lcom/android/server/usb/UsbAlsaManager;->dump(Lcom/android/internal/util/IndentingPrintWriter;)V

    .line 504
    iget-object v0, p0, Lcom/android/server/usb/UsbService;->mSettingsManager:Lcom/android/server/usb/UsbSettingsManager;

    invoke-virtual {v0, v8}, Lcom/android/server/usb/UsbSettingsManager;->dump(Lcom/android/internal/util/IndentingPrintWriter;)V
    :try_end_4b
    .catchall {:try_start_1a .. :try_end_4b} :catchall_9b

    .line 681
    :cond_4b
    :goto_4b
    invoke-static {v10, v11}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 683
    return-void

    .line 490
    :cond_4f
    :try_start_4f
    const-string/jumbo v0, "-a"

    const/4 v1, 0x0

    aget-object v1, p3, v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1d

    .line 505
    array-length v0, p3

    const/4 v1, 0x4

    if-ne v0, v1, :cond_10a

    const-string/jumbo v0, "set-port-roles"

    const/4 v1, 0x0

    aget-object v1, p3, v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_10a

    .line 506
    const/4 v0, 0x1

    aget-object v2, p3, v0

    .line 508
    const/4 v0, 0x2

    aget-object v0, p3, v0

    const-string/jumbo v1, "source"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_a0

    .line 510
    const/4 v0, 0x1

    move v1, v0

    .line 523
    :goto_7c
    const/4 v0, 0x3

    aget-object v0, p3, v0

    const-string/jumbo v3, "host"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_d6

    .line 525
    const/4 v0, 0x1

    .line 537
    :goto_89
    iget-object v3, p0, Lcom/android/server/usb/UsbService;->mPortManager:Lcom/android/server/usb/UsbPortManager;

    if-eqz v3, :cond_4b

    .line 538
    iget-object v3, p0, Lcom/android/server/usb/UsbService;->mPortManager:Lcom/android/server/usb/UsbPortManager;

    invoke-virtual {v3, v2, v1, v0, v8}, Lcom/android/server/usb/UsbPortManager;->setPortRoles(Ljava/lang/String;IILcom/android/internal/util/IndentingPrintWriter;)V

    .line 544
    invoke-virtual {v8}, Lcom/android/internal/util/IndentingPrintWriter;->println()V

    .line 545
    iget-object v0, p0, Lcom/android/server/usb/UsbService;->mPortManager:Lcom/android/server/usb/UsbPortManager;

    invoke-virtual {v0, v8}, Lcom/android/server/usb/UsbPortManager;->dump(Lcom/android/internal/util/IndentingPrintWriter;)V
    :try_end_9a
    .catchall {:try_start_4f .. :try_end_9a} :catchall_9b

    goto :goto_4b

    .line 680
    :catchall_9b
    move-exception v0

    .line 681
    invoke-static {v10, v11}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 680
    throw v0

    .line 508
    :cond_a0
    :try_start_a0
    const-string/jumbo v1, "sink"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_ac

    .line 513
    const/4 v0, 0x2

    move v1, v0

    .line 514
    goto :goto_7c

    .line 508
    :cond_ac
    const-string/jumbo v1, "no-power"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_b8

    .line 516
    const/4 v0, 0x0

    move v1, v0

    .line 517
    goto :goto_7c

    .line 519
    :cond_b8
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "Invalid power role: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/4 v1, 0x2

    aget-object v1, p3, v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v8, v0}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V
    :try_end_d2
    .catchall {:try_start_a0 .. :try_end_d2} :catchall_9b

    .line 681
    invoke-static {v10, v11}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 520
    return-void

    .line 523
    :cond_d6
    :try_start_d6
    const-string/jumbo v3, "device"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_e1

    .line 528
    const/4 v0, 0x2

    .line 529
    goto :goto_89

    .line 523
    :cond_e1
    const-string/jumbo v3, "no-data"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_ec

    .line 531
    const/4 v0, 0x0

    .line 532
    goto :goto_89

    .line 534
    :cond_ec
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "Invalid data role: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/4 v1, 0x3

    aget-object v1, p3, v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v8, v0}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V
    :try_end_106
    .catchall {:try_start_d6 .. :try_end_106} :catchall_9b

    .line 681
    invoke-static {v10, v11}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 535
    return-void

    .line 547
    :cond_10a
    :try_start_10a
    array-length v0, p3

    const/4 v1, 0x3

    if-ne v0, v1, :cond_17c

    const-string/jumbo v0, "add-port"

    const/4 v1, 0x0

    aget-object v1, p3, v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_17c

    .line 548
    const/4 v0, 0x1

    aget-object v1, p3, v0

    .line 550
    const/4 v0, 0x2

    aget-object v0, p3, v0

    const-string/jumbo v2, "ufp"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_13d

    .line 552
    const/4 v0, 0x1

    .line 567
    :goto_12a
    iget-object v2, p0, Lcom/android/server/usb/UsbService;->mPortManager:Lcom/android/server/usb/UsbPortManager;

    if-eqz v2, :cond_4b

    .line 568
    iget-object v2, p0, Lcom/android/server/usb/UsbService;->mPortManager:Lcom/android/server/usb/UsbPortManager;

    invoke-virtual {v2, v1, v0, v8}, Lcom/android/server/usb/UsbPortManager;->addSimulatedPort(Ljava/lang/String;ILcom/android/internal/util/IndentingPrintWriter;)V

    .line 569
    invoke-virtual {v8}, Lcom/android/internal/util/IndentingPrintWriter;->println()V

    .line 570
    iget-object v0, p0, Lcom/android/server/usb/UsbService;->mPortManager:Lcom/android/server/usb/UsbPortManager;

    invoke-virtual {v0, v8}, Lcom/android/server/usb/UsbPortManager;->dump(Lcom/android/internal/util/IndentingPrintWriter;)V

    goto/16 :goto_4b

    .line 550
    :cond_13d
    const-string/jumbo v2, "dfp"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_148

    .line 555
    const/4 v0, 0x2

    .line 556
    goto :goto_12a

    .line 550
    :cond_148
    const-string/jumbo v2, "dual"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_153

    .line 558
    const/4 v0, 0x3

    .line 559
    goto :goto_12a

    .line 550
    :cond_153
    const-string/jumbo v2, "none"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_15e

    .line 561
    const/4 v0, 0x0

    .line 562
    goto :goto_12a

    .line 564
    :cond_15e
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "Invalid mode: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/4 v1, 0x2

    aget-object v1, p3, v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v8, v0}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V
    :try_end_178
    .catchall {:try_start_10a .. :try_end_178} :catchall_9b

    .line 681
    invoke-static {v10, v11}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 565
    return-void

    .line 572
    :cond_17c
    :try_start_17c
    array-length v0, p3

    const/4 v1, 0x5

    if-ne v0, v1, :cond_280

    const-string/jumbo v0, "connect-port"

    const/4 v1, 0x0

    aget-object v1, p3, v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_280

    .line 573
    const/4 v0, 0x1

    aget-object v1, p3, v0

    .line 575
    const/4 v0, 0x2

    aget-object v0, p3, v0

    const-string/jumbo v2, "?"

    invoke-virtual {v0, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    .line 576
    if-eqz v3, :cond_1f9

    const/4 v0, 0x2

    aget-object v0, p3, v0

    invoke-static {v0}, Lcom/android/server/usb/UsbService;->removeLastChar(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_1a2
    const-string/jumbo v2, "ufp"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1fd

    .line 578
    const/4 v2, 0x1

    .line 588
    :goto_1ac
    const/4 v0, 0x3

    aget-object v0, p3, v0

    const-string/jumbo v4, "?"

    invoke-virtual {v0, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v5

    .line 589
    if-eqz v5, :cond_226

    const/4 v0, 0x3

    aget-object v0, p3, v0

    invoke-static {v0}, Lcom/android/server/usb/UsbService;->removeLastChar(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_1bf
    const-string/jumbo v4, "source"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_22a

    .line 591
    const/4 v4, 0x1

    .line 601
    :goto_1c9
    const/4 v0, 0x4

    aget-object v0, p3, v0

    const-string/jumbo v6, "?"

    invoke-virtual {v0, v6}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v7

    .line 602
    if-eqz v7, :cond_253

    const/4 v0, 0x4

    aget-object v0, p3, v0

    invoke-static {v0}, Lcom/android/server/usb/UsbService;->removeLastChar(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_1dc
    const-string/jumbo v6, "host"

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_257

    .line 604
    const/4 v6, 0x1

    .line 613
    :goto_1e6
    iget-object v0, p0, Lcom/android/server/usb/UsbService;->mPortManager:Lcom/android/server/usb/UsbPortManager;

    if-eqz v0, :cond_4b

    .line 614
    iget-object v0, p0, Lcom/android/server/usb/UsbService;->mPortManager:Lcom/android/server/usb/UsbPortManager;

    invoke-virtual/range {v0 .. v8}, Lcom/android/server/usb/UsbPortManager;->connectSimulatedPort(Ljava/lang/String;IZIZIZLcom/android/internal/util/IndentingPrintWriter;)V

    .line 616
    invoke-virtual {v8}, Lcom/android/internal/util/IndentingPrintWriter;->println()V

    .line 617
    iget-object v0, p0, Lcom/android/server/usb/UsbService;->mPortManager:Lcom/android/server/usb/UsbPortManager;

    invoke-virtual {v0, v8}, Lcom/android/server/usb/UsbPortManager;->dump(Lcom/android/internal/util/IndentingPrintWriter;)V

    goto/16 :goto_4b

    .line 576
    :cond_1f9
    const/4 v0, 0x2

    aget-object v0, p3, v0

    goto :goto_1a2

    :cond_1fd
    const-string/jumbo v2, "dfp"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_208

    .line 581
    const/4 v2, 0x2

    .line 582
    goto :goto_1ac

    .line 584
    :cond_208
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "Invalid mode: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/4 v1, 0x2

    aget-object v1, p3, v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v8, v0}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V
    :try_end_222
    .catchall {:try_start_17c .. :try_end_222} :catchall_9b

    .line 681
    invoke-static {v10, v11}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 585
    return-void

    .line 589
    :cond_226
    const/4 v0, 0x3

    :try_start_227
    aget-object v0, p3, v0

    goto :goto_1bf

    :cond_22a
    const-string/jumbo v4, "sink"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_235

    .line 594
    const/4 v4, 0x2

    .line 595
    goto :goto_1c9

    .line 597
    :cond_235
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "Invalid power role: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/4 v1, 0x3

    aget-object v1, p3, v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v8, v0}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V
    :try_end_24f
    .catchall {:try_start_227 .. :try_end_24f} :catchall_9b

    .line 681
    invoke-static {v10, v11}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 598
    return-void

    .line 602
    :cond_253
    const/4 v0, 0x4

    :try_start_254
    aget-object v0, p3, v0

    goto :goto_1dc

    :cond_257
    const-string/jumbo v6, "device"

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_262

    .line 607
    const/4 v6, 0x2

    .line 608
    goto :goto_1e6

    .line 610
    :cond_262
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "Invalid data role: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/4 v1, 0x4

    aget-object v1, p3, v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v8, v0}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V
    :try_end_27c
    .catchall {:try_start_254 .. :try_end_27c} :catchall_9b

    .line 681
    invoke-static {v10, v11}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 611
    return-void

    .line 619
    :cond_280
    :try_start_280
    array-length v0, p3

    const/4 v1, 0x2

    if-ne v0, v1, :cond_2a6

    const-string/jumbo v0, "disconnect-port"

    const/4 v1, 0x0

    aget-object v1, p3, v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2a6

    .line 620
    const/4 v0, 0x1

    aget-object v0, p3, v0

    .line 621
    iget-object v1, p0, Lcom/android/server/usb/UsbService;->mPortManager:Lcom/android/server/usb/UsbPortManager;

    if-eqz v1, :cond_4b

    .line 622
    iget-object v1, p0, Lcom/android/server/usb/UsbService;->mPortManager:Lcom/android/server/usb/UsbPortManager;

    invoke-virtual {v1, v0, v8}, Lcom/android/server/usb/UsbPortManager;->disconnectSimulatedPort(Ljava/lang/String;Lcom/android/internal/util/IndentingPrintWriter;)V

    .line 623
    invoke-virtual {v8}, Lcom/android/internal/util/IndentingPrintWriter;->println()V

    .line 624
    iget-object v0, p0, Lcom/android/server/usb/UsbService;->mPortManager:Lcom/android/server/usb/UsbPortManager;

    invoke-virtual {v0, v8}, Lcom/android/server/usb/UsbPortManager;->dump(Lcom/android/internal/util/IndentingPrintWriter;)V

    goto/16 :goto_4b

    .line 626
    :cond_2a6
    array-length v0, p3

    const/4 v1, 0x2

    if-ne v0, v1, :cond_2cc

    const-string/jumbo v0, "remove-port"

    const/4 v1, 0x0

    aget-object v1, p3, v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2cc

    .line 627
    const/4 v0, 0x1

    aget-object v0, p3, v0

    .line 628
    iget-object v1, p0, Lcom/android/server/usb/UsbService;->mPortManager:Lcom/android/server/usb/UsbPortManager;

    if-eqz v1, :cond_4b

    .line 629
    iget-object v1, p0, Lcom/android/server/usb/UsbService;->mPortManager:Lcom/android/server/usb/UsbPortManager;

    invoke-virtual {v1, v0, v8}, Lcom/android/server/usb/UsbPortManager;->removeSimulatedPort(Ljava/lang/String;Lcom/android/internal/util/IndentingPrintWriter;)V

    .line 630
    invoke-virtual {v8}, Lcom/android/internal/util/IndentingPrintWriter;->println()V

    .line 631
    iget-object v0, p0, Lcom/android/server/usb/UsbService;->mPortManager:Lcom/android/server/usb/UsbPortManager;

    invoke-virtual {v0, v8}, Lcom/android/server/usb/UsbPortManager;->dump(Lcom/android/internal/util/IndentingPrintWriter;)V

    goto/16 :goto_4b

    .line 633
    :cond_2cc
    array-length v0, p3

    const/4 v1, 0x1

    if-ne v0, v1, :cond_2ef

    const-string/jumbo v0, "reset"

    const/4 v1, 0x0

    aget-object v1, p3, v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2ef

    .line 634
    iget-object v0, p0, Lcom/android/server/usb/UsbService;->mPortManager:Lcom/android/server/usb/UsbPortManager;

    if-eqz v0, :cond_4b

    .line 635
    iget-object v0, p0, Lcom/android/server/usb/UsbService;->mPortManager:Lcom/android/server/usb/UsbPortManager;

    invoke-virtual {v0, v8}, Lcom/android/server/usb/UsbPortManager;->resetSimulation(Lcom/android/internal/util/IndentingPrintWriter;)V

    .line 636
    invoke-virtual {v8}, Lcom/android/internal/util/IndentingPrintWriter;->println()V

    .line 637
    iget-object v0, p0, Lcom/android/server/usb/UsbService;->mPortManager:Lcom/android/server/usb/UsbPortManager;

    invoke-virtual {v0, v8}, Lcom/android/server/usb/UsbPortManager;->dump(Lcom/android/internal/util/IndentingPrintWriter;)V

    goto/16 :goto_4b

    .line 639
    :cond_2ef
    array-length v0, p3

    const/4 v1, 0x1

    if-ne v0, v1, :cond_30a

    const-string/jumbo v0, "ports"

    const/4 v1, 0x0

    aget-object v1, p3, v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_30a

    .line 640
    iget-object v0, p0, Lcom/android/server/usb/UsbService;->mPortManager:Lcom/android/server/usb/UsbPortManager;

    if-eqz v0, :cond_4b

    .line 641
    iget-object v0, p0, Lcom/android/server/usb/UsbService;->mPortManager:Lcom/android/server/usb/UsbPortManager;

    invoke-virtual {v0, v8}, Lcom/android/server/usb/UsbPortManager;->dump(Lcom/android/internal/util/IndentingPrintWriter;)V

    goto/16 :goto_4b

    .line 644
    :cond_30a
    const-string/jumbo v0, "Dump current USB state or issue command:"

    invoke-virtual {v8, v0}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V

    .line 645
    const-string/jumbo v0, "  ports"

    invoke-virtual {v8, v0}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V

    .line 646
    const-string/jumbo v0, "  set-port-roles <id> <source|sink|no-power> <host|device|no-data>"

    invoke-virtual {v8, v0}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V

    .line 647
    const-string/jumbo v0, "  add-port <id> <ufp|dfp|dual|none>"

    invoke-virtual {v8, v0}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V

    .line 648
    const-string/jumbo v0, "  connect-port <id> <ufp|dfp><?> <source|sink><?> <host|device><?>"

    invoke-virtual {v8, v0}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V

    .line 649
    const-string/jumbo v0, "    (add ? suffix if mode, power role, or data role can be changed)"

    invoke-virtual {v8, v0}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V

    .line 650
    const-string/jumbo v0, "  disconnect-port <id>"

    invoke-virtual {v8, v0}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V

    .line 651
    const-string/jumbo v0, "  remove-port <id>"

    invoke-virtual {v8, v0}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V

    .line 652
    const-string/jumbo v0, "  reset"

    invoke-virtual {v8, v0}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V

    .line 653
    invoke-virtual {v8}, Lcom/android/internal/util/IndentingPrintWriter;->println()V

    .line 654
    const-string/jumbo v0, "Example USB type C port role switch:"

    invoke-virtual {v8, v0}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V

    .line 655
    const-string/jumbo v0, "  dumpsys usb set-port-roles \"default\" source device"

    invoke-virtual {v8, v0}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V

    .line 656
    invoke-virtual {v8}, Lcom/android/internal/util/IndentingPrintWriter;->println()V

    .line 657
    const-string/jumbo v0, "Example USB type C port simulation with full capabilities:"

    invoke-virtual {v8, v0}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V

    .line 658
    const-string/jumbo v0, "  dumpsys usb add-port \"matrix\" dual"

    invoke-virtual {v8, v0}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V

    .line 659
    const-string/jumbo v0, "  dumpsys usb connect-port \"matrix\" ufp? sink? device?"

    invoke-virtual {v8, v0}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V

    .line 660
    const-string/jumbo v0, "  dumpsys usb ports"

    invoke-virtual {v8, v0}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V

    .line 661
    const-string/jumbo v0, "  dumpsys usb disconnect-port \"matrix\""

    invoke-virtual {v8, v0}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V

    .line 662
    const-string/jumbo v0, "  dumpsys usb remove-port \"matrix\""

    invoke-virtual {v8, v0}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V

    .line 663
    const-string/jumbo v0, "  dumpsys usb reset"

    invoke-virtual {v8, v0}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V

    .line 664
    invoke-virtual {v8}, Lcom/android/internal/util/IndentingPrintWriter;->println()V

    .line 665
    const-string/jumbo v0, "Example USB type C port where only power role can be changed:"

    invoke-virtual {v8, v0}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V

    .line 666
    const-string/jumbo v0, "  dumpsys usb add-port \"matrix\" dual"

    invoke-virtual {v8, v0}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V

    .line 667
    const-string/jumbo v0, "  dumpsys usb connect-port \"matrix\" dfp source? host"

    invoke-virtual {v8, v0}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V

    .line 668
    const-string/jumbo v0, "  dumpsys usb reset"

    invoke-virtual {v8, v0}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V

    .line 669
    invoke-virtual {v8}, Lcom/android/internal/util/IndentingPrintWriter;->println()V

    .line 670
    const-string/jumbo v0, "Example USB OTG port where id pin determines function:"

    invoke-virtual {v8, v0}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V

    .line 671
    const-string/jumbo v0, "  dumpsys usb add-port \"matrix\" dual"

    invoke-virtual {v8, v0}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V

    .line 672
    const-string/jumbo v0, "  dumpsys usb connect-port \"matrix\" dfp source host"

    invoke-virtual {v8, v0}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V

    .line 673
    const-string/jumbo v0, "  dumpsys usb reset"

    invoke-virtual {v8, v0}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V

    .line 674
    invoke-virtual {v8}, Lcom/android/internal/util/IndentingPrintWriter;->println()V

    .line 675
    const-string/jumbo v0, "Example USB device-only port:"

    invoke-virtual {v8, v0}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V

    .line 676
    const-string/jumbo v0, "  dumpsys usb add-port \"matrix\" ufp"

    invoke-virtual {v8, v0}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V

    .line 677
    const-string/jumbo v0, "  dumpsys usb connect-port \"matrix\" ufp sink device"

    invoke-virtual {v8, v0}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V

    .line 678
    const-string/jumbo v0, "  dumpsys usb reset"

    invoke-virtual {v8, v0}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V
    :try_end_3cd
    .catchall {:try_start_280 .. :try_end_3cd} :catchall_9b

    goto/16 :goto_4b
.end method

.method public getCurrentAccessory()Landroid/hardware/usb/UsbAccessory;
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 260
    iget-object v0, p0, Lcom/android/server/usb/UsbService;->mDeviceManager:Lcom/android/server/usb/UsbDeviceManager;

    if-eqz v0, :cond_c

    .line 261
    iget-object v0, p0, Lcom/android/server/usb/UsbService;->mDeviceManager:Lcom/android/server/usb/UsbDeviceManager;

    invoke-virtual {v0}, Lcom/android/server/usb/UsbDeviceManager;->getCurrentAccessory()Landroid/hardware/usb/UsbAccessory;

    move-result-object v0

    return-object v0

    .line 263
    :cond_c
    return-object v1
.end method

.method public getDeviceList(Landroid/os/Bundle;)V
    .registers 3

    .prologue
    .line 211
    iget-object v0, p0, Lcom/android/server/usb/UsbService;->mHostManager:Lcom/android/server/usb/UsbHostManager;

    if-eqz v0, :cond_9

    .line 212
    iget-object v0, p0, Lcom/android/server/usb/UsbService;->mHostManager:Lcom/android/server/usb/UsbHostManager;

    invoke-virtual {v0, p1}, Lcom/android/server/usb/UsbHostManager;->getDeviceList(Landroid/os/Bundle;)V

    .line 214
    :cond_9
    return-void
.end method

.method public getPortStatus(Ljava/lang/String;)Landroid/hardware/usb/UsbPortStatus;
    .registers 6

    .prologue
    const/4 v0, 0x0

    .line 441
    const-string/jumbo v1, "portId must not be null"

    invoke-static {p1, v1}, Lcom/android/internal/util/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 442
    iget-object v1, p0, Lcom/android/server/usb/UsbService;->mContext:Landroid/content/Context;

    const-string/jumbo v2, "android.permission.MANAGE_USB"

    invoke-virtual {v1, v2, v0}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    .line 444
    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J

    move-result-wide v2

    .line 446
    :try_start_13
    iget-object v1, p0, Lcom/android/server/usb/UsbService;->mPortManager:Lcom/android/server/usb/UsbPortManager;

    if-eqz v1, :cond_1d

    iget-object v0, p0, Lcom/android/server/usb/UsbService;->mPortManager:Lcom/android/server/usb/UsbPortManager;

    invoke-virtual {v0, p1}, Lcom/android/server/usb/UsbPortManager;->getPortStatus(Ljava/lang/String;)Landroid/hardware/usb/UsbPortStatus;
    :try_end_1c
    .catchall {:try_start_13 .. :try_end_1c} :catchall_21

    move-result-object v0

    .line 448
    :cond_1d
    invoke-static {v2, v3}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 446
    return-object v0

    .line 447
    :catchall_21
    move-exception v0

    .line 448
    invoke-static {v2, v3}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 447
    throw v0
.end method

.method public getPorts()[Landroid/hardware/usb/UsbPort;
    .registers 5

    .prologue
    const/4 v0, 0x0

    .line 429
    iget-object v1, p0, Lcom/android/server/usb/UsbService;->mContext:Landroid/content/Context;

    const-string/jumbo v2, "android.permission.MANAGE_USB"

    invoke-virtual {v1, v2, v0}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    .line 431
    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J

    move-result-wide v2

    .line 433
    :try_start_d
    iget-object v1, p0, Lcom/android/server/usb/UsbService;->mPortManager:Lcom/android/server/usb/UsbPortManager;

    if-eqz v1, :cond_17

    iget-object v0, p0, Lcom/android/server/usb/UsbService;->mPortManager:Lcom/android/server/usb/UsbPortManager;

    invoke-virtual {v0}, Lcom/android/server/usb/UsbPortManager;->getPorts()[Landroid/hardware/usb/UsbPort;
    :try_end_16
    .catchall {:try_start_d .. :try_end_16} :catchall_1b

    move-result-object v0

    .line 435
    :cond_17
    invoke-static {v2, v3}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 433
    return-object v0

    .line 434
    :catchall_1b
    move-exception v0

    .line 435
    invoke-static {v2, v3}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 434
    throw v0
.end method

.method public grantAccessoryPermission(Landroid/hardware/usb/UsbAccessory;I)V
    .registers 6

    .prologue
    .line 344
    iget-object v0, p0, Lcom/android/server/usb/UsbService;->mContext:Landroid/content/Context;

    const-string/jumbo v1, "android.permission.MANAGE_USB"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    .line 345
    invoke-static {p2}, Landroid/os/UserHandle;->getUserId(I)I

    move-result v0

    .line 346
    invoke-direct {p0, v0}, Lcom/android/server/usb/UsbService;->getSettingsForUser(I)Lcom/android/server/usb/UsbUserSettingsManager;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/android/server/usb/UsbUserSettingsManager;->grantAccessoryPermission(Landroid/hardware/usb/UsbAccessory;I)V

    .line 347
    return-void
.end method

.method public grantDevicePermission(Landroid/hardware/usb/UsbDevice;I)V
    .registers 6

    .prologue
    .line 337
    iget-object v0, p0, Lcom/android/server/usb/UsbService;->mContext:Landroid/content/Context;

    const-string/jumbo v1, "android.permission.MANAGE_USB"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    .line 338
    invoke-static {p2}, Landroid/os/UserHandle;->getUserId(I)I

    move-result v0

    .line 339
    invoke-direct {p0, v0}, Lcom/android/server/usb/UsbService;->getSettingsForUser(I)Lcom/android/server/usb/UsbUserSettingsManager;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/android/server/usb/UsbUserSettingsManager;->grantDevicePermission(Landroid/hardware/usb/UsbDevice;I)V

    .line 340
    return-void
.end method

.method public hasAccessoryPermission(Landroid/hardware/usb/UsbAccessory;)Z
    .registers 3

    .prologue
    .line 318
    invoke-static {}, Landroid/os/UserHandle;->getCallingUserId()I

    move-result v0

    .line 319
    invoke-direct {p0, v0}, Lcom/android/server/usb/UsbService;->getSettingsForUser(I)Lcom/android/server/usb/UsbUserSettingsManager;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/android/server/usb/UsbUserSettingsManager;->hasPermission(Landroid/hardware/usb/UsbAccessory;)Z

    move-result v0

    return v0
.end method

.method public hasDefaults(Ljava/lang/String;I)Z
    .registers 7

    .prologue
    .line 351
    invoke-static {p1}, Lcom/android/internal/util/Preconditions;->checkStringNotEmpty(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 353
    iget-object v1, p0, Lcom/android/server/usb/UsbService;->mContext:Landroid/content/Context;

    const-string/jumbo v2, "android.permission.MANAGE_USB"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    .line 355
    invoke-static {p2}, Landroid/os/UserHandle;->of(I)Landroid/os/UserHandle;

    move-result-object v1

    .line 356
    iget-object v2, p0, Lcom/android/server/usb/UsbService;->mSettingsManager:Lcom/android/server/usb/UsbSettingsManager;

    invoke-virtual {v2, v1}, Lcom/android/server/usb/UsbSettingsManager;->getSettingsForProfileGroup(Landroid/os/UserHandle;)Lcom/android/server/usb/UsbProfileGroupSettingsManager;

    move-result-object v2

    invoke-virtual {v2, v0, v1}, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->hasDefaults(Ljava/lang/String;Landroid/os/UserHandle;)Z

    move-result v0

    return v0
.end method

.method public hasDevicePermission(Landroid/hardware/usb/UsbDevice;)Z
    .registers 3

    .prologue
    .line 312
    invoke-static {}, Landroid/os/UserHandle;->getCallingUserId()I

    move-result v0

    .line 313
    invoke-direct {p0, v0}, Lcom/android/server/usb/UsbService;->getSettingsForUser(I)Lcom/android/server/usb/UsbUserSettingsManager;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/android/server/usb/UsbUserSettingsManager;->hasPermission(Landroid/hardware/usb/UsbDevice;)Z

    move-result v0

    return v0
.end method

.method public isFunctionEnabled(Ljava/lang/String;)Z
    .registers 5

    .prologue
    const/4 v2, 0x0

    .line 371
    iget-object v0, p0, Lcom/android/server/usb/UsbService;->mContext:Landroid/content/Context;

    const-string/jumbo v1, "android.permission.MANAGE_USB"

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    .line 372
    iget-object v0, p0, Lcom/android/server/usb/UsbService;->mDeviceManager:Lcom/android/server/usb/UsbDeviceManager;

    if-eqz v0, :cond_14

    iget-object v0, p0, Lcom/android/server/usb/UsbService;->mDeviceManager:Lcom/android/server/usb/UsbDeviceManager;

    invoke-virtual {v0, p1}, Lcom/android/server/usb/UsbDeviceManager;->isFunctionEnabled(Ljava/lang/String;)Z

    move-result v0

    :goto_13
    return v0

    :cond_14
    const/4 v0, 0x0

    goto :goto_13
.end method

.method public openAccessory(Landroid/hardware/usb/UsbAccessory;)Landroid/os/ParcelFileDescriptor;
    .registers 8

    .prologue
    const/4 v5, 0x0

    .line 270
    iget-object v0, p0, Lcom/android/server/usb/UsbService;->mDeviceManager:Lcom/android/server/usb/UsbDeviceManager;

    if-eqz v0, :cond_4b

    .line 271
    invoke-static {}, Landroid/os/UserHandle;->getCallingUserId()I

    move-result v0

    .line 273
    iget-object v1, p0, Lcom/android/server/usb/UsbService;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 274
    :try_start_c
    invoke-direct {p0}, Lcom/android/server/usb/UsbService;->isCallerInCurrentUserProfileGroupLocked()Z

    move-result v2

    .line 276
    if-eqz v2, :cond_1e

    .line 277
    iget-object v2, p0, Lcom/android/server/usb/UsbService;->mDeviceManager:Lcom/android/server/usb/UsbDeviceManager;

    invoke-direct {p0, v0}, Lcom/android/server/usb/UsbService;->getSettingsForUser(I)Lcom/android/server/usb/UsbUserSettingsManager;

    move-result-object v0

    invoke-virtual {v2, p1, v0}, Lcom/android/server/usb/UsbDeviceManager;->openAccessory(Landroid/hardware/usb/UsbAccessory;Lcom/android/server/usb/UsbUserSettingsManager;)Landroid/os/ParcelFileDescriptor;
    :try_end_1b
    .catchall {:try_start_c .. :try_end_1b} :catchall_4c

    move-result-object v0

    monitor-exit v1

    return-object v0

    .line 279
    :cond_1e
    :try_start_1e
    const-string/jumbo v2, "UsbService"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "Cannot open "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, " for user "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 280
    const-string/jumbo v3, " as user is not active."

    .line 279
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_4a
    .catchall {:try_start_1e .. :try_end_4a} :catchall_4c

    monitor-exit v1

    .line 285
    :cond_4b
    return-object v5

    .line 273
    :catchall_4c
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public openDevice(Ljava/lang/String;)Landroid/os/ParcelFileDescriptor;
    .registers 8

    .prologue
    const/4 v0, 0x0

    .line 238
    iget-object v1, p0, Lcom/android/server/usb/UsbService;->mHostManager:Lcom/android/server/usb/UsbHostManager;

    if-eqz v1, :cond_1f

    .line 239
    iget-object v1, p0, Lcom/android/server/usb/UsbService;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 240
    if-eqz p1, :cond_1e

    .line 241
    :try_start_a
    invoke-static {}, Landroid/os/UserHandle;->getCallingUserId()I

    move-result v2

    .line 242
    invoke-direct {p0}, Lcom/android/server/usb/UsbService;->isCallerInCurrentUserProfileGroupLocked()Z

    move-result v3

    .line 244
    if-eqz v3, :cond_20

    .line 245
    iget-object v0, p0, Lcom/android/server/usb/UsbService;->mHostManager:Lcom/android/server/usb/UsbHostManager;

    invoke-direct {p0, v2}, Lcom/android/server/usb/UsbService;->getSettingsForUser(I)Lcom/android/server/usb/UsbUserSettingsManager;

    move-result-object v2

    invoke-virtual {v0, p1, v2}, Lcom/android/server/usb/UsbHostManager;->openDevice(Ljava/lang/String;Lcom/android/server/usb/UsbUserSettingsManager;)Landroid/os/ParcelFileDescriptor;
    :try_end_1d
    .catchall {:try_start_a .. :try_end_1d} :catchall_4d

    move-result-object v0

    :cond_1e
    :goto_1e
    monitor-exit v1

    .line 254
    :cond_1f
    return-object v0

    .line 247
    :cond_20
    :try_start_20
    const-string/jumbo v3, "UsbService"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "Cannot open "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, " for user "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 248
    const-string/jumbo v4, " as user is not active."

    .line 247
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v3, v2}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_4c
    .catchall {:try_start_20 .. :try_end_4c} :catchall_4d

    goto :goto_1e

    .line 239
    :catchall_4d
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public requestAccessoryPermission(Landroid/hardware/usb/UsbAccessory;Ljava/lang/String;Landroid/app/PendingIntent;)V
    .registers 5

    .prologue
    .line 331
    invoke-static {}, Landroid/os/UserHandle;->getCallingUserId()I

    move-result v0

    .line 332
    invoke-direct {p0, v0}, Lcom/android/server/usb/UsbService;->getSettingsForUser(I)Lcom/android/server/usb/UsbUserSettingsManager;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3}, Lcom/android/server/usb/UsbUserSettingsManager;->requestPermission(Landroid/hardware/usb/UsbAccessory;Ljava/lang/String;Landroid/app/PendingIntent;)V

    .line 333
    return-void
.end method

.method public requestDevicePermission(Landroid/hardware/usb/UsbDevice;Ljava/lang/String;Landroid/app/PendingIntent;)V
    .registers 5

    .prologue
    .line 324
    invoke-static {}, Landroid/os/UserHandle;->getCallingUserId()I

    move-result v0

    .line 325
    invoke-direct {p0, v0}, Lcom/android/server/usb/UsbService;->getSettingsForUser(I)Lcom/android/server/usb/UsbUserSettingsManager;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3}, Lcom/android/server/usb/UsbUserSettingsManager;->requestPermission(Landroid/hardware/usb/UsbDevice;Ljava/lang/String;Landroid/app/PendingIntent;)V

    .line 326
    return-void
.end method

.method public setAccessoryPackage(Landroid/hardware/usb/UsbAccessory;Ljava/lang/String;I)V
    .registers 8

    .prologue
    .line 301
    invoke-static {p1}, Lcom/android/internal/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/usb/UsbAccessory;

    .line 303
    iget-object v1, p0, Lcom/android/server/usb/UsbService;->mContext:Landroid/content/Context;

    const-string/jumbo v2, "android.permission.MANAGE_USB"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    .line 305
    invoke-static {p3}, Landroid/os/UserHandle;->of(I)Landroid/os/UserHandle;

    move-result-object v1

    .line 306
    iget-object v2, p0, Lcom/android/server/usb/UsbService;->mSettingsManager:Lcom/android/server/usb/UsbSettingsManager;

    invoke-virtual {v2, v1}, Lcom/android/server/usb/UsbSettingsManager;->getSettingsForProfileGroup(Landroid/os/UserHandle;)Lcom/android/server/usb/UsbProfileGroupSettingsManager;

    move-result-object v2

    invoke-virtual {v2, v0, p2, v1}, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->setAccessoryPackage(Landroid/hardware/usb/UsbAccessory;Ljava/lang/String;Landroid/os/UserHandle;)V

    .line 308
    return-void
.end method

.method public setCurrentFunction(Ljava/lang/String;Z)V
    .registers 6

    .prologue
    const/4 v2, 0x0

    .line 377
    iget-object v0, p0, Lcom/android/server/usb/UsbService;->mContext:Landroid/content/Context;

    const-string/jumbo v1, "android.permission.MANAGE_USB"

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    .line 379
    invoke-static {p1}, Lcom/android/server/usb/UsbService;->isSupportedCurrentFunction(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2c

    .line 380
    const-string/jumbo v0, "UsbService"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Caller of setCurrentFunction() requested unsupported USB function: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 382
    const-string/jumbo p1, "none"

    .line 385
    :cond_2c
    iget-object v0, p0, Lcom/android/server/usb/UsbService;->mDeviceManager:Lcom/android/server/usb/UsbDeviceManager;

    if-eqz v0, :cond_36

    .line 386
    iget-object v0, p0, Lcom/android/server/usb/UsbService;->mDeviceManager:Lcom/android/server/usb/UsbDeviceManager;

    invoke-virtual {v0, p1, p2}, Lcom/android/server/usb/UsbDeviceManager;->setCurrentFunctions(Ljava/lang/String;Z)V

    .line 390
    return-void

    .line 388
    :cond_36
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "USB device mode not supported"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setDevicePackage(Landroid/hardware/usb/UsbDevice;Ljava/lang/String;I)V
    .registers 8

    .prologue
    .line 290
    invoke-static {p1}, Lcom/android/internal/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/usb/UsbDevice;

    .line 292
    iget-object v1, p0, Lcom/android/server/usb/UsbService;->mContext:Landroid/content/Context;

    const-string/jumbo v2, "android.permission.MANAGE_USB"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    .line 294
    invoke-static {p3}, Landroid/os/UserHandle;->of(I)Landroid/os/UserHandle;

    move-result-object v1

    .line 295
    iget-object v2, p0, Lcom/android/server/usb/UsbService;->mSettingsManager:Lcom/android/server/usb/UsbSettingsManager;

    invoke-virtual {v2, v1}, Lcom/android/server/usb/UsbSettingsManager;->getSettingsForProfileGroup(Landroid/os/UserHandle;)Lcom/android/server/usb/UsbProfileGroupSettingsManager;

    move-result-object v2

    invoke-virtual {v2, v0, p2, v1}, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->setDevicePackage(Landroid/hardware/usb/UsbDevice;Ljava/lang/String;Landroid/os/UserHandle;)V

    .line 297
    return-void
.end method

.method public setPortRoles(Ljava/lang/String;II)V
    .registers 8

    .prologue
    const/4 v2, 0x0

    .line 454
    const-string/jumbo v0, "portId must not be null"

    invoke-static {p1, v0}, Lcom/android/internal/util/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 455
    invoke-static {p2, p3}, Landroid/hardware/usb/UsbPort;->checkRoles(II)V

    .line 456
    iget-object v0, p0, Lcom/android/server/usb/UsbService;->mContext:Landroid/content/Context;

    const-string/jumbo v1, "android.permission.MANAGE_USB"

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    .line 458
    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J

    move-result-wide v2

    .line 460
    :try_start_16
    iget-object v0, p0, Lcom/android/server/usb/UsbService;->mPortManager:Lcom/android/server/usb/UsbPortManager;

    if-eqz v0, :cond_20

    .line 461
    iget-object v0, p0, Lcom/android/server/usb/UsbService;->mPortManager:Lcom/android/server/usb/UsbPortManager;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, p2, p3, v1}, Lcom/android/server/usb/UsbPortManager;->setPortRoles(Ljava/lang/String;IILcom/android/internal/util/IndentingPrintWriter;)V
    :try_end_20
    .catchall {:try_start_16 .. :try_end_20} :catchall_24

    .line 464
    :cond_20
    invoke-static {v2, v3}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 466
    return-void

    .line 463
    :catchall_24
    move-exception v0

    .line 464
    invoke-static {v2, v3}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 463
    throw v0
.end method

.method public setUsbDeviceConnectionHandler(Landroid/content/ComponentName;)V
    .registers 5

    .prologue
    const/4 v2, 0x0

    .line 470
    iget-object v0, p0, Lcom/android/server/usb/UsbService;->mContext:Landroid/content/Context;

    const-string/jumbo v1, "android.permission.MANAGE_USB"

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    .line 471
    iget-object v1, p0, Lcom/android/server/usb/UsbService;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 472
    :try_start_c
    iget v0, p0, Lcom/android/server/usb/UsbService;->mCurrentUserId:I

    invoke-static {}, Landroid/os/UserHandle;->getCallingUserId()I

    move-result v2

    if-ne v0, v2, :cond_1f

    .line 473
    iget-object v0, p0, Lcom/android/server/usb/UsbService;->mHostManager:Lcom/android/server/usb/UsbHostManager;

    if-eqz v0, :cond_1d

    .line 474
    iget-object v0, p0, Lcom/android/server/usb/UsbService;->mHostManager:Lcom/android/server/usb/UsbHostManager;

    invoke-virtual {v0, p1}, Lcom/android/server/usb/UsbHostManager;->setUsbDeviceConnectionHandler(Landroid/content/ComponentName;)V
    :try_end_1d
    .catchall {:try_start_c .. :try_end_1d} :catchall_28

    :cond_1d
    monitor-exit v1

    .line 481
    return-void

    .line 477
    :cond_1f
    :try_start_1f
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v2, "Only the current user can register a usb connection handler"

    invoke-direct {v0, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_28
    .catchall {:try_start_1f .. :try_end_28} :catchall_28

    .line 471
    :catchall_28
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public systemReady()V
    .registers 2

    .prologue
    .line 189
    iget-object v0, p0, Lcom/android/server/usb/UsbService;->mAlsaManager:Lcom/android/server/usb/UsbAlsaManager;

    invoke-virtual {v0}, Lcom/android/server/usb/UsbAlsaManager;->systemReady()V

    .line 191
    iget-object v0, p0, Lcom/android/server/usb/UsbService;->mDeviceManager:Lcom/android/server/usb/UsbDeviceManager;

    if-eqz v0, :cond_e

    .line 192
    iget-object v0, p0, Lcom/android/server/usb/UsbService;->mDeviceManager:Lcom/android/server/usb/UsbDeviceManager;

    invoke-virtual {v0}, Lcom/android/server/usb/UsbDeviceManager;->systemReady()V

    .line 194
    :cond_e
    iget-object v0, p0, Lcom/android/server/usb/UsbService;->mHostManager:Lcom/android/server/usb/UsbHostManager;

    if-eqz v0, :cond_17

    .line 195
    iget-object v0, p0, Lcom/android/server/usb/UsbService;->mHostManager:Lcom/android/server/usb/UsbHostManager;

    invoke-virtual {v0}, Lcom/android/server/usb/UsbHostManager;->systemReady()V

    .line 197
    :cond_17
    iget-object v0, p0, Lcom/android/server/usb/UsbService;->mPortManager:Lcom/android/server/usb/UsbPortManager;

    if-eqz v0, :cond_20

    .line 198
    iget-object v0, p0, Lcom/android/server/usb/UsbService;->mPortManager:Lcom/android/server/usb/UsbPortManager;

    invoke-virtual {v0}, Lcom/android/server/usb/UsbPortManager;->systemReady()V

    .line 200
    :cond_20
    return-void
.end method
