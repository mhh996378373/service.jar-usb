.class public Lcom/android/server/usb/UsbHostManager;
.super Ljava/lang/Object;
.source "UsbHostManager.java"


# static fields
.field private static final DEBUG:Z

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private final mContext:Landroid/content/Context;

.field private mCurrentSettings:Lcom/android/server/usb/UsbProfileGroupSettingsManager;
    .annotation build Lcom/android/internal/annotations/GuardedBy;
        value = "mLock"
    .end annotation
.end field

.field private final mDevices:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Landroid/hardware/usb/UsbDevice;",
            ">;"
        }
    .end annotation
.end field

.field private final mHostBlacklist:[Ljava/lang/String;

.field private final mLock:Ljava/lang/Object;

.field private mNewConfiguration:Landroid/hardware/usb/UsbConfiguration;

.field private mNewConfigurations:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/hardware/usb/UsbConfiguration;",
            ">;"
        }
    .end annotation
.end field

.field private mNewDevice:Landroid/hardware/usb/UsbDevice;

.field private mNewEndpoints:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/hardware/usb/UsbEndpoint;",
            ">;"
        }
    .end annotation
.end field

.field private mNewInterface:Landroid/hardware/usb/UsbInterface;

.field private mNewInterfaces:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/hardware/usb/UsbInterface;",
            ">;"
        }
    .end annotation
.end field

.field private final mSettingsManager:Lcom/android/server/usb/UsbSettingsManager;

.field private final mUsbAlsaManager:Lcom/android/server/usb/UsbAlsaManager;

.field private mUsbDeviceConnectionHandler:Landroid/content/ComponentName;
    .annotation build Lcom/android/internal/annotations/GuardedBy;
        value = "mLock"
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 48
    const-class v0, Lcom/android/server/usb/UsbHostManager;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/server/usb/UsbHostManager;->TAG:Ljava/lang/String;

    .line 47
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/android/server/usb/UsbAlsaManager;Lcom/android/server/usb/UsbSettingsManager;)V
    .registers 6

    .prologue
    .line 77
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/android/server/usb/UsbHostManager;->mDevices:Ljava/util/HashMap;

    .line 59
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/android/server/usb/UsbHostManager;->mLock:Ljava/lang/Object;

    .line 79
    iput-object p1, p0, Lcom/android/server/usb/UsbHostManager;->mContext:Landroid/content/Context;

    .line 81
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 82
    const v1, 0x1070047

    .line 81
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/server/usb/UsbHostManager;->mHostBlacklist:[Ljava/lang/String;

    .line 83
    iput-object p2, p0, Lcom/android/server/usb/UsbHostManager;->mUsbAlsaManager:Lcom/android/server/usb/UsbAlsaManager;

    .line 84
    iput-object p3, p0, Lcom/android/server/usb/UsbHostManager;->mSettingsManager:Lcom/android/server/usb/UsbSettingsManager;

    .line 85
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 86
    const v1, 0x1040107

    .line 85
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 87
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_3c

    .line 88
    invoke-static {v0}, Landroid/content/ComponentName;->unflattenFromString(Ljava/lang/String;)Landroid/content/ComponentName;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/android/server/usb/UsbHostManager;->setUsbDeviceConnectionHandler(Landroid/content/ComponentName;)V

    .line 91
    :cond_3c
    return-void
.end method

.method private addUsbConfiguration(ILjava/lang/String;II)V
    .registers 8

    .prologue
    .line 203
    iget-object v0, p0, Lcom/android/server/usb/UsbHostManager;->mNewConfiguration:Landroid/hardware/usb/UsbConfiguration;

    if-eqz v0, :cond_1e

    .line 204
    iget-object v1, p0, Lcom/android/server/usb/UsbHostManager;->mNewConfiguration:Landroid/hardware/usb/UsbConfiguration;

    .line 205
    iget-object v0, p0, Lcom/android/server/usb/UsbHostManager;->mNewInterfaces:Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/android/server/usb/UsbHostManager;->mNewInterfaces:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    new-array v2, v2, [Landroid/hardware/usb/UsbInterface;

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Landroid/os/Parcelable;

    .line 204
    invoke-virtual {v1, v0}, Landroid/hardware/usb/UsbConfiguration;->setInterfaces([Landroid/os/Parcelable;)V

    .line 206
    iget-object v0, p0, Lcom/android/server/usb/UsbHostManager;->mNewInterfaces:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 209
    :cond_1e
    new-instance v0, Landroid/hardware/usb/UsbConfiguration;

    invoke-direct {v0, p1, p2, p3, p4}, Landroid/hardware/usb/UsbConfiguration;-><init>(ILjava/lang/String;II)V

    iput-object v0, p0, Lcom/android/server/usb/UsbHostManager;->mNewConfiguration:Landroid/hardware/usb/UsbConfiguration;

    .line 210
    iget-object v0, p0, Lcom/android/server/usb/UsbHostManager;->mNewConfigurations:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/android/server/usb/UsbHostManager;->mNewConfiguration:Landroid/hardware/usb/UsbConfiguration;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 211
    return-void
.end method

.method private addUsbEndpoint(IIII)V
    .registers 7

    .prologue
    .line 234
    iget-object v0, p0, Lcom/android/server/usb/UsbHostManager;->mNewEndpoints:Ljava/util/ArrayList;

    new-instance v1, Landroid/hardware/usb/UsbEndpoint;

    invoke-direct {v1, p1, p2, p3, p4}, Landroid/hardware/usb/UsbEndpoint;-><init>(IIII)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 235
    return-void
.end method

.method private addUsbInterface(ILjava/lang/String;IIII)V
    .registers 14

    .prologue
    .line 219
    iget-object v0, p0, Lcom/android/server/usb/UsbHostManager;->mNewInterface:Landroid/hardware/usb/UsbInterface;

    if-eqz v0, :cond_1e

    .line 220
    iget-object v1, p0, Lcom/android/server/usb/UsbHostManager;->mNewInterface:Landroid/hardware/usb/UsbInterface;

    .line 221
    iget-object v0, p0, Lcom/android/server/usb/UsbHostManager;->mNewEndpoints:Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/android/server/usb/UsbHostManager;->mNewEndpoints:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    new-array v2, v2, [Landroid/hardware/usb/UsbEndpoint;

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Landroid/os/Parcelable;

    .line 220
    invoke-virtual {v1, v0}, Landroid/hardware/usb/UsbInterface;->setEndpoints([Landroid/os/Parcelable;)V

    .line 222
    iget-object v0, p0, Lcom/android/server/usb/UsbHostManager;->mNewEndpoints:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 225
    :cond_1e
    new-instance v0, Landroid/hardware/usb/UsbInterface;

    move v1, p1

    move v2, p3

    move-object v3, p2

    move v4, p4

    move v5, p5

    move v6, p6

    invoke-direct/range {v0 .. v6}, Landroid/hardware/usb/UsbInterface;-><init>(IILjava/lang/String;III)V

    iput-object v0, p0, Lcom/android/server/usb/UsbHostManager;->mNewInterface:Landroid/hardware/usb/UsbInterface;

    .line 226
    iget-object v0, p0, Lcom/android/server/usb/UsbHostManager;->mNewInterfaces:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/android/server/usb/UsbHostManager;->mNewInterface:Landroid/hardware/usb/UsbInterface;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 227
    return-void
.end method

.method private beginUsbDeviceAdded(Ljava/lang/String;IIIIILjava/lang/String;Ljava/lang/String;ILjava/lang/String;)Z
    .registers 25

    .prologue
    .line 167
    invoke-direct {p0, p1}, Lcom/android/server/usb/UsbHostManager;->isBlackListed(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_10

    .line 168
    move/from16 v0, p4

    move/from16 v1, p5

    invoke-direct {p0, v0, v1}, Lcom/android/server/usb/UsbHostManager;->isBlackListed(II)Z

    move-result v2

    .line 167
    if-eqz v2, :cond_12

    .line 169
    :cond_10
    const/4 v2, 0x0

    return v2

    .line 172
    :cond_12
    iget-object v13, p0, Lcom/android/server/usb/UsbHostManager;->mLock:Ljava/lang/Object;

    monitor-enter v13

    .line 173
    :try_start_15
    iget-object v2, p0, Lcom/android/server/usb/UsbHostManager;->mDevices:Ljava/util/HashMap;

    invoke-virtual {v2, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_39

    .line 174
    sget-object v2, Lcom/android/server/usb/UsbHostManager;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "device already on mDevices list: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_36
    .catchall {:try_start_15 .. :try_end_36} :catchall_9a

    .line 175
    const/4 v2, 0x0

    monitor-exit v13

    return v2

    .line 178
    :cond_39
    :try_start_39
    iget-object v2, p0, Lcom/android/server/usb/UsbHostManager;->mNewDevice:Landroid/hardware/usb/UsbDevice;

    if-eqz v2, :cond_48

    .line 179
    sget-object v2, Lcom/android/server/usb/UsbHostManager;->TAG:Ljava/lang/String;

    const-string/jumbo v3, "mNewDevice is not null in endUsbDeviceAdded"

    invoke-static {v2, v3}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_45
    .catchall {:try_start_39 .. :try_end_45} :catchall_9a

    .line 180
    const/4 v2, 0x0

    monitor-exit v13

    return v2

    .line 184
    :cond_48
    :try_start_48
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    shr-int/lit8 v3, p9, 0x8

    invoke-static {v3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move/from16 v0, p9

    and-int/lit16 v3, v0, 0xff

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    .line 186
    new-instance v2, Landroid/hardware/usb/UsbDevice;

    move-object v3, p1

    move/from16 v4, p2

    move/from16 v5, p3

    move/from16 v6, p4

    move/from16 v7, p5

    move/from16 v8, p6

    move-object/from16 v9, p7

    move-object/from16 v10, p8

    move-object/from16 v12, p10

    invoke-direct/range {v2 .. v12}, Landroid/hardware/usb/UsbDevice;-><init>(Ljava/lang/String;IIIIILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    iput-object v2, p0, Lcom/android/server/usb/UsbHostManager;->mNewDevice:Landroid/hardware/usb/UsbDevice;

    .line 190
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lcom/android/server/usb/UsbHostManager;->mNewConfigurations:Ljava/util/ArrayList;

    .line 191
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lcom/android/server/usb/UsbHostManager;->mNewInterfaces:Ljava/util/ArrayList;

    .line 192
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lcom/android/server/usb/UsbHostManager;->mNewEndpoints:Ljava/util/ArrayList;
    :try_end_97
    .catchall {:try_start_48 .. :try_end_97} :catchall_9a

    monitor-exit v13

    .line 195
    const/4 v2, 0x1

    return v2

    .line 172
    :catchall_9a
    move-exception v2

    monitor-exit v13

    throw v2
.end method

.method private endUsbDeviceAdded()V
    .registers 7

    .prologue
    const/4 v1, 0x0

    .line 243
    iget-object v0, p0, Lcom/android/server/usb/UsbHostManager;->mNewInterface:Landroid/hardware/usb/UsbInterface;

    if-eqz v0, :cond_1a

    .line 244
    iget-object v2, p0, Lcom/android/server/usb/UsbHostManager;->mNewInterface:Landroid/hardware/usb/UsbInterface;

    .line 245
    iget-object v0, p0, Lcom/android/server/usb/UsbHostManager;->mNewEndpoints:Ljava/util/ArrayList;

    iget-object v3, p0, Lcom/android/server/usb/UsbHostManager;->mNewEndpoints:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    new-array v3, v3, [Landroid/hardware/usb/UsbEndpoint;

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Landroid/os/Parcelable;

    .line 244
    invoke-virtual {v2, v0}, Landroid/hardware/usb/UsbInterface;->setEndpoints([Landroid/os/Parcelable;)V

    .line 247
    :cond_1a
    iget-object v0, p0, Lcom/android/server/usb/UsbHostManager;->mNewConfiguration:Landroid/hardware/usb/UsbConfiguration;

    if-eqz v0, :cond_33

    .line 248
    iget-object v2, p0, Lcom/android/server/usb/UsbHostManager;->mNewConfiguration:Landroid/hardware/usb/UsbConfiguration;

    .line 249
    iget-object v0, p0, Lcom/android/server/usb/UsbHostManager;->mNewInterfaces:Ljava/util/ArrayList;

    iget-object v3, p0, Lcom/android/server/usb/UsbHostManager;->mNewInterfaces:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    new-array v3, v3, [Landroid/hardware/usb/UsbInterface;

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Landroid/os/Parcelable;

    .line 248
    invoke-virtual {v2, v0}, Landroid/hardware/usb/UsbConfiguration;->setInterfaces([Landroid/os/Parcelable;)V

    .line 253
    :cond_33
    iget-object v2, p0, Lcom/android/server/usb/UsbHostManager;->mLock:Ljava/lang/Object;

    monitor-enter v2

    .line 254
    :try_start_36
    iget-object v0, p0, Lcom/android/server/usb/UsbHostManager;->mNewDevice:Landroid/hardware/usb/UsbDevice;

    if-eqz v0, :cond_f2

    .line 255
    iget-object v3, p0, Lcom/android/server/usb/UsbHostManager;->mNewDevice:Landroid/hardware/usb/UsbDevice;

    .line 256
    iget-object v0, p0, Lcom/android/server/usb/UsbHostManager;->mNewConfigurations:Ljava/util/ArrayList;

    .line 257
    iget-object v4, p0, Lcom/android/server/usb/UsbHostManager;->mNewConfigurations:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    new-array v4, v4, [Landroid/hardware/usb/UsbConfiguration;

    .line 256
    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Landroid/os/Parcelable;

    .line 255
    invoke-virtual {v3, v0}, Landroid/hardware/usb/UsbDevice;->setConfigurations([Landroid/os/Parcelable;)V

    .line 258
    iget-object v0, p0, Lcom/android/server/usb/UsbHostManager;->mDevices:Ljava/util/HashMap;

    iget-object v3, p0, Lcom/android/server/usb/UsbHostManager;->mNewDevice:Landroid/hardware/usb/UsbDevice;

    invoke-virtual {v3}, Landroid/hardware/usb/UsbDevice;->getDeviceName()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/android/server/usb/UsbHostManager;->mNewDevice:Landroid/hardware/usb/UsbDevice;

    invoke-virtual {v0, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 259
    sget-object v0, Lcom/android/server/usb/UsbHostManager;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "Added device "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/android/server/usb/UsbHostManager;->mNewDevice:Landroid/hardware/usb/UsbDevice;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 263
    invoke-direct {p0}, Lcom/android/server/usb/UsbHostManager;->getUsbDeviceConnectionHandler()Landroid/content/ComponentName;

    move-result-object v0

    .line 264
    if-nez v0, :cond_e5

    .line 265
    invoke-direct {p0}, Lcom/android/server/usb/UsbHostManager;->getCurrentUserSettings()Lcom/android/server/usb/UsbProfileGroupSettingsManager;

    move-result-object v0

    iget-object v3, p0, Lcom/android/server/usb/UsbHostManager;->mNewDevice:Landroid/hardware/usb/UsbDevice;

    invoke-virtual {v0, v3}, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->deviceAttached(Landroid/hardware/usb/UsbDevice;)V

    .line 271
    :goto_86
    new-instance v0, Lcom/android/server/usb/descriptors/UsbDescriptorParser;

    invoke-direct {v0}, Lcom/android/server/usb/descriptors/UsbDescriptorParser;-><init>()V

    .line 274
    iget-object v3, p0, Lcom/android/server/usb/UsbHostManager;->mNewDevice:Landroid/hardware/usb/UsbDevice;

    invoke-virtual {v3}, Landroid/hardware/usb/UsbDevice;->getDeviceName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/android/server/usb/descriptors/UsbDescriptorParser;->parseDevice(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_fb

    .line 275
    invoke-virtual {v0}, Lcom/android/server/usb/descriptors/UsbDescriptorParser;->isInputHeadset()Z

    move-result v1

    .line 276
    invoke-virtual {v0}, Lcom/android/server/usb/descriptors/UsbDescriptorParser;->isOutputHeadset()Z

    move-result v0

    .line 277
    sget-object v3, Lcom/android/server/usb/UsbHostManager;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "---- isHeadset[in: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 278
    const-string/jumbo v5, " , out: "

    .line 277
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 278
    const-string/jumbo v5, "]"

    .line 277
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 280
    :goto_ca
    iget-object v3, p0, Lcom/android/server/usb/UsbHostManager;->mUsbAlsaManager:Lcom/android/server/usb/UsbAlsaManager;

    iget-object v4, p0, Lcom/android/server/usb/UsbHostManager;->mNewDevice:Landroid/hardware/usb/UsbDevice;

    invoke-virtual {v3, v4, v1, v0}, Lcom/android/server/usb/UsbAlsaManager;->usbDeviceAdded(Landroid/hardware/usb/UsbDevice;ZZ)V

    .line 285
    :goto_d1
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/server/usb/UsbHostManager;->mNewDevice:Landroid/hardware/usb/UsbDevice;

    .line 286
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/server/usb/UsbHostManager;->mNewConfigurations:Ljava/util/ArrayList;

    .line 287
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/server/usb/UsbHostManager;->mNewInterfaces:Ljava/util/ArrayList;

    .line 288
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/server/usb/UsbHostManager;->mNewEndpoints:Ljava/util/ArrayList;

    .line 289
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/server/usb/UsbHostManager;->mNewConfiguration:Landroid/hardware/usb/UsbConfiguration;

    .line 290
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/server/usb/UsbHostManager;->mNewInterface:Landroid/hardware/usb/UsbInterface;
    :try_end_e3
    .catchall {:try_start_36 .. :try_end_e3} :catchall_ef

    monitor-exit v2

    .line 292
    return-void

    .line 267
    :cond_e5
    :try_start_e5
    invoke-direct {p0}, Lcom/android/server/usb/UsbHostManager;->getCurrentUserSettings()Lcom/android/server/usb/UsbProfileGroupSettingsManager;

    move-result-object v3

    iget-object v4, p0, Lcom/android/server/usb/UsbHostManager;->mNewDevice:Landroid/hardware/usb/UsbDevice;

    invoke-virtual {v3, v4, v0}, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->deviceAttachedForFixedHandler(Landroid/hardware/usb/UsbDevice;Landroid/content/ComponentName;)V
    :try_end_ee
    .catchall {:try_start_e5 .. :try_end_ee} :catchall_ef

    goto :goto_86

    .line 253
    :catchall_ef
    move-exception v0

    monitor-exit v2

    throw v0

    .line 283
    :cond_f2
    :try_start_f2
    sget-object v0, Lcom/android/server/usb/UsbHostManager;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "mNewDevice is null in endUsbDeviceAdded"

    invoke-static {v0, v1}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_fa
    .catchall {:try_start_f2 .. :try_end_fa} :catchall_ef

    goto :goto_d1

    :cond_fb
    move v0, v1

    goto :goto_ca
.end method

.method private getCurrentUserSettings()Lcom/android/server/usb/UsbProfileGroupSettingsManager;
    .registers 3

    .prologue
    .line 100
    iget-object v0, p0, Lcom/android/server/usb/UsbHostManager;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 101
    :try_start_3
    iget-object v1, p0, Lcom/android/server/usb/UsbHostManager;->mCurrentSettings:Lcom/android/server/usb/UsbProfileGroupSettingsManager;
    :try_end_5
    .catchall {:try_start_3 .. :try_end_5} :catchall_7

    monitor-exit v0

    return-object v1

    .line 100
    :catchall_7
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method private getUsbDeviceConnectionHandler()Landroid/content/ComponentName;
    .registers 3

    .prologue
    .line 112
    iget-object v0, p0, Lcom/android/server/usb/UsbHostManager;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 113
    :try_start_3
    iget-object v1, p0, Lcom/android/server/usb/UsbHostManager;->mUsbDeviceConnectionHandler:Landroid/content/ComponentName;
    :try_end_5
    .catchall {:try_start_3 .. :try_end_5} :catchall_7

    monitor-exit v0

    return-object v1

    .line 112
    :catchall_7
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method private isBlackListed(II)Z
    .registers 6

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x1

    .line 130
    const/16 v2, 0x9

    if-ne p1, v2, :cond_7

    return v0

    .line 133
    :cond_7
    const/4 v2, 0x3

    if-ne p1, v2, :cond_f

    .line 134
    if-ne p2, v0, :cond_d

    .line 133
    :goto_c
    return v0

    :cond_d
    move v0, v1

    .line 134
    goto :goto_c

    :cond_f
    move v0, v1

    .line 133
    goto :goto_c
.end method

.method private isBlackListed(Ljava/lang/String;)Z
    .registers 6

    .prologue
    const/4 v1, 0x0

    .line 118
    iget-object v0, p0, Lcom/android/server/usb/UsbHostManager;->mHostBlacklist:[Ljava/lang/String;

    array-length v2, v0

    move v0, v1

    .line 119
    :goto_5
    if-ge v0, v2, :cond_16

    .line 120
    iget-object v3, p0, Lcom/android/server/usb/UsbHostManager;->mHostBlacklist:[Ljava/lang/String;

    aget-object v3, v3, v0

    invoke-virtual {p1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_13

    .line 121
    const/4 v0, 0x1

    return v0

    .line 119
    :cond_13
    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    .line 124
    :cond_16
    return v1
.end method

.method private native monitorUsbHostBus()V
.end method

.method private native nativeOpenDevice(Ljava/lang/String;)Landroid/os/ParcelFileDescriptor;
.end method

.method private usbDeviceRemoved(Ljava/lang/String;)V
    .registers 5

    .prologue
    .line 297
    iget-object v1, p0, Lcom/android/server/usb/UsbHostManager;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 298
    :try_start_3
    iget-object v0, p0, Lcom/android/server/usb/UsbHostManager;->mDevices:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/usb/UsbDevice;

    .line 299
    if-eqz v0, :cond_1e

    .line 300
    iget-object v2, p0, Lcom/android/server/usb/UsbHostManager;->mUsbAlsaManager:Lcom/android/server/usb/UsbAlsaManager;

    invoke-virtual {v2, v0}, Lcom/android/server/usb/UsbAlsaManager;->usbDeviceRemoved(Landroid/hardware/usb/UsbDevice;)V

    .line 301
    iget-object v2, p0, Lcom/android/server/usb/UsbHostManager;->mSettingsManager:Lcom/android/server/usb/UsbSettingsManager;

    invoke-virtual {v2, v0}, Lcom/android/server/usb/UsbSettingsManager;->usbDeviceRemoved(Landroid/hardware/usb/UsbDevice;)V

    .line 302
    invoke-direct {p0}, Lcom/android/server/usb/UsbHostManager;->getCurrentUserSettings()Lcom/android/server/usb/UsbProfileGroupSettingsManager;

    move-result-object v2

    invoke-virtual {v2, v0}, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->usbDeviceRemoved(Landroid/hardware/usb/UsbDevice;)V
    :try_end_1e
    .catchall {:try_start_3 .. :try_end_1e} :catchall_20

    :cond_1e
    monitor-exit v1

    .line 305
    return-void

    .line 297
    :catchall_20
    move-exception v0

    monitor-exit v1

    throw v0
.end method


# virtual methods
.method synthetic -com_android_server_usb_UsbHostManager-mthref-0()V
    .registers 1

    .prologue
    .line 311
    invoke-direct {p0}, Lcom/android/server/usb/UsbHostManager;->monitorUsbHostBus()V

    return-void
.end method

.method public dump(Lcom/android/internal/util/IndentingPrintWriter;)V
    .registers 10

    .prologue
    .line 343
    iget-object v2, p0, Lcom/android/server/usb/UsbHostManager;->mLock:Ljava/lang/Object;

    monitor-enter v2

    .line 344
    :try_start_3
    const-string/jumbo v0, "USB Host State:"

    invoke-virtual {p1, v0}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V

    .line 345
    iget-object v0, p0, Lcom/android/server/usb/UsbHostManager;->mDevices:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_13
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4b

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 346
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "  "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, ": "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/android/server/usb/UsbHostManager;->mDevices:Ljava/util/HashMap;

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

    .line 343
    :catchall_48
    move-exception v0

    monitor-exit v2

    throw v0

    .line 348
    :cond_4b
    :try_start_4b
    iget-object v0, p0, Lcom/android/server/usb/UsbHostManager;->mUsbDeviceConnectionHandler:Landroid/content/ComponentName;

    if-eqz v0, :cond_68

    .line 349
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "Default USB Host Connection handler: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/android/server/usb/UsbHostManager;->mUsbDeviceConnectionHandler:Landroid/content/ComponentName;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V

    .line 352
    :cond_68
    iget-object v0, p0, Lcom/android/server/usb/UsbHostManager;->mDevices:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v0

    .line 353
    invoke-interface {v0}, Ljava/util/Collection;->size()I

    move-result v1

    if-eqz v1, :cond_f3

    .line 354
    const-string/jumbo v1, "USB Peripheral Descriptors"

    invoke-virtual {p1, v1}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V

    .line 355
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_7e
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_f3

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/usb/UsbDevice;

    .line 356
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 358
    new-instance v5, Lcom/android/server/usb/descriptors/UsbDescriptorParser;

    invoke-direct {v5}, Lcom/android/server/usb/descriptors/UsbDescriptorParser;-><init>()V

    .line 359
    invoke-virtual {v0}, Landroid/hardware/usb/UsbDevice;->getDeviceName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v5, v1}, Lcom/android/server/usb/descriptors/UsbDescriptorParser;->parseDevice(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_ec

    .line 360
    new-instance v6, Lcom/android/server/usb/descriptors/tree/UsbDescriptorsTree;

    invoke-direct {v6}, Lcom/android/server/usb/descriptors/tree/UsbDescriptorsTree;-><init>()V

    .line 361
    invoke-virtual {v6, v5}, Lcom/android/server/usb/descriptors/tree/UsbDescriptorsTree;->parse(Lcom/android/server/usb/descriptors/UsbDescriptorParser;)V

    .line 364
    iget-object v1, p0, Lcom/android/server/usb/UsbHostManager;->mContext:Landroid/content/Context;

    const-string/jumbo v7, "usb"

    invoke-virtual {v1, v7}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/hardware/usb/UsbManager;

    .line 365
    invoke-virtual {v1, v0}, Landroid/hardware/usb/UsbManager;->openDevice(Landroid/hardware/usb/UsbDevice;)Landroid/hardware/usb/UsbDeviceConnection;

    move-result-object v0

    .line 367
    new-instance v1, Lcom/android/server/usb/descriptors/report/TextReportCanvas;

    invoke-direct {v1, v0, v4}, Lcom/android/server/usb/descriptors/report/TextReportCanvas;-><init>(Landroid/hardware/usb/UsbDeviceConnection;Ljava/lang/StringBuilder;)V

    invoke-virtual {v6, v1}, Lcom/android/server/usb/descriptors/tree/UsbDescriptorsTree;->report(Lcom/android/server/usb/descriptors/report/ReportCanvas;)V

    .line 368
    invoke-virtual {v0}, Landroid/hardware/usb/UsbDeviceConnection;->close()V

    .line 370
    const-string/jumbo v0, "isHeadset[in: "

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v5}, Lcom/android/server/usb/descriptors/UsbDescriptorParser;->isInputHeadset()Z

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 371
    const-string/jumbo v1, " , out: "

    .line 370
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 371
    invoke-virtual {v5}, Lcom/android/server/usb/descriptors/UsbDescriptorParser;->isOutputHeadset()Z

    move-result v1

    .line 370
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 371
    const-string/jumbo v1, "]"

    .line 370
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 375
    :goto_e4
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V

    goto :goto_7e

    .line 373
    :cond_ec
    const-string/jumbo v0, "Error Parsing USB Descriptors"

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_f2
    .catchall {:try_start_4b .. :try_end_f2} :catchall_48

    goto :goto_e4

    :cond_f3
    monitor-exit v2

    .line 379
    return-void
.end method

.method public getDeviceList(Landroid/os/Bundle;)V
    .registers 6

    .prologue
    .line 318
    iget-object v2, p0, Lcom/android/server/usb/UsbHostManager;->mLock:Ljava/lang/Object;

    monitor-enter v2

    .line 319
    :try_start_3
    iget-object v0, p0, Lcom/android/server/usb/UsbHostManager;->mDevices:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_d
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_28

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 320
    iget-object v1, p0, Lcom/android/server/usb/UsbHostManager;->mDevices:Ljava/util/HashMap;

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/os/Parcelable;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V
    :try_end_24
    .catchall {:try_start_3 .. :try_end_24} :catchall_25

    goto :goto_d

    .line 318
    :catchall_25
    move-exception v0

    monitor-exit v2

    throw v0

    :cond_28
    monitor-exit v2

    .line 323
    return-void
.end method

.method public openDevice(Ljava/lang/String;Lcom/android/server/usb/UsbUserSettingsManager;)Landroid/os/ParcelFileDescriptor;
    .registers 7

    .prologue
    .line 327
    iget-object v1, p0, Lcom/android/server/usb/UsbHostManager;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 328
    :try_start_3
    invoke-direct {p0, p1}, Lcom/android/server/usb/UsbHostManager;->isBlackListed(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_15

    .line 329
    new-instance v0, Ljava/lang/SecurityException;

    const-string/jumbo v2, "USB device is on a restricted bus"

    invoke-direct {v0, v2}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_12
    .catchall {:try_start_3 .. :try_end_12} :catchall_12

    .line 327
    :catchall_12
    move-exception v0

    monitor-exit v1

    throw v0

    .line 331
    :cond_15
    :try_start_15
    iget-object v0, p0, Lcom/android/server/usb/UsbHostManager;->mDevices:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/usb/UsbDevice;

    .line 332
    if-nez v0, :cond_40

    .line 334
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 335
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "device "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, " does not exist or is restricted"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 334
    invoke-direct {v0, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 337
    :cond_40
    invoke-virtual {p2, v0}, Lcom/android/server/usb/UsbUserSettingsManager;->checkPermission(Landroid/hardware/usb/UsbDevice;)V

    .line 338
    invoke-direct {p0, p1}, Lcom/android/server/usb/UsbHostManager;->nativeOpenDevice(Ljava/lang/String;)Landroid/os/ParcelFileDescriptor;
    :try_end_46
    .catchall {:try_start_15 .. :try_end_46} :catchall_12

    move-result-object v0

    monitor-exit v1

    return-object v0
.end method

.method public setCurrentUserSettings(Lcom/android/server/usb/UsbProfileGroupSettingsManager;)V
    .registers 4

    .prologue
    .line 94
    iget-object v0, p0, Lcom/android/server/usb/UsbHostManager;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 95
    :try_start_3
    iput-object p1, p0, Lcom/android/server/usb/UsbHostManager;->mCurrentSettings:Lcom/android/server/usb/UsbProfileGroupSettingsManager;
    :try_end_5
    .catchall {:try_start_3 .. :try_end_5} :catchall_7

    monitor-exit v0

    .line 97
    return-void

    .line 94
    :catchall_7
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method public setUsbDeviceConnectionHandler(Landroid/content/ComponentName;)V
    .registers 4

    .prologue
    .line 106
    iget-object v0, p0, Lcom/android/server/usb/UsbHostManager;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 107
    :try_start_3
    iput-object p1, p0, Lcom/android/server/usb/UsbHostManager;->mUsbDeviceConnectionHandler:Landroid/content/ComponentName;
    :try_end_5
    .catchall {:try_start_3 .. :try_end_5} :catchall_7

    monitor-exit v0

    .line 109
    return-void

    .line 106
    :catchall_7
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method public systemReady()V
    .registers 6

    .prologue
    .line 308
    iget-object v1, p0, Lcom/android/server/usb/UsbHostManager;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 311
    :try_start_3
    new-instance v0, Lcom/android/server/usb/-$Lambda$ATEm4_U2eaRn21cN0eCfdiUt5-k;

    const/4 v2, 0x0

    invoke-direct {v0, v2, p0}, Lcom/android/server/usb/-$Lambda$ATEm4_U2eaRn21cN0eCfdiUt5-k;-><init>(BLjava/lang/Object;)V

    .line 312
    new-instance v2, Ljava/lang/Thread;

    const-string/jumbo v3, "UsbService host thread"

    const/4 v4, 0x0

    invoke-direct {v2, v4, v0, v3}, Ljava/lang/Thread;-><init>(Ljava/lang/ThreadGroup;Ljava/lang/Runnable;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/lang/Thread;->start()V
    :try_end_15
    .catchall {:try_start_3 .. :try_end_15} :catchall_17

    monitor-exit v1

    .line 314
    return-void

    .line 308
    :catchall_17
    move-exception v0

    monitor-exit v1

    throw v0
.end method
